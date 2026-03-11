<template>
  <CosmicNode
    :label="label"
    :sub="sub"
    :size="size"
    bg="rgba(239,68,68,0.35)"
    border-color="rgba(248,113,113,0.8)"
    :font-size="fontSize"
    :sub-size="subSize"
  />
</template>

<script setup lang="ts">
import CosmicNode from './CosmicNode.vue'

withDefaults(defineProps<{
  label?: string
  sub?: string
  size?: number
  fontSize?: number
  subSize?: number
}>(), {
  label: 'Satellite',
  size: 60,
  fontSize: 10,
  subSize: 9,
})
</script>
