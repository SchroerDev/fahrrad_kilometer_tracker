<template>
    <div class="page-container">
        <h1>🚴 Fahrrad Kilometer App</h1>
        <p>
            Willkommen! Dies ist ein <strong>Testprojekt</strong>, um <strong>Supabase</strong> auszuprobieren.
            Die App wurde mit <strong>Vue.js</strong> entwickelt und dient zum Sammeln und Vergleichen von gefahrenen
            Fahrradkilometern.
        </p>
        <div class="buttons">
            <router-link to="/login"><button>Anmelden</button></router-link>
            <router-link to="/register"><button>Registrieren</button></router-link>
        </div>
    </div>
</template>

<script setup>
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()

onMounted(async () => {
  const { data: { session } } = await supabase.auth.getSession()
  if (session) {
    router.replace('/teams')
  }
})
</script>
