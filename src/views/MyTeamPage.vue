<template>
  <div class="my-team-page">
    <h1>Mein Team</h1>
    <div v-if="loading">Lade Teamdaten...</div>
    <div v-else-if="!team">
      <p>Du bist in keinem Team.</p>
      <button @click="goToTeams">Zu den Teams</button>
    </div>
    <div v-else>
      <h2>{{ team.name }}</h2>
      <h3>Mitglieder</h3>
      <ul>
        <li v-for="member in members" :key="member.id">
          {{ member.username || member.email }}
        </li>
      </ul>
      <h3>Mitglied einladen</h3>
      <form @submit.prevent="inviteMember">
        <label>
          E-Mail-Adresse:
          <input type="email" v-model="inviteEmail" required />
        </label>
        <button type="submit">Einladen</button>
      </form>
      <p v-if="inviteSuccess" class="success">Einladung verschickt!</p>
      <p v-if="inviteError" class="error">{{ inviteError }}</p>
      <h4>Oder teile diesen Link:</h4>
      <input type="text" :value="inviteLink" readonly style="width:100%;" @focus="$event.target.select()" />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()
const loading = ref(true)
const team = ref(null)
const members = ref([])
const inviteEmail = ref('')
const inviteSuccess = ref(false)
const inviteError = ref('')
const inviteLink = ref('')

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
    body: { name: 'Functions', teamId: teamData.id }
  })
  if (error) {
    members.value = []
    inviteError.value = `Fehler beim Laden der Mitglieder: ${error.message || error}`
  } else {
    members.value = data.members
    inviteError.value = ''
  }

  // Einladung-Link generieren
  inviteLink.value = `${window.location.origin}/join-team/${teamData.id}`
  loading.value = false
}

async function inviteMember() {
  inviteSuccess.value = false
  inviteError.value = ''
  // Hier könntest du eine Einladung per E-Mail verschicken (z.B. über Supabase Functions oder externen Service)
  // Für Demo: Zeige einfach Erfolg an
  inviteSuccess.value = true
  inviteEmail.value = ''
}

function goToTeams() {
  router.push('/teams')
}

onMounted(fetchMyTeam)
</script>

<style scoped>
.my-team-page {
  max-width: 500px;
  margin: 2rem auto;
}
ul {
  padding-left: 0;
  list-style-position: inside;
  text-align: left;
}
li {
  margin-bottom: 0.5rem;
}
input[type="email"], input[type="text"] {
  width: 100%;
  padding: 0.5rem;
  margin-top: 0.25rem;
  margin-bottom: 1rem;
}
button {
  padding: 0.5rem 1rem;
  background-color: #42b883;
  color: white;
  border: none;
  border-radius: 4px;
}
.success {
  color: green;
  margin-top: 1rem;
}
.error {
  color: red;
  margin-top: 1rem;
}
</style>