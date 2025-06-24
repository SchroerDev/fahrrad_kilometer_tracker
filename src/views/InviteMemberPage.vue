<template>
  <div class="invite-member-page">
    <h1>Mitglied einladen</h1>
    <p>Du kannst ein Teammitglied per E-Mail einladen oder den Beitrittslink teilen.</p>
    <form @submit.prevent="invite">
      <label>
        E-Mail-Adresse:
        <input type="email" v-model="email" required />
      </label>
      <button type="submit">Einladung senden</button>
    </form>
    <p v-if="success" class="success">Einladung verschickt!</p>
    <p v-if="error" class="error">{{ error }}</p>
    <h3>Beitrittslink</h3>
    <input type="text" :value="inviteLink" readonly @focus="$event.target.select()" style="width:100%;" />
    <button @click="goBack" style="margin-top:1rem;">Zurück zum Team</button>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()
const email = ref('')
const success = ref(false)
const error = ref('')
const inviteLink = ref('')

const teamId = ref(null)

async function fetchTeamId() {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return
  const { data: memberData } = await supabase
    .from('members')
    .select('team_id')
    .eq('user_id', user.id)
    .single()
  if (memberData?.team_id) {
    teamId.value = memberData.team_id
    inviteLink.value = `${window.location.origin}/#/join-team/${memberData.team_id}`
  }
}

async function invite() {
  success.value = false
  error.value = ''
  if (!email.value || !teamId.value) {
    error.value = 'Bitte gib eine gültige E-Mail-Adresse ein.'
    return
  }
  // Supabase Edge Function für E-Mail-Einladung aufrufen
  const { error: inviteError } = await supabase.functions.invoke('E-Mail_Team_invite', {
    body: {
      to: email.value,
      teamId: teamId.value
    }
  })
  if (inviteError) {
    error.value = `Fehler beim Versenden der Einladung: ${inviteError.message || inviteError}`
  } else {
    success.value = true
    email.value = ''
  }
}

function goBack() {
  router.push('/my-team')
}

onMounted(fetchTeamId)
</script>

<style scoped>
.invite-member-page {
  max-width: 400px;
  margin: 2rem auto;
}
label {
  display: block;
  margin-bottom: 1rem;
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
  cursor: pointer;
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