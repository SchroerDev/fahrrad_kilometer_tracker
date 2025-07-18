<template>
    <v-main>
        <v-container class="page-container" fluid>
            <v-card class="pa-6 mb-6" elevation="4">
                <v-card-title class="text-h5">🚴 Team-Übersicht</v-card-title>

                <v-card-text>
                    <v-progress-circular v-if="loading" indeterminate color="primary" class="ma-4" />
                    <div v-else-if="teams.length === 0">Keine Teams gefunden.</div>

                    <!-- Desktop-Tabelle -->
                    <v-data-table v-if="!isMobile" :headers="headers" :items="sortedTeams" class="elevation-1 mt-4"
                        item-value="id" disable-pagination hide-default-footer>
                        <template #item.name="{ item }">
                            <div>
                                <router-link v-if="item.id === myTeamId" :to="'/my-team'" class="my-team-link">
                                    <strong>{{ item.name }}</strong>
                                </router-link>
                                <strong v-else>{{ item.name }}</strong>
                                <v-chip v-if="item.id === myTeamId" color="primary" size="small" class="ml-2">
                                    Mein Team
                                </v-chip>
                            </div>
                        </template>
                        <template #item.rank="{ index }">
                            #{{ index + 1 }}
                        </template>
                    </v-data-table>

                    <!-- Mobile-Karten -->
                    <v-row v-else class="mt-4" dense>
                        <v-col v-for="(team, idx) in sortedTeams" :key="team.id" cols="12">
                            <v-card :color="team.id === myTeamId ? 'primary' : 'surface'" class="pa-4" elevation="2">
                                <div class="d-flex justify-space-between align-center">
                                    <div class="text-h6">#{{ idx + 1 }}</div>
                                    <div class="text-right">
                                        <router-link v-if="team.id === myTeamId" :to="'/my-team'" class="my-team-link">
                                            <strong>{{ team.name }}</strong>
                                        </router-link>
                                        <strong v-else>{{ team.name }}</strong>
                                        <div class="text-caption">
                                            {{ team.member_count }} Mitglieder
                                        </div>
                                    </div>
                                    <div class="text-right font-weight-bold">
                                        {{ team.total_km ?? 0 }} km
                                    </div>
                                </div>
                            </v-card>
                        </v-col>
                    </v-row>

                    <!-- Team erstellen -->
                    <div v-if="!myTeamId" class="mt-6">
                        <v-btn color="primary" @click="goToCreateTeam">
                            ➕ Team erstellen
                        </v-btn>
                    </div>

                    <v-alert v-if="error" type="error" class="mt-4">
                        {{ error }}
                    </v-alert>
                </v-card-text>
            </v-card>
        </v-container>
    </v-main>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const headers = [
    { title: 'Rang', value: 'rank' },
    { title: 'Teamname', value: 'name' },
    { title: 'Kilometer', value: 'total_km' },
    { title: 'Mitglieder', value: 'member_count' },
]
const router = useRouter()
const teams = ref([])
const loading = ref(true)
const error = ref(null)
const myTeamId = ref(null)
const isMobile = ref(window.innerWidth <= 900)

async function fetchTeams() {
    loading.value = true
    // Teams mit Mitgliedern abfragen
    const { data, error: fetchError } = await supabase
        .from('teams')
        .select(`
            id,
            name,
            members:members (
                user_id
            )
        `)
        .order('created_at', { ascending: false })

    if (fetchError) {
        error.value = fetchError.message
        loading.value = false
        return
    }

    // Für jedes Team die km summieren
    const teamsWithKm = []
    for (const team of data) {
        let total = 0
        let memberCount = team.members ? team.members.length : 0
        if (team.members && team.members.length > 0) {
            // Hole alle Fahrten der Teammitglieder
            const userIds = team.members.map(m => m.user_id)
            const { data: rides } = await supabase
                .from('rides')
                .select('km')
                .in('user_id', userIds)
            if (rides) {
                for (const ride of rides) {
                    total += Number(ride.km) || 0
                }
            }
        }
        teamsWithKm.push({
            id: team.id,
            name: team.name,
            total_km: total,
            member_count: memberCount
        })
    }
    teams.value = teamsWithKm
    loading.value = false
}

async function fetchMyTeamId() {
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
        myTeamId.value = null
        return
    }
    const { data: memberData } = await supabase
        .from('members')
        .select('team_id')
        .eq('user_id', user.id)
        .single()
    myTeamId.value = memberData?.team_id || null
}

function goToCreateTeam() {
    router.push('/create-team')
}

const sortedTeams = computed(() => {
    return [...teams.value].sort((a, b) => (b.total_km ?? 0) - (a.total_km ?? 0))
})

function handleResize() {
  isMobile.value = window.innerWidth <= 700
}

onMounted(() => {
    fetchTeams()
    fetchMyTeamId()
    window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
  window.removeEventListener('resize', handleResize)
})
</script>
