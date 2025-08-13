<template>
  <v-main>
    <v-container class="page-container" fluid>
      <v-card class="pa-6" elevation="4">
        <v-card-title class="text-h5">📊 Team-Statistiken</v-card-title>

        <v-card-text>
          <v-alert v-if="error" type="error" dense class="mb-4">
            {{ error }}
          </v-alert>

          <div v-else-if="loading">
            <v-progress-circular indeterminate color="primary" />
            <span class="ml-2">Lade Team-Statistiken...</span>
          </div>

          <div v-else-if="!teamData">
            <v-alert type="info" dense>
              Du bist in keinem Team.
              <router-link to="/teams" class="ml-2">Jetzt Team beitreten</router-link>
            </v-alert>
          </div>

          <div v-else>
            <!-- Team Header -->
            <v-row class="mb-6">
              <v-col cols="12">
                <v-card color="primary" dark>
                  <v-card-text class="text-center">
                    <h2>{{ teamData.name }}</h2>
                    <p class="text-h6 mb-0">{{ teamData.members?.length || 0 }} Mitglieder</p>
                  </v-card-text>
                </v-card>
              </v-col>
            </v-row>

            <!-- Statistik-Karten -->
            <v-row class="mb-6">
              <v-col cols="12" md="3">
                <v-card>
                  <v-card-text class="text-center">
                    <v-icon size="40" color="primary" class="mb-2">mdi-map-marker-distance</v-icon>
                    <div class="text-h4 font-weight-bold">{{ totalKm }}</div>
                    <div class="text-caption text-medium-emphasis">Kilometer gesamt</div>
                  </v-card-text>
                </v-card>
              </v-col>

              <v-col cols="12" md="3">
                <v-card>
                  <v-card-text class="text-center">
                    <v-icon size="40" color="success" class="mb-2">mdi-account-group</v-icon>
                    <div class="text-h4 font-weight-bold">{{ avgPerMember }}</div>
                    <div class="text-caption text-medium-emphasis">Ø km pro Mitglied</div>
                  </v-card-text>
                </v-card>
              </v-col>

              <v-col cols="12" md="3">
                <v-card>
                  <v-card-text class="text-center">
                    <v-icon size="40" color="warning" class="mb-2">mdi-bike</v-icon>
                    <div class="text-h4 font-weight-bold">{{ totalRides }}</div>
                    <div class="text-caption text-medium-emphasis">Fahrten gesamt</div>
                  </v-card-text>
                </v-card>
              </v-col>

              <v-col cols="12" md="3">
                <v-card>
                  <v-card-text class="text-center">
                    <v-icon size="40" color="info" class="mb-2">mdi-trophy</v-icon>
                    <div class="text-h4 font-weight-bold">#{{ teamRank }}</div>
                    <div class="text-caption text-medium-emphasis">Team-Rang</div>
                  </v-card-text>
                </v-card>
              </v-col>
            </v-row>

            <!-- Mitglieder-Leaderboard -->
            <v-row>
              <v-col cols="12" lg="8">
                <v-card>
                  <v-card-title>
                    <v-icon class="mr-2">mdi-podium-gold</v-icon>
                    Mitglieder-Ranking
                  </v-card-title>
                  <v-card-text>
                    <v-list>
                      <v-list-item
                        v-for="(member, index) in sortedMembers"
                        :key="member.user_id"
                        class="mb-2"
                      >
                        <template #prepend>
                          <v-avatar :color="getRankColor(index)" size="40">
                            <span class="text-white font-weight-bold">{{ index + 1 }}</span>
                          </v-avatar>
                        </template>

                        <v-list-item-title class="font-weight-medium">
                          {{ member.username || 'Unbekannt' }}
                        </v-list-item-title>

                        <template #append>
                          <div class="text-right">
                            <div class="font-weight-bold">{{ member.totalKm }} km</div>
                            <div class="text-caption text-medium-emphasis">
                              {{ member.rideCount }} Fahrten
                            </div>
                          </div>
                        </template>
                      </v-list-item>
                    </v-list>
                  </v-card-text>
                </v-card>
              </v-col>

              <v-col cols="12" lg="4">
                <v-card>
                  <v-card-title>
                    <v-icon class="mr-2">mdi-chart-line</v-icon>
                    Letzte Aktivitäten
                  </v-card-title>
                  <v-card-text>
                    <v-list v-if="recentRides.length > 0" dense>
                      <v-list-item v-for="ride in recentRides" :key="ride.id" class="mb-1">
                        <template #prepend>
                          <v-icon size="20" color="primary">mdi-bike</v-icon>
                        </template>

                        <v-list-item-title class="text-body-2">
                          {{ ride.username }}: {{ ride.km }} km
                        </v-list-item-title>
                        <v-list-item-subtitle class="text-caption">
                          {{ formatRelativeTime(ride.created_at) }}
                        </v-list-item-subtitle>
                      </v-list-item>
                    </v-list>
                    <p v-else class="text-medium-emphasis">Noch keine Fahrten vorhanden.</p>
                  </v-card-text>
                </v-card>
              </v-col>
            </v-row>
          </div>
        </v-card-text>
      </v-card>
    </v-container>
  </v-main>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { supabase } from '../supabaseClient'

