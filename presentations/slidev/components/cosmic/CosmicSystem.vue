<!--
  CosmicSystem — orbital diagram layout engine.

  Usage:
    <CosmicSystem :orbits="[...orbitDefs]" :width="500" :height="400" />

  orbitDefs is an array of orbit layers. Each layer has:
    - radius: orbital radius in px from center
    - nodes: array of { label, sub?, type, color?, borderColor?, size? }

  Example:
    <CosmicSystem
      center-label="Universe"
      center-sub="Business Owner"
      :orbits="[
        {
          radius: 120,
          nodes: [{ label: 'Galaxy', type: 'galaxy', sub: 'Brand' }]
        },
        {
          radius: 220,
          nodes: [
            { label: 'Star', type: 'star', sub: 'Website' },
            { label: 'Planet', type: 'planet', sub: 'Backend' },
          ]
        },
        {
          radius: 310,
          nodes: [
            { label: 'Moon', type: 'moon', sub: 'Analytics' },
            { label: 'Satellite', type: 'satellite', sub: 'Stripe' },
          ]
        }
      ]"
    />
-->
<template>
  <div
    class="cosmic-system relative flex items-center justify-center"
    :style="{ width: `${width}px`, height: `${height}px` }"
  >
    <!-- Starfield -->
    <svg
      v-if="starfield"
      class="absolute inset-0 pointer-events-none"
      :width="width"
      :height="height"
    >
      <circle
        v-for="star in stars"
        :key="star.id"
        :cx="star.x"
        :cy="star.y"
        :r="star.r"
        :opacity="star.o"
        fill="white"
      />
    </svg>

    <!-- Orbit rings -->
    <svg
      class="absolute inset-0 pointer-events-none"
      :width="width"
      :height="height"
    >
      <circle
        v-for="orbit in orbits"
        :key="orbit.radius"
        :cx="cx"
        :cy="cy"
        :r="orbit.radius"
        fill="none"
        stroke="rgba(255,255,255,0.07)"
        stroke-width="1"
        :stroke-dasharray="orbit.dashed ? '4 6' : 'none'"
      />
    </svg>

    <!-- Connector lines from center to each node -->
    <svg
      v-if="showConnectors"
      class="absolute inset-0 pointer-events-none"
      :width="width"
      :height="height"
    >
      <line
        v-for="conn in connectorLines"
        :key="conn.id"
        :x1="cx"
        :y1="cy"
        :x2="conn.x"
        :y2="conn.y"
        stroke="rgba(255,255,255,0.06)"
        stroke-width="1"
      />
    </svg>

    <!-- Center node -->
    <div
      class="absolute"
      :style="{ left: `${cx}px`, top: `${cy}px`, transform: 'translate(-50%, -50%)' }"
    >
      <div
        class="flex flex-col items-center justify-center rounded-full text-center"
        :style="{
          width: `${centerSize}px`,
          height: `${centerSize}px`,
          background: 'rgba(59,130,246,0.4)',
          border: '2px solid rgba(96,165,250,0.85)',
          boxShadow: '0 0 24px 6px rgba(96,165,250,0.25)',
          fontSize: '13px',
        }"
      >
        <span class="font-bold text-white leading-tight px-1">{{ centerLabel }}</span>
        <span v-if="centerSub" class="text-blue-200 leading-tight px-1" style="font-size:10px">{{ centerSub }}</span>
      </div>
    </div>

    <!-- Orbit nodes -->
    <template v-for="(orbit, oi) in orbits" :key="oi">
      <div
        v-for="(node, ni) in orbit.nodes"
        :key="`${oi}-${ni}`"
        class="absolute"
        :style="nodeStyle(orbit, ni)"
      >
        <div
          class="flex flex-col items-center justify-center rounded-full text-center"
          :style="nodeCircleStyle(node)"
        >
          <span class="font-semibold text-white leading-tight px-1" :style="{ fontSize: `${nodeFontSize(node)}px` }">{{ node.label }}</span>
          <span v-if="node.sub" class="leading-tight px-1 opacity-70 text-white" style="font-size:9px">{{ node.sub }}</span>
        </div>
      </div>
    </template>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

