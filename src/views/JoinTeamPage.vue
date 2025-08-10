<template>
  <v-main>
    <v-container
      class="d-flex align-center justify-center"
      style="min-height: calc(80vh - 64px)"
      fluid
    >
      <v-row justify="center">
        <v-col cols="12" sm="8" md="6">
          <v-card class="pa-4 text-center" elevation="6">
            <v-card-title class="text-h5">Team beitreten</v-card-title>
            <v-card-text>
              <div v-if="loading">
                <v-progress-circular indeterminate color="primary" />
                <p class="mt-2">Beitritt wird geprüft...</p>
              </div>
              <div v-else-if="success">
                <v-alert type="success" dense border="start"
                  >Du bist dem Team erfolgreich beigetreten!</v-alert
                >
                <v-btn color="primary" to="/my-team" class="mt-4">Zum Team</v-btn>
              </div>
              <div v-else>
                <v-alert v-if="error" type="error" dense border="start">{{ error }}</v-alert>
                <v-btn color="secondary" to="/" class="mt-4">Zur Startseite</v-btn>
              </div>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const route = useRoute()
const router = useRouter()
const loading = ref(true)
const success = ref(false)
const error = ref('')

onMounted(async () => {
  loading.value = true
  const teamId = route.params.teamId
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) {
    error.value = 'Du musst eingeloggt sein, um einem Team beizutreten.'
    loading.value = false
    return
  }
  // Prüfen, ob User schon Mitglied ist
  const { data: alreadyMember } = await supabase
    .from('members')
    .select('team_id')
    .eq('user_id', user.id)
    .eq('team_id', teamId)
    .single()
  if (alreadyMember) {
    error.value = 'Du bist bereits Mitglied in diesem Team.'
    loading.value = false
    return
  }
  // Eintrag in members machen
  const { error: insertError } = await supabase
    .from('members')
    .insert([{ user_id: user.id, team_id: teamId }])
  if (insertError) {
    error.value = 'Beitritt fehlgeschlagen: ' + insertError.message
    loading.value = false
    return
  }
  success.value = true
  loading.value = false
})
</script>
