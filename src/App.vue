<template>
  <v-app>
    <NavBar />
    <router-view />
    <v-banner v-if="!isOnline" color="warning" icon="mdi-wifi-off">
      Du bist offline. Neue Fahrten werden gespeichert und synchronisiert, sobald du wieder online bist.
    </v-banner>
  </v-app>
</template>

<script setup>
import NavBar from './components/NavBar.vue'
import { ref, onMounted } from 'vue'

const isOnline = ref(navigator.onLine)

onMounted(() => {
  window.addEventListener('online', () => (isOnline.value = true))
  window.addEventListener('offline', () => (isOnline.value = false))
})
</script>