interface OrbitNode {
  label: string
  sub?: string
  type?: 'universe' | 'galaxy' | 'star' | 'planet' | 'moon' | 'satellite' | 'custom'
  color?: string
  borderColor?: string
  size?: number
}

interface OrbitDef {
  radius: number
  nodes: OrbitNode[]
  dashed?: boolean
  startAngle?: number
}

const props = withDefaults(defineProps<{
  width?: number
  height?: number
  centerLabel?: string
  centerSub?: string
  centerSize?: number
  orbits?: OrbitDef[]
  starfield?: boolean
  showConnectors?: boolean
}>(), {
  width: 500,
  height: 420,
  centerLabel: 'Universe',
  centerSize: 96,
  orbits: () => [],
  starfield: true,
  showConnectors: false,
})

const cx = computed(() => props.width / 2)
const cy = computed(() => props.height / 2)

// Deterministic starfield
const stars = computed(() => {
  const result = []
  for (let i = 0; i < 60; i++) {
    const seed = i * 7919
    result.push({
      id: i,
      x: ((seed * 13) % props.width),
      y: ((seed * 17) % props.height),
      r: (i % 3 === 0) ? 1 : 0.5,
      o: 0.05 + (i % 5) * 0.03,
    })
  }
  return result
})

const connectorLines = computed(() => {
  const lines: { id: string; x: number; y: number }[] = []
  props.orbits.forEach((orbit, oi) => {
    orbit.nodes.forEach((_, ni) => {
      const pos = nodePosition(orbit, ni)
      lines.push({ id: `${oi}-${ni}`, x: pos.x, y: pos.y })
    })
  })
  return lines
})

function nodePosition(orbit: OrbitDef, ni: number) {
  const count = orbit.nodes.length
  const startAngle = orbit.startAngle ?? -Math.PI / 2
  const angleStep = count > 1 ? (2 * Math.PI) / count : 0
  const angle = startAngle + ni * angleStep
  return {
    x: cx.value + orbit.radius * Math.cos(angle),
    y: cy.value + orbit.radius * Math.sin(angle),
  }
}

function nodeStyle(orbit: OrbitDef, ni: number) {
  const node = orbit.nodes[ni]
  const sz = nodeSize(node)
  const pos = nodePosition(orbit, ni)
  return {
    left: `${pos.x}px`,
    top: `${pos.y}px`,
    transform: 'translate(-50%, -50%)',
  }
}

const TYPE_COLORS: Record<string, { bg: string; border: string; glow?: string }> = {
  galaxy: { bg: 'rgba(147,51,234,0.4)', border: 'rgba(192,132,252,0.85)', glow: 'rgba(167,139,250,0.2)' },
  star: { bg: 'rgba(234,179,8,0.4)', border: 'rgba(250,204,21,0.85)' },
  planet: { bg: 'rgba(34,197,94,0.4)', border: 'rgba(74,222,128,0.85)' },
  moon: { bg: 'rgba(99,102,241,0.4)', border: 'rgba(129,140,248,0.85)' },
  satellite: { bg: 'rgba(239,68,68,0.4)', border: 'rgba(248,113,113,0.85)' },
  custom: { bg: 'rgba(255,255,255,0.1)', border: 'rgba(255,255,255,0.4)' },
}

function nodeCircleStyle(node: OrbitNode) {
  const sz = nodeSize(node)
  const typeKey = node.type ?? 'custom'
  const colors = TYPE_COLORS[typeKey] ?? TYPE_COLORS.custom
  const bg = node.color ?? colors.bg
  const border = node.borderColor ?? colors.border
  const glow = colors.glow ? `0 0 12px 3px ${colors.glow}` : 'none'
  return {
    width: `${sz}px`,
    height: `${sz}px`,
    background: bg,
    border: `2px solid ${border}`,
    boxShadow: glow,
  }
}

function nodeSize(node: OrbitNode): number {
  if (node.size) return node.size
  const defaults: Record<string, number> = {
    galaxy: 76, star: 64, planet: 64, moon: 56, satellite: 56, custom: 60,
  }
  return defaults[node.type ?? 'custom'] ?? 60
}

function nodeFontSize(node: OrbitNode): number {
  const sz = nodeSize(node)
  return sz >= 76 ? 12 : sz >= 64 ? 11 : 10
}
</script>
