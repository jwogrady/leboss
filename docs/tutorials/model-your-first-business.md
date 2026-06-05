# Model Your First Business with the LEBOSS Reference Model

This tutorial walks you through the first skill you need to use LEBOSS in
practice: mapping a real business onto the six elements of the LEBOSS Reference
Model.

By the end you will have built a complete element map for a hypothetical local
bakery. The same thinking applies to any local business — a dental practice, a
landscaping service, a restaurant — once you have done it with this guided
example.

You will not make any architectural choices. The business is given; your job is
to observe and map. Every step confirms whether you placed each element
correctly and explains why.

This tutorial does not require any software. All you need is a way to take
notes. LEBOSS is a standard, not a tool — there is nothing to install. What you
are learning is a way of thinking, and the Reference Model is its vocabulary:
a way to be precise about who owns what and who is responsible for what.

> The Reference Model is defined once, in
> [`standards/leboss-standard.md` §5](../../standards/leboss-standard.md). This
> tutorial points into that section; it does not restate it. Where this page
> and the standard appear to differ, the standard governs.

---

## Meet Sunrise Bakery

Sunrise Bakery is a sole proprietorship owned by Maria Chen. She has been
operating for four years. Her digital presence looks like this:

- The business is legally registered as **Sunrise Bakery LLC**.
- She has one brand. There are no sub-brands or second business lines.
- Customers order through **sunrisebakery.com** — a website with a built-in
  online ordering form.
- The website is powered by a backend service her developer built: a small
  ordering and inventory system running on a VPS the developer manages on her
  behalf.
- She uses **Square** for in-person payments at the counter.
- She has a **Google Business Profile** showing her hours, address, and reviews.
- Her developer built a custom **analytics module** that lives on the same
  server as the ordering system and produces weekly reports for Maria.
- She uses **Mailchimp** to send a weekly newsletter to customers who opted in.

Keep this picture in mind. Every item on that list will map to a LEBOSS element
by the end of this tutorial.

---

## Step 1 — Identify the Universe

The **Universe** is the root owner: the person, family, or registered legal
entity that owns the entire enterprise and holds ultimate authority over all
data-access decisions. It is not a software construct. It is a legal and
organizational reality.
*(See [`standards/leboss-standard.md` §5.2, Element 0](../../standards/leboss-standard.md).)*

**Ask:** Who ultimately owns this business, its data, and its assets?

For Sunrise Bakery the answer is unambiguous: **Sunrise Bakery LLC**, the
registered legal entity owned by Maria Chen.

> Write down: **Universe = Sunrise Bakery LLC**

One Universe. One data-sovereignty anchor. Everything else is owned by — or
exists in explicitly authorized relationship to — this entity.

---

## Step 2 — Identify the Galaxy (or Galaxies)

A **Galaxy** is an individual brand, business line, or operating company within
the Universe. A Universe with a single brand has a single Galaxy.
*(See [`standards/leboss-standard.md` §5.2, Element 1](../../standards/leboss-standard.md).)*

**Ask:** Are there distinct brands, separate DBAs, or separate business lines
under this Universe? Each distinct venture is a Galaxy.

Maria operates one brand — Sunrise Bakery. There is no catering sub-brand and no
second shop.

> Write down: **Galaxy = Sunrise Bakery (the brand)**

If Maria later opened a second brand — say, a coffee subscription service — that
would be a second Galaxy under the same Universe. For now, one Galaxy.

---

## Step 3 — Map each customer-facing interface to a Star

A **Star** is the customer-facing interface: anything the outside world touches
to interact with the business. Websites, booking portals, ordering apps, and
kiosks are all Stars.
*(See [`standards/leboss-standard.md` §5.2, Element 2](../../standards/leboss-standard.md).)*

**Ask:** What does a customer (or external partner) actually interact with?

For Sunrise Bakery:

- **sunrisebakery.com** is a Star. Customers browse, order, and get information
  here.

The Square point-of-sale terminal is an external service Maria connects to, not
a Star she owns — we handle it in Step 6. The Google Business Profile is also an
external platform — Step 6.

> Write down: **Star A = sunrisebakery.com (online ordering website)**

**Rule check:** A customer interface must be supported by at least one backend
service.
*(See [`standards/leboss-standard.md` §5.4, dependency rule 2](../../standards/leboss-standard.md).)*
You have not mapped that backend yet — that is Step 4. Continue.

---

## Step 4 — Map each backend service to a Planet and pair it with its Star

A **Planet** is the backend service that powers a Star. It holds the business
logic, data persistence, and operational functionality, and it holds the
business's primary operational data. A Planet must serve at least one Star.
*(See [`standards/leboss-standard.md` §5.2, Element 3](../../standards/leboss-standard.md).)*

**Ask:** What powers each Star? What system actually stores orders, manages
inventory, authenticates customers, and does the work?

For Sunrise Bakery, the ordering and inventory system on Maria's
developer-managed VPS powers sunrisebakery.com.

> Write down: **Planet A = Ordering & Inventory System (powers Star A)**

**Dependency rules satisfied:** Star A now has a Planet, and Planet A serves
Star A.
*(See [`standards/leboss-standard.md` §5.4, dependency rules 1 and 2](../../standards/leboss-standard.md).)*

**Ownership note:** The Planet holds Maria's customer records, order history,
and inventory data. Under LEBOSS this is **primary operational data**, owned by
the Universe (Sunrise Bakery LLC). The developer who manages the VPS is a
**service provider**, not the owner of this data.
*(See [`standards/leboss-standard.md` §6.1 and §7.0](../../standards/leboss-standard.md).)*

