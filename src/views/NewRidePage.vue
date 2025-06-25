<template>
  <div class="page-container">
    <h1>Neue Fahrt eintragen</h1>
    <div ref="mapContainer" class="ride-map"></div>
    <form @submit.prevent="submitRide">
      <div class="coords-row">
        <label>
          Startpunkt (Latitude):
          <input
            type="number"
            v-model="lat"
            step="any"
            readonly
            class="coord-input"
          />
        </label>
        <label>
          Startpunkt (Longitude):
          <input
            type="number"
            v-model="lng"
            step="any"
            readonly
            class="coord-input"
          />
        </label>
      </div>
      <div class="km-row">
        <label>
          Kilometer:
          <input
            type="number"
            v-model="km"
            min="0"
            step="1"
            required
            class="coord-input"
          />
        </label>
      </div>
      <button type="submit">Speichern</button>
    </form>
    <p v-if="error" class="error">{{ error }}</p>
    <p v-if="success" class="success">Fahrt gespeichert!</p>
  </div>
</template>

<script setup>
import '../style.css'
import { ref, onMounted } from 'vue'
import { supabase } from '../supabaseClient'
import maplibregl from 'maplibre-gl'
import 'maplibre-gl/dist/maplibre-gl.css'

const lat = ref('')
const lng = ref('')
const km = ref('')
const error = ref('')
const success = ref(false)
const mapContainer = ref(null)
let marker = null

onMounted(() => {
  const map = new maplibregl.Map({
    container: mapContainer.value,
    style: {
      version: 8,
      sources: {
        osm: {
          type: 'raster',
          tiles: [
            'https://a.tile.openstreetmap.org/{z}/{x}/{y}.png',
            'https://b.tile.openstreetmap.org/{z}/{x}/{y}.png',
            'https://c.tile.openstreetmap.org/{z}/{x}/{y}.png'
          ],
          tileSize: 256,
          attribution: '© OpenStreetMap contributors'
        }
      },
      layers: [
        {
          id: 'osm',
          type: 'raster',
          source: 'osm'
        }
      ]
    },
    center: [10.4515, 51.1657],
    zoom: 6
  })

  map.on('click', function(e) {
    lat.value = e.lngLat.lat
    lng.value = e.lngLat.lng
    if (marker) {
      marker.setLngLat([e.lngLat.lng, e.lngLat.lat])
    } else {
      marker = new maplibregl.Marker()
        .setLngLat([e.lngLat.lng, e.lngLat.lat])
        .addTo(map)
    }
  })
})

const submitRide = async () => {
  error.value = ''
  success.value = false
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) {
    error.value = 'Nicht eingeloggt.'
    return
  }
  if (!lat.value || !lng.value) {
    error.value = 'Bitte wähle einen Startpunkt auf der Karte.'
    return
  }
  if (!km.value || parseInt(km.value, 10) <= 1) {
    error.value = 'Bitte gib mindestens 2 Kilometer ein.'
    return
  }
  const startPoint = `SRID=4326;POINT(${lng.value} ${lat.value})`
  const { error: insertError } = await supabase.from('rides').insert([{
    user_id: user.id,
    km: parseInt(km.value, 10),
    StartPoint: startPoint
  }])
  if (insertError) {
    error.value = insertError.message
  } else {
    success.value = true
    lat.value = ''
    lng.value = ''
    km.value = ''
    if (marker) {
      marker.remove()
      marker = null
    }
  }
}
</script>



