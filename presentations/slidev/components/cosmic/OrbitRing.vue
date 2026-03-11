<template>
  <div
    class="orbit-ring absolute rounded-full pointer-events-none"
    :style="{
      width: `${size}px`,
      height: `${size}px`,
      top: '50%',
      left: '50%',
      transform: 'translate(-50%, -50%)',
      border: `1px solid rgba(255,255,255,${opacity})`,
    }"
  />
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  size: number
  opacity?: number
}>(), {
  opacity: 0.08,
})
</script>
