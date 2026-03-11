<template>
  <CosmicNode
    :label="label"
    :sub="sub"
    :size="size"
    bg="rgba(59,130,246,0.35)"
    border-color="rgba(96,165,250,0.8)"
    :glow="true"
    glow-color="rgba(96,165,250,0.3)"
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
  label: 'Universe',
  size: 100,
  fontSize: 13,
  subSize: 10,
})
</script>
