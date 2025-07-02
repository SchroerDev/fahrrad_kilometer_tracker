<template>
    <div class="page-container">
        <h1 class="page-title">🚴 Team-Übersicht</h1>

        <div v-if="loading">Lade Teams...</div>
        <div v-else-if="teams.length === 0">Keine Teams gefunden.</div>
        
        <!-- Desktop-Tabelle -->
        <table v-if="!isMobile" class="teams-table">
            <thead>
                <tr>
                    <th>Rang</th>
                    <th>Teamname</th>
                    <th>Kilometer</th>
                    <th>Mitglieder</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(team, idx) in sortedTeams" :key="team.id">
                    <td>{{ idx + 1 }}</td>
                    <td>
                        <template v-if="team.id === myTeamId">
                            <router-link :to="'/my-team'" class="my-team-link">
                                <strong>{{ team.name }}</strong>
                            </router-link>
                            <span class="badge">Mein Team</span>
                        </template>
                        <template v-else>
                            <strong>{{ team.name }}</strong>
                        </template>
                    </td>
                    <td>{{ team.total_km ?? 0 }}</td>
                    <td>{{ team.member_count }}</td>
                    <td>
                        <!-- Optional: weitere Aktionen -->
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- Mobile-Karten -->
        <div v-else class="teams-list-mobile">
            <div
                v-for="(team, idx) in sortedTeams"
                :key="team.id"
                class="team-card"
                :class="{ 'my-team': team.id === myTeamId }"
            >
                <div class="team-rank">#{{ idx + 1 }}</div>
                <div class="team-name">
                    <template v-if="team.id === myTeamId">
                        <router-link :to="'/my-team'" class="my-team-link">
                            <strong>{{ team.name }}</strong>
                        </router-link>
                        <span class="badge">Mein Team</span>
                    </template>
                    <template v-else>
                        <strong>{{ team.name }}</strong>
                    </template>
                </div>
                <div class="team-km">{{ team.total_km ?? 0 }} km</div>
                <div class="team-members">{{ team.member_count }} Mitglieder</div>
            </div>
        </div>

        <div v-if="!myTeamId">
            <button @click="goToCreateTeam">➕ Team erstellen</button>
        </div>

        <p v-if="error" class="error">{{ error }}</p>
    </div>
</template>

<script setup>
import '../style.css'
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

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
