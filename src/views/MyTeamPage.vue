<template>
  <v-main>
    <v-container fluid>
      <v-card class="pa-4" elevation="4">
        <v-card-title v-if="team" class="text-h5">
          Dein Team: <strong class="ml-2">{{ team.name }}</strong>
        </v-card-title>
        <v-card-title v-else class="text-h5"> Mein Team </v-card-title>

        <v-card-text>
          <v-progress-circular v-if="loading" indeterminate color="primary" />

          <v-alert v-else-if="!team" type="info" border="start" dense>
            Du bist in keinem Team.
            <v-btn color="primary" small class="ml-4" @click="goToTeams">Zu den Teams</v-btn>
          </v-alert>

          <div v-else>
            <h3 class="text-h6 mb-2">Mitglieder</h3>
            <v-alert v-if="memberListError" type="error" dense border="start" class="mb-4">
              {{ memberListError }}
            </v-alert>

            <v-list dense>
              <v-list-item v-for="member in members" :key="member.user_id">
                <v-list-item-content>
                  <v-list-item-title>{{ member.profiles?.username || '-' }}</v-list-item-title>
                  <v-list-item-subtitle>User-ID: {{ member.user_id }}</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </v-list>

            <v-btn color="primary" class="mt-4" @click="goToInvite">Mitglied einladen</v-btn>

            <v-expansion-panels class="mt-4">
              <v-expansion-panel title="Letzte Fahrten">
                <v-list>
                  <v-list-item v-for="ride in recentRides" :key="ride.id">
                    <template #prepend>
                      <v-icon>mdi-bike</v-icon>
                    </template>
                    <v-list-item-title>{{ ride.km }} km</v-list-item-title>
                    <v-list-item-subtitle>{{ formatDate(ride.created_at) }}</v-list-item-subtitle>
                    <template #append>
                      <v-btn icon size="small" @click="editRide(ride)">
                        <v-icon>mdi-pencil</v-icon>
                      </v-btn>
                    </template>
                  </v-list-item>
                </v-list>
              </v-expansion-panel>
            </v-expansion-panels>
          </div>
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
const loading = ref(true)
const team = ref(null)
const members = ref([])
const memberListError = ref('')
const recentRides = ref([])

async function fetchMyTeam() {
  loading.value = true
  const {
    data: { user },
  } = await supabase.auth.getUser()
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
    body: { teamId: teamData.id },
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

function formatDate(dateString) {
  const options = { year: 'numeric', month: 'numeric', day: 'numeric' }
  return new Date(dateString).toLocaleDateString('de-DE', options)
}

function editRide(_ride) {
  // Logik zum Bearbeiten der Fahrt
}

onMounted(fetchMyTeam)
</script>
