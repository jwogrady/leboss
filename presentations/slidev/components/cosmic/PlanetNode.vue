<template>
  <CosmicNode
    :label="label"
    :sub="sub"
    :size="size"
    bg="rgba(34,197,94,0.35)"
    border-color="rgba(74,222,128,0.8)"
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
  label: 'Planet',
  size: 68,
  fontSize: 11,
  subSize: 9,
})
</script>
