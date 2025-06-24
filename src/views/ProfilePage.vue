<template>
  <div class="page-container">
    <h1>👤 Profil</h1>
    <div v-if="error" class="error">{{ error }}</div>
    <div v-else-if="!profile">
      Lade Profil...
    </div>
    <div v-else>
      <div v-if="!emailConfirmed" class="warning">
        Bitte bestätige deine E-Mail-Adresse, um alle Funktionen nutzen zu können.
      </div>
      <p><strong>Benutzername:</strong> {{ profile.username }}</p>
      <p><strong>Team:</strong> {{ teamName }}</p>
      <h2>Deine Fahrten</h2>
      <ul v-if="rides.length > 0">
        <li v-for="ride in rides" :key="ride.id">
          {{ formatDate(ride.created_at) }}: {{ ride.km }} km
        </li>
      </ul>
      <p v-else>Keine Fahrten gefunden.</p>
    </div>
  </div>
</template>

<script setup>
import '../style.css'
import { ref, onMounted } from 'vue'
import { supabase } from '../supabaseClient'

const profile = ref(null)
const teamName = ref('Kein Team')
const error = ref(null)
const rides = ref([])
const emailConfirmed = ref(true)

const fetchProfile = async () => {
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    if (userError || !user) {
        error.value = 'Nicht eingeloggt.'
        return
    }

    // Prüfen, ob E-Mail bestätigt ist
    emailConfirmed.value = user.email_confirmed_at !== null

    const { data: profileData, error: profileError } = await supabase
        .from('profiles')
        .select('username')
        .eq('id', user.id)
        .single()

    if (profileError) {
        error.value = 'Profil nicht gefunden.'
        return
    }

    profile.value = profileData

    const { data: memberData } = await supabase
        .from('members')
        .select('team_id')
        .eq('user_id', user.id)
        .single()

    if (memberData?.team_id) {
        const { data: teamData } = await supabase
            .from('teams')
            .select('name')
            .eq('id', memberData.team_id)
            .single()

        if (teamData?.name) {
            teamName.value = teamData.name
        }
    }

    // Fahrten laden
    const { data: ridesData } = await supabase
      .from('rides')
      .select('id, created_at, km')
      .eq('user_id', user.id)
      .order('created_at', { ascending: false })

    rides.value = ridesData || []
}

function formatDate(dateString) {
  const date = new Date(dateString)
  const day = String(date.getDate()).padStart(2, '0')
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const year = date.getFullYear()
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')
  return `${day}.${month}.${year} ${hours}:${minutes}`
}

onMounted(fetchProfile)
</script>