---

## Step 5 — Identify company-owned internal capabilities as Moons

A **Moon** is a company-owned, company-operated internal capability — a natural
satellite — that operates within a single Galaxy's data boundary. The defining
trait: the business retains full operational control.
*(See [`standards/leboss-standard.md` §5.2, Element 4](../../standards/leboss-standard.md).)*

**Ask:** Are there internal tools, analytics systems, workflow engines, or
reporting modules that the business owns and operates itself — running on
infrastructure it authorizes, not on a third-party platform?

For Sunrise Bakery, the custom analytics module the developer built, running on
the same server as the ordering system, qualifies. It is company-owned and
company-operated, and it provides a specialized capability (reporting) without
depending on an external platform.

> Write down: **Moon A = Custom Analytics Module (company-owned reporting)**

**The distinction that matters:** Maria's developer built and operates this
module within the business's own boundary. If it were instead a third-party
analytics SaaS that Maria connected to, it would be a Satellite (Step 6). The
Moon/Satellite line is about who controls the infrastructure and whose data
boundary the capability sits inside.

---

## Step 6 — Identify third-party integrations as Satellites

A **Satellite** is an artificial satellite: a connection to a third-party
platform or external service operated outside the business's direct control.
Satellites carry the greatest data-sovereignty risk in the model. A Satellite
must be explicitly authorized before it may receive any data, and the data that
flows through it must be logged.
*(See [`standards/leboss-standard.md` §5.2, Element 5](../../standards/leboss-standard.md),
the access rule LEBOSS-ACC-5, and
[§5.4, dependency rule 4](../../standards/leboss-standard.md).)*

**Ask:** Which services does the business connect to that someone else operates?
Third-party platforms, payment processors, social profiles, marketing tools?

For Sunrise Bakery:

- **Square** — payment processing, operated by Square
- **Google Business Profile** — search listing, operated by Google
- **Mailchimp** — email marketing, operated by its vendor

> Write down:
> - **Satellite A = Square (payment processing)**
> - **Satellite B = Google Business Profile (search/reviews)**
> - **Satellite C = Mailchimp (email marketing)**

**Sovereignty note:** Each Satellite is a point where Maria's operational data —
customer contact information, purchase history, the email list — flows to
infrastructure she does not control. Under LEBOSS, each must be explicitly
authorized by the governing entity before it receives any data, and the flows
must be auditable. The how-to guide
[Map a third-party integration (Satellite)](../how-to/map-a-satellite-conformantly.md)
walks through the governance objects that make that authorization real.

---

## Check your map against the dependency rules

Before finishing, verify your map satisfies the dependency rules from the
Reference Model.
*(See [`standards/leboss-standard.md` §5.4](../../standards/leboss-standard.md).)*

| Dependency rule | Check |
|---|---|
| A backend service serves at least one customer interface | Planet A serves Star A. Satisfied. |
| A customer interface is supported by at least one backend service | Star A is supported by Planet A. Satisfied. |
| An internal capability operates within one brand entity's data boundary | Moon A is within the Sunrise Bakery Galaxy. Satisfied. |
| An external integration is explicitly authorized before receiving data | Satellites A, B, and C must be authorized. Noted as a requirement for any real implementation. |
| A brand entity belongs to exactly one governing entity | The Sunrise Bakery Galaxy belongs to Sunrise Bakery LLC. Satisfied. |
| A customer interface belongs to exactly one brand entity | Star A belongs to the Sunrise Bakery Galaxy. Satisfied. |

The Satellite row is the only one you cannot mark "satisfied" from the map
alone. That is expected: authorization is an operational fact, not a structural
one. On paper you have placed the Satellites correctly; in a built system you
would also have to grant and log their access. That is precisely the work the
Satellite how-to guide covers.

---

## What you just built

Here is the completed element map for Sunrise Bakery:

```
Universe:     Sunrise Bakery LLC
  Galaxy:     Sunrise Bakery (brand)
    Star A:   sunrisebakery.com
    Planet A: Ordering & Inventory System   ← powers Star A
    Moon A:   Custom Analytics Module        ← company-owned reporting
    Sat A:    Square                         ← third-party, explicit auth required
    Sat B:    Google Business Profile        ← third-party, explicit auth required
    Sat C:    Mailchimp                      ← third-party, explicit auth required
```

Every item on the original list now has a place. Nothing is ambiguous. Ownership
is visible.

This is the first thing LEBOSS buys you: clarity. Before you can enforce
ownership or audit access, you have to be able to *see* the structure. You just
built that view.

---

## Where to go next

- **Read the Reference Model in full** —
  [`standards/leboss-standard.md` §5](../../standards/leboss-standard.md),
  including the §5.1 naming disclaimer (you may use any internal names; the
  structure is what must match) and the complete §5.4 dependency rules.
- **Learn what primary operational data is** —
  [`standards/leboss-standard.md` §6.1](../../standards/leboss-standard.md),
  which defines the data LEBOSS protects.
- **Govern a Satellite properly** —
  [How to map a third-party integration (Satellite)](../how-to/map-a-satellite-conformantly.md).
- **Look up an element, tier, or rule code** —
  [Normative structure reference](../reference/normative-structure.md).
- **Understand why the model is shaped this way** —
  [Why the orbital model](../explanation/why-the-orbital-model.md) and
  [`docs/PHILOSOPHY.md`](../PHILOSOPHY.md).
- **See it visually** — start at <https://leboss.status26.com/> for a walk
  through the Reference Model.
