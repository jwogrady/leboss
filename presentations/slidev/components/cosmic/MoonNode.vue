<template>
  <CosmicNode
    :label="label"
    :sub="sub"
    :size="size"
    bg="rgba(99,102,241,0.35)"
    border-color="rgba(129,140,248,0.8)"
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
  label: 'Moon',
  size: 60,
  fontSize: 10,
  subSize: 9,
})
</script>
