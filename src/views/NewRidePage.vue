<template>
    <v-main>
        <v-container fluid>
            <v-card class="pa-4" elevation="4">
                <v-card-title class="text-h5">Neue Fahrt eintragen</v-card-title>
                <v-card-text>
                    <div ref="mapContainer" style="height: 400px; width: 100%;" class="mb-4"></div>
                    <v-form @submit.prevent="submitRide">
                        <v-row>
                            <v-col cols="12" md="6">
                                <v-text-field v-model="lat" label="Startpunkt (Latitude)" type="number" step="any" readonly prepend-inner-icon="mdi-map-marker-latitude" />
                            </v-col>
                            <v-col cols="12" md="6">
                                <v-text-field v-model="lng" label="Startpunkt (Longitude)" type="number" step="any" readonly prepend-inner-icon="mdi-map-marker-longitude" />
                            </v-col>
                        </v-row>
                        <v-text-field v-model="km" label="Kilometer" type="number" min="0" step="1" required prepend-inner-icon="mdi-road-variant" />
                        <v-btn type="submit" color="primary" block class="mt-3">Speichern</v-btn>
                    </v-form>
                    <v-alert v-if="error" type="error" dense class="mt-4">{{ error }}</v-alert>
                    <v-alert v-if="success" type="success" dense class="mt-4">Fahrt gespeichert!</v-alert>
                </v-card-text>
            </v-card>
        </v-container>
    </v-main>
</template>

<script setup>
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
