<template>
  <CosmicNode
    :label="label"
    :sub="sub"
    :size="size"
    bg="rgba(147,51,234,0.35)"
    border-color="rgba(192,132,252,0.8)"
    :glow="true"
    glow-color="rgba(167,139,250,0.25)"
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
  label: 'Galaxy',
  size: 80,
  fontSize: 12,
  subSize: 10,
})
</script>
