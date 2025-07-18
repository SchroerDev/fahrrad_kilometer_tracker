<template>
    <v-main>
        <v-container fluid>
            <v-card class="pa-4" elevation="4">
                <v-card-title class="text-h5">Mitglied einladen</v-card-title>
                <v-card-subtitle>Du kannst ein Teammitglied per E-Mail einladen oder den Beitrittslink teilen.</v-card-subtitle>

                <v-card-text>
                    <v-form @submit.prevent="invite">
                        <v-text-field v-model="email" label="E-Mail-Adresse" type="email" required prepend-inner-icon="mdi-email" />
                        <v-btn type="submit" color="primary" block>Einladung senden</v-btn>
                    </v-form>

                    <v-alert v-if="success" type="success" dense class="mt-4">Einladung verschickt!</v-alert>
                    <v-alert v-if="error" type="error" dense class="mt-4">{{ error }}</v-alert>

                    <h3 class="text-h6 mt-6">Beitrittslink</h3>
                    <v-text-field :value="inviteLink" readonly @focus="$event.target.select()" prepend-inner-icon="mdi-link" />

                    <v-btn @click="goBack" class="mt-4" color="grey">Zurück zum Team</v-btn>
                </v-card-text>
            </v-card>
        </v-container>
    </v-main>
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
