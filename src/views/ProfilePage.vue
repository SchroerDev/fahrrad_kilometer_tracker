<template>
  <v-main>
    <v-container class="page-container" fluid>
      <v-card class="pa-6" elevation="4">
        <v-card-title class="text-h5">👤 Profil</v-card-title>

        <v-card-text>
          <v-alert v-if="error" type="error" dense class="mb-4">
            {{ error }}
          </v-alert>

          <div v-else-if="!profile">
            <v-progress-circular indeterminate color="primary" />
            <span class="ml-2">Lade Profil...</span>
          </div>

          <div v-else>
            <v-alert v-if="!emailConfirmed" type="warning" dense class="mb-4">
              Bitte bestätige deine E-Mail-Adresse, um alle Funktionen nutzen zu können.
            </v-alert>

            <v-row class="mb-4">
              <v-col cols="12" md="8">
                <v-text-field v-model="editUsername" label="Benutzername" variant="outlined" />
                <v-btn color="primary" @click="updateUsername">Speichern</v-btn>
              </v-col>
            </v-row>

            <v-alert v-if="usernameSuccess" type="success" dense class="mb-2">
              {{ usernameSuccess }}
            </v-alert>
            <v-alert v-if="usernameError" type="error" dense class="mb-2">
              {{ usernameError }}
            </v-alert>

            <p>
              <strong>Team:</strong> {{ teamName }}
              <v-btn
                v-if="teamName !== 'Kein Team'"
                color="warning"
                class="ml-4"
                @click="leaveTeam"
              >
                Team verlassen
              </v-btn>
            </p>

            <h2 class="mt-6 mb-4">Deine Fahrten</h2>

            <v-list v-if="rides.length > 0" class="mb-4">
              <v-list-item v-for="ride in rides" :key="ride.id">
                <v-list-item-content>
                  <v-list-item-title>
                    {{ formatDate(ride.created_at) }}: {{ ride.km }} km
                  </v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list>

            <p v-else>Keine Fahrten gefunden.</p>

            <v-btn color="error" class="mt-6" @click="confirmDeleteAccount">
              Account löschen
            </v-btn>
          </div>
        </v-card-text>
      </v-card>

      <!-- Dialog zur Bestätigung der Account-Löschung -->
      <v-dialog v-model="deleteDialog" persistent max-width="400">
        <v-card>
          <v-card-title class="text-h5">Account löschen?</v-card-title>
          <v-card-text>
            Bist du sicher, dass du deinen Account unwiderruflich löschen möchtest? Alle deine Daten
            gehen dabei verloren.
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text @click="deleteDialog = false">Abbrechen</v-btn>
            <v-btn color="red darken-1" text @click="deleteAccount">Löschen</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

      <v-row>
        <v-col cols="12" md="6">
          <v-card title="Meine Statistiken">
            <v-card-text>
              <v-list>
                <v-list-item>
                  <template #prepend><v-icon>mdi-bike</v-icon></template>
                  <v-list-item-title>Fahrten insgesamt</v-list-item-title>
                  <v-list-item-subtitle>{{ userStats.totalRides }}</v-list-item-subtitle>
                </v-list-item>
                <v-list-item>
                  <template #prepend><v-icon>mdi-map-marker-distance</v-icon></template>
                  <v-list-item-title>Kilometer gesamt</v-list-item-title>
                  <v-list-item-subtitle>{{ userStats.totalKm }} km</v-list-item-subtitle>
                </v-list-item>
                <v-list-item>
                  <v-list-item-title>Mein Titel</v-list-item-title>
                  <v-list-item-subtitle>Mein Untertitel</v-list-item-subtitle>
                </v-list-item>
              </v-list>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { supabase } from '../supabaseClient'

const profile = ref(null)
const teamName = ref('Kein Team')
const error = ref(null)
const rides = ref([])
const emailConfirmed = ref(true)
const memberId = ref(null)
const success = ref(null)
const editUsername = ref('')
const usernameError = ref('')
const usernameSuccess = ref('')
const deleteDialog = ref(false)
const userStats = ref({ totalRides: 0, totalKm: 0 }) // Hinzugefügt für Benutzerdaten

// Nach Laden des Profils Username ins Eingabefeld übernehmen
const fetchProfile = async () => {
  const {
    data: { user },
    error: userError,
  } = await supabase.auth.getUser()
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
  editUsername.value = profileData.username

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

  // Benutzerstatistiken laden
  const { data: statsData } = await supabase
    .from('rides')
    .select('count(id) as totalRides, sum(km) as totalKm')
    .eq('user_id', user.id)
    .single()

  userStats.value = {
    totalRides: statsData?.totalRides || 0,
    totalKm: statsData?.totalKm || 0,
  }
}

async function leaveTeam() {
  if (!memberId.value) {
    return
  }
  const { error: leaveError } = await supabase.from('members').delete().eq('id', memberId.value)
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
  deleteDialog.value = false
  error.value = null
  success.value = null
  // Hier solltest du eine eigene Edge Function aufrufen, die den User löscht!
  const {
    data: { user },
  } = await supabase.auth.getUser()
  const { error: funcError } = await supabase.functions.invoke('delete-user', {
    body: { userId: user.id },
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
  deleteDialog.value = true
}

async function updateUsername() {
  usernameError.value = ''
  usernameSuccess.value = ''
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) {
    usernameError.value = 'Nicht eingeloggt.'
    return
  }
  if (!editUsername.value || editUsername.value.length < 3) {
    usernameError.value = 'Benutzername zu kurz.'
    return
  }
  const { error: updateError } = await supabase
    .from('profiles')
    .update({ username: editUsername.value })
    .eq('id', user.id)
  if (updateError) {
    usernameError.value = 'Fehler beim Speichern: ' + updateError.message
  } else {
    usernameSuccess.value = 'Benutzername gespeichert!'
    profile.value.username = editUsername.value
  }
}

onMounted(fetchProfile)
</script>