const teamData = ref(null)
const memberStats = ref([])
const recentRides = ref([])
const loading = ref(true)
const error = ref(null)
const teamRank = ref(0)

// Computed Properties für Statistiken
const totalKm = computed(() => {
  return memberStats.value.reduce((sum, member) => sum + member.totalKm, 0)
})

const totalRides = computed(() => {
  return memberStats.value.reduce((sum, member) => sum + member.rideCount, 0)
})

const avgPerMember = computed(() => {
  const memberCount = memberStats.value.length
  return memberCount > 0 ? Math.round(totalKm.value / memberCount) : 0
})

const sortedMembers = computed(() => {
  return [...memberStats.value].sort((a, b) => b.totalKm - a.totalKm)
})

// Team-Daten laden
const fetchTeamStats = async () => {
  try {
    loading.value = true
    error.value = null

    // Aktuellen User holen
    const {
      data: { user },
      error: userError,
    } = await supabase.auth.getUser()
    if (userError || !user) {
      error.value = 'Nicht eingeloggt.'
      return
    }

    // Team-Mitgliedschaft prüfen
    const { data: memberData, error: memberError } = await supabase
      .from('members')
      .select('team_id')
      .eq('user_id', user.id)
      .single()

    if (memberError || !memberData) {
      teamData.value = null
      return
    }

    // Team-Informationen laden
    const { data: team, error: teamError } = await supabase
      .from('teams')
      .select(
        `
        id,
        name,
        members:members (
          user_id,
          profiles:profiles (username)
        )
      `
      )
      .eq('id', memberData.team_id)
      .single()

    if (teamError) {
      error.value = 'Fehler beim Laden der Team-Daten: ' + teamError.message
      return
    }

    teamData.value = team

    // Mitglieder-Statistiken berechnen
    const memberStatsPromises = team.members.map(async (member) => {
      const { data: rides, error: ridesError } = await supabase
        .from('rides')
        .select('km')
        .eq('user_id', member.user_id)

      if (ridesError) {
        // console.error('Fehler beim Laden der Fahrten:', ridesError) // entfernt für linter
        return {
          user_id: member.user_id,
          username: member.profiles?.username || 'Unbekannt',
          totalKm: 0,
          rideCount: 0,
        }
      }

      return {
        user_id: member.user_id,
        username: member.profiles?.username || 'Unbekannt',
        totalKm: rides?.reduce((sum, ride) => sum + (ride.km || 0), 0) || 0,
        rideCount: rides?.length || 0,
      }
    })

    memberStats.value = await Promise.all(memberStatsPromises)

    // Letzte Fahrten laden
    const userIds = team.members.map((m) => m.user_id)
    const { data: rides, error: ridesError } = await supabase
      .from('rides')
      .select(
        `
        id,
        km,
        created_at,
        profiles:profiles (username)
      `
      )
      .in('user_id', userIds)
      .order('created_at', { ascending: false })
      .limit(10)

    if (!ridesError && rides) {
      recentRides.value = rides.map((ride) => ({
        ...ride,
        username: ride.profiles?.username || 'Unbekannt',
      }))
    }

    // Team-Rang berechnen
    await calculateTeamRank(memberData.team_id)
  } catch (err) {
    error.value = 'Unerwarteter Fehler: ' + err.message
  } finally {
    loading.value = false
  }
}

// Team-Rang berechnen
const calculateTeamRank = async (currentTeamId) => {
  try {
    const { data: teams, error: teamsError } = await supabase.from('teams').select(`
        id,
        members:members (
          user_id
        )
      `)

    if (teamsError || !teams) {
      teamRank.value = 0
      return
    }

    // Für jedes Team die Kilometer summieren
    const teamTotals = await Promise.all(
      teams.map(async (team) => {
        if (!team.members || team.members.length === 0) {
          return { id: team.id, totalKm: 0 }
        }

        const userIds = team.members.map((m) => m.user_id)
        const { data: rides } = await supabase.from('rides').select('km').in('user_id', userIds)

        const totalKm = rides?.reduce((sum, ride) => sum + (ride.km || 0), 0) || 0
        return { id: team.id, totalKm }
      })
    )

    // Teams nach Kilometer sortieren
    const sortedTeams = teamTotals.sort((a, b) => b.totalKm - a.totalKm)

    // Rang des aktuellen Teams finden
    const rank = sortedTeams.findIndex((team) => team.id === currentTeamId) + 1
    teamRank.value = rank > 0 ? rank : 0
  } catch {
    teamRank.value = 0
  }
}

// Hilfsfunktionen
const getRankColor = (index) => {
  switch (index) {
    case 0:
      return 'gold'
    case 1:
      return 'silver'
    case 2:
      return 'orange'
    default:
      return 'primary'
  }
}

const formatRelativeTime = (dateString) => {
  const date = new Date(dateString)
  const now = new Date()
  const diffInHours = Math.floor((now - date) / (1000 * 60 * 60))

  if (diffInHours < 1) {
    return 'Vor wenigen Minuten'
  }
  if (diffInHours < 24) {
    return `Vor ${diffInHours} Stunden`
  }
  if (diffInHours < 48) {
    return 'Gestern'
  }
  return `Vor ${Math.floor(diffInHours / 24)} Tagen`
}

onMounted(fetchTeamStats)
</script>
