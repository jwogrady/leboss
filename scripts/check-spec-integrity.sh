#!/usr/bin/env bash
#
# check-spec-integrity.sh — mechanical integrity checks for the LEBOSS standard.
#
# Guards the headline invariants the whole project rests on:
#   1. The rule register defines exactly 115 rules across 19 groups.
#   2. The 19 groups used by defined rules match the 19 groups declared in the
#      register's "Rule Numbering" section.
#   3. Every rule ID referenced by a non-conformance condition in conformance.md
#      resolves to a rule actually defined somewhere in the normative corpus
#      (the register or one of the incorporated protocol documents).
#   4. STATUS.md's stated rule/group counts agree with the register.
#
# Exits non-zero on the first failed invariant. No dependencies beyond coreutils.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REGISTER="$ROOT/standards/leboss-normative-rules.md"
CONFORMANCE="$ROOT/standards/conformance.md"
STATUS="$ROOT/STATUS.md"
PROTOCOLS=(
  "$ROOT/standards/leboss-access-grant-protocol.md"
  "$ROOT/standards/leboss-integration-protocol.md"
  "$ROOT/standards/leboss-audit-protocol.md"
  "$ROOT/standards/leboss-data-portability-protocol.md"
)

EXPECTED_RULES=115
EXPECTED_GROUPS=19

fail() { echo "FAIL: $*" >&2; exit 1; }
pass() { echo "  ok: $*"; }

echo "LEBOSS spec integrity check"
echo "==========================="

# --- 1. Exactly 115 defined rules in the register -----------------------------
rule_count="$(grep -cE '^\*\*LEBOSS-[A-Z]+-[0-9]+\*\*' "$REGISTER")"
[ "$rule_count" -eq "$EXPECTED_RULES" ] \
  || fail "register defines $rule_count rules, expected $EXPECTED_RULES"
pass "register defines exactly $EXPECTED_RULES rules"

# --- 2. Exactly 19 defined groups, matching the declared numbering -------------
defined_groups="$(grep -oE '^\*\*LEBOSS-[A-Z]+-[0-9]+' "$REGISTER" \
  | sed -E 's/^\*\*LEBOSS-([A-Z]+)-[0-9]+/\1/' | sort -u)"
defined_group_count="$(printf '%s\n' "$defined_groups" | grep -c .)"
[ "$defined_group_count" -eq "$EXPECTED_GROUPS" ] \
  || fail "defined rules span $defined_group_count groups, expected $EXPECTED_GROUPS"
pass "defined rules span exactly $EXPECTED_GROUPS groups"

# Groups declared in the "Rule Numbering" bullet list (lines like: - `OWN` — ...)
declared_groups="$(grep -oE '^- `[A-Z]+`' "$REGISTER" \
  | sed -E 's/^- `([A-Z]+)`/\1/' | sort -u)"
if [ "$(printf '%s\n' "$declared_groups" | grep -c .)" -ne "$EXPECTED_GROUPS" ]; then
  fail "Rule Numbering section declares $(printf '%s\n' "$declared_groups" | grep -c .) groups, expected $EXPECTED_GROUPS"
fi
if [ "$defined_groups" != "$declared_groups" ]; then
  echo "defined groups:  $(echo $defined_groups)" >&2
  echo "declared groups: $(echo $declared_groups)" >&2
  fail "defined rule groups do not match the declared Rule Numbering list"
fi
pass "defined groups match the declared Rule Numbering list"

# --- 3. Build the universe of valid rule IDs (register + protocols) ------------
valid_ids="$(grep -hoE '^\*\*LEBOSS-[A-Z]+-[0-9]+' "$REGISTER" "${PROTOCOLS[@]}" \
  | sed -E 's/^\*\*//' | sort -u)"

# Every rule ID referenced in conformance.md must resolve to a defined rule.
missing=0
while IFS= read -r ref; do
  [ -z "$ref" ] && continue
  if ! printf '%s\n' "$valid_ids" | grep -qxF "$ref"; then
    echo "  unresolved rule reference in conformance.md: $ref" >&2
    missing=1
  fi
done < <(grep -oE 'LEBOSS-[A-Z]+-[0-9]+' "$CONFORMANCE" | sort -u)
[ "$missing" -eq 0 ] || fail "conformance.md references rule IDs that are not defined anywhere"
pass "every rule ID referenced in conformance.md resolves to a defined rule"

# --- 4. STATUS.md counts agree with the register ------------------------------
grep -qE "\b$EXPECTED_RULES\b normative rules" "$STATUS" \
  || fail "STATUS.md does not state '$EXPECTED_RULES normative rules'"
grep -qE "\b$EXPECTED_GROUPS\b rule groups" "$STATUS" \
  || fail "STATUS.md does not state '$EXPECTED_GROUPS rule groups'"
pass "STATUS.md counts agree with the register ($EXPECTED_RULES rules / $EXPECTED_GROUPS groups)"

echo "==========================="
echo "All spec integrity checks passed."
