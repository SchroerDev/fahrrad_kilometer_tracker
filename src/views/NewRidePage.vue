<template>
  <div class="page-container">
    <h1>Neue Fahrt eintragen</h1>
    <div ref="mapContainer" class="ride-map"></div>
    <form @submit.prevent="submitRide">
      <label>
        Startpunkt (Latitude):
        <input type="number" v-model="lat" step="any" required />
      </label>
      <label>
        Startpunkt (Longitude):
        <input type="number" v-model="lng" step="any" required />
      </label>
      <label>
        Kilometer:
        <input type="number" v-model="km" min="0" step="0.1" required />
      </label>
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
    style: 'https://tiles.stadiamaps.com/styles/osm_bright.json',
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
  const startPoint = `SRID=4326;POINT(${lng.value} ${lat.value})`
  const { error: insertError } = await supabase.from('rides').insert([{
    user_id: user.id,
    km: parseFloat(km.value),
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

<style scoped>
.new-ride-page {
  max-width: 400px;
  margin: 2rem auto;
}
.ride-map {
  width: 100%;
  height: 300px;
  margin-bottom: 1.5rem;
  border-radius: 8px;
  overflow: hidden;
  border: 1px solid #ccc;
}
label {
  display: block;
  margin-bottom: 1rem;
}
input {
  width: 100%;
  padding: 0.5rem;
  margin-top: 0.25rem;
}
button {
  padding: 0.5rem 1rem;
  background-color: #42b883;
  color: white;
  border: none;
  border-radius: 4px;
}
.error {
  color: red;
  margin-top: 1rem;
}
.success {
  color: green;
  margin-top: 1rem;
}
</style>