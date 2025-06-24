<template>
  <div class="page-container">
    <h1 v-if="team"><strong>Dein Team:</strong> <span class="team-name">{{ team.name }}</span></h1>
    <h1 v-else>Mein Team</h1>
    <div v-if="loading">Lade Teamdaten...</div>
    <div v-else-if="!team">
      <p>Du bist in keinem Team.</p>
      <button @click="goToTeams">Zu den Teams</button>
    </div>
    <div v-else>
      <h3>Mitglieder</h3>
      <p v-if="memberListError" class="error">{{ memberListError }}</p>
      <table class="members-table">
        <thead>
          <tr>
            <th>Username</th>
            <th>User-ID</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="member in members" :key="member.user_id">
            <td>{{ member.profiles?.username || '-' }}</td>
            <td>{{ member.user_id }}</td>
          </tr>
        </tbody>
      </table>
      <button class="invite-btn" @click="goToInvite">Mitglied einladen</button>
    </div>
  </div>
</template>

<script setup>
import '../style.css'
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()
const loading = ref(true)
const team = ref(null)
const members = ref([])
const memberListError = ref('')

async function fetchMyTeam() {
  loading.value = true
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) {
    loading.value = false
    return
  }
  // Hole das Team des Users
  const { data: memberData } = await supabase
    .from('members')
    .select('team_id')
    .eq('user_id', user.id)
    .single()
  if (!memberData?.team_id) {
    loading.value = false
    return
  }
  // Hole Teamdaten
  const { data: teamData } = await supabase
    .from('teams')
    .select('id, name')
    .eq('id', memberData.team_id)
    .single()
  team.value = teamData

  // Hole Mitglieder über Supabase Function
  const { data, error } = await supabase.functions.invoke('Get-team-Members', {
    body: { teamId: teamData.id }
  })
  if (error) {
    members.value = []
    memberListError.value = `Fehler beim Laden der Mitglieder: ${error.message || error}`
  } else {
    members.value = data.members
    memberListError.value = ''
  }

  loading.value = false
}

function goToTeams() {
  router.push('/teams')
}

function goToInvite() {
  router.push('/invite-member')
}

onMounted(fetchMyTeam)
</script>

<style scoped>
/* leer, alles in style.css */
</style>
