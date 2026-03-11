<!-- Base node component — used internally by all named nodes -->
<template>
  <div
    class="cosmic-node flex flex-col items-center justify-center text-center rounded-full select-none"
    :style="{
      width: `${size}px`,
      height: `${size}px`,
      background: bg,
      border: `2px solid ${borderColor}`,
      boxShadow: glow ? `0 0 18px 4px ${glowColor}` : 'none',
      fontSize: `${fontSize}px`,
      flexShrink: 0,
    }"
  >
    <slot>
      <span class="font-semibold leading-tight px-1 text-white" :style="{ fontSize: `${fontSize}px` }">{{ label }}</span>
      <span v-if="sub" class="opacity-60 leading-tight px-1" :style="{ fontSize: `${subSize}px` }">{{ sub }}</span>
    </slot>
  </div>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  label?: string
  sub?: string
  size?: number
  bg?: string
  borderColor?: string
  glow?: boolean
  glowColor?: string
  fontSize?: number
  subSize?: number
}>(), {
  size: 72,
  bg: 'rgba(255,255,255,0.1)',
  borderColor: 'rgba(255,255,255,0.3)',
  glow: false,
  glowColor: 'rgba(255,255,255,0.2)',
  fontSize: 11,
  subSize: 9,
})
</script>
