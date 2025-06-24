<template>
  <div class="page-container">
    <h1>Team beitreten</h1>
    <div v-if="loading">Beitritt wird geprüft...</div>
    <div v-else-if="success">
      <p>Du bist dem Team erfolgreich beigetreten!</p>
      <router-link to="/my-team">Zum Team</router-link>
    </div>
    <div v-else>
      <p v-if="error" class="error">{{ error }}</p>
      <router-link to="/">Zur Startseite</router-link>
    </div>
  </div>
</template>

<script setup>
import '../style.css'
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
  const { data: { user } } = await supabase.auth.getUser()
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

