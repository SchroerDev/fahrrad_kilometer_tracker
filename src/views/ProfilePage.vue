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
      <p>
        <strong>Benutzername:</strong> {{ profile.username }}
      </p>
      <p>
        <strong>Team:</strong> {{ teamName }}
        <button 
          v-if="teamName !== 'Kein Team'" 
          @click="leaveTeam" 
          class="leave-team-btn"
          style="margin-left:1em;"
        >
          Team verlassen
        </button>
      </p>
      <h2>Deine Fahrten</h2>
      <ul v-if="rides.length > 0">
        <li v-for="ride in rides" :key="ride.id">
          {{ formatDate(ride.created_at) }}: {{ ride.km }} km
        </li>
      </ul>
      <p v-else>Keine Fahrten gefunden.</p>
      <button class="delete-account-btn" @click="confirmDeleteAccount">
        Account löschen
      </button>
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
const memberId = ref(null)
const success = ref(null)

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

        

    if (memberData && memberData.team_id) {
        memberId.value = memberData.id
        const { data: teamData } = await supabase
            .from('teams')
            .select('name')
            .eq('id', memberData.team_id)
            .single()

        if (teamData && teamData.name) {
            teamName.value = teamData.name
        } else {
            teamName.value = 'Kein Team'
        }
    } else {
        memberId.value = null
        teamName.value = 'Kein Team'
    }

    // Fahrten laden
    const { data: ridesData } = await supabase
      .from('rides')
      .select('id, created_at, km')
      .eq('user_id', user.id)
      .order('created_at', { ascending: false })

    rides.value = ridesData || []
}

async function leaveTeam() {
  if (!memberId.value) return
  const { error: leaveError } = await supabase
    .from('members')
    .delete()
    .eq('id', memberId.value)
  if (leaveError) {
    error.value = 'Fehler beim Verlassen des Teams: ' + leaveError.message
  } else {
    teamName.value = 'Kein Team'
    memberId.value = null
  }
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

async function deleteAccount() {
  error.value = null
  success.value = null
  // Hier solltest du eine eigene Edge Function aufrufen, die den User löscht!
  const { data: { user } } = await supabase.auth.getUser()
  const { error: funcError } = await supabase.functions.invoke('Delete-user', {
    body: { userId: user.id }
  })
  if (funcError) {
    error.value = 'Fehler beim Löschen des Accounts: ' + funcError.message
  } else {
    success.value = 'Account gelöscht.'
    await supabase.auth.signOut()
    window.location.href = '/login'
  }
}

function confirmDeleteAccount() {
  if (confirm('Bist du sicher, dass du deinen Account unwiderruflich löschen möchtest?')) {
    deleteAccount()
  }
}

onMounted(fetchProfile)
</script>

<style>
.delete-account-btn {
  margin-top: 2rem;
  background: #e74c3c;
  color: #fff;
  border: none;
  border-radius: 8px;
  padding: 0.7em 1.5em;
  font-size: 1em;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.2s;
}
.delete-account-btn:hover {
  background: #c0392b;
}
</style>
