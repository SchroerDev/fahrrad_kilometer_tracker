<template>
  <v-main>
    <v-container
      class="d-flex align-center justify-center"
      style="min-height: calc(80vh - 64px)"
      fluid
    >
      <v-row justify="center">
        <v-col cols="12" sm="10" md="8">
          <v-card class="pa-4 text-center" elevation="6">
            <v-card-title class="text-h4">🚴 Fahrrad Kilometer App</v-card-title>
            <v-card-text class="text-h6">
              Willkommen! Dies ist ein <strong>Testprojekt</strong>, um
              <strong>Supabase</strong> auszuprobieren. Die App wurde mit
              <strong>Vue.js</strong> entwickelt und dient zum Sammeln und Vergleichen von
              gefahrenen Fahrradkilometern.
            </v-card-text>
            <v-card-actions class="justify-center">
              <v-btn color="primary" to="/login" class="mx-2">Anmelden</v-btn>
              <v-btn color="secondary" to="/register" class="mx-2">Registrieren</v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script setup>
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()

onMounted(async () => {
  const {
    data: { session },
  } = await supabase.auth.getSession()
  if (session) {
    router.replace('/teams')
  }
})
</script>
