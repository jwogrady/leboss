<!--
  CosmicDivider — section transition background with orbital rings.

  Usage:
    <CosmicDivider title="The Reference Model" subtitle="Six hierarchical elements" />
-->
<template>
  <div class="cosmic-divider relative w-full h-full flex flex-col items-center justify-center overflow-hidden">
    <!-- Background orbital rings -->
    <svg class="absolute inset-0 w-full h-full pointer-events-none" preserveAspectRatio="xMidYMid meet">
      <circle cx="50%" cy="50%" :r="r1" fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="1" />
      <circle cx="50%" cy="50%" :r="r2" fill="none" stroke="rgba(255,255,255,0.04)" stroke-width="1" />
      <circle cx="50%" cy="50%" :r="r3" fill="none" stroke="rgba(255,255,255,0.03)" stroke-width="1" />
    </svg>

    <!-- Center glow dot -->
    <div
      class="absolute rounded-full pointer-events-none"
      :style="{
        width: `${dotSize}px`,
        height: `${dotSize}px`,
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        background: 'rgba(96,165,250,0.15)',
        boxShadow: '0 0 60px 20px rgba(96,165,250,0.1)',
      }"
    />

    <!-- Title and subtitle -->
    <div class="relative z-10 text-center">
      <h2 class="text-3xl font-bold text-white">{{ title }}</h2>
      <p v-if="subtitle" class="mt-3 text-gray-400 text-base">{{ subtitle }}</p>
    </div>
  </div>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  title: string
  subtitle?: string
  r1?: string
  r2?: string
  r3?: string
  dotSize?: number
}>(), {
  r1: '120',
  r2: '220',
  r3: '320',
  dotSize: 80,
})
</script>
