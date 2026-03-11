/**
 * cosmicLayouts.js — Standard orbital layout presets for CosmicSystem.vue
 *
 * Usage in slides:
 *   import { standardLayout } from './cosmicLayouts.js'
 *   <CosmicSystem v-bind="standardLayout" :orbits="[...]" />
 *
 * Or destructure the orbits config for inline use:
 *   :width="standardLayout.width"
 *   :height="standardLayout.height"
 *   :orbits="[{ radius: standardLayout.galaxy.radius, nodes: [...] }]"
 */

/**
 * Full LEBOSS Reference Model — all six elements in three orbits.
 * Container: 520×420, safe for layout: center slides.
 *
 *   Orbit 1 (r=90):  Galaxy — top center (startAngle default -π/2)
 *   Orbit 2 (r=155): Star (right), Planet (left) — startAngle: 0
 *   Orbit 3 (r=200): 4× Moon/Satellite — startAngle: π/4 (diagonal)
 */
export const standardLayout = {
  width: 520,
  height: 420,
  centerSize: 88,
  galaxy: { radius: 90 },
  starPlanet: { radius: 155, startAngle: 0 },
  moonSatellite: { radius: 200, startAngle: Math.PI / 4 },
}

/**
 * Compact single-orbit — governance cycle diagram.
 * Container: 300×300, safe for two-col left-column slides.
 *
 *   Orbit 1 (r=108): up to 6 nodes evenly spaced
 */
export const compactLayout = {
  width: 300,
  height: 300,
  centerSize: 72,
  single: { radius: 108 },
}

/**
 * Wide two-orbit — Galaxy + dual Star/Planet spread.
 * Container: 400×360, safe for layout: center slides with title.
 */
export const wideLayout = {
  width: 400,
  height: 360,
  centerSize: 80,
  galaxy: { radius: 80 },
  starPlanet: { radius: 145, startAngle: 0 },
}
