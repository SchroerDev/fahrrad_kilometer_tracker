<template>
    <div class="teams-page">
        <h1>🚴 Team-Übersicht</h1>

        <div v-if="loading">Lade Teams...</div>
        <div v-else-if="teams.length === 0">Keine Teams gefunden.</div>
        <ul v-else>
            <li v-for="team in teams" :key="team.id">
                <template v-if="team.id === myTeamId">
                    <router-link :to="'/my-team'" class="my-team-link">
                        <strong>{{ team.name }}</strong>
                    </router-link>
                    – {{ team.total_km ?? 0 }} km
                    <span class="badge">Mein Team</span>
                </template>
                <template v-else>
                    <strong>{{ team.name }}</strong>
                    – {{ team.total_km ?? 0 }} km
                </template>
            </li>
        </ul>

        <div v-if="!myTeamId">
            <button @click="goToCreateTeam">➕ Team erstellen</button>
        </div>

        <p v-if="error" class="error">{{ error }}</p>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()
const teams = ref([])
const loading = ref(true)
const error = ref(null)
const myTeamId = ref(null)

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
            total_km: total
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

onMounted(() => {
    fetchTeams()
    fetchMyTeamId()
})
</script>

<style scoped>
button {
    margin-top: 1rem;
    padding: 0.5rem 1rem;
    background-color: #42b883;
    color: white;
    border: none;
    border-radius: 4px;
}
ul {
    padding-left: 0;
    list-style-position: inside;
    text-align: left;
}
li {
    margin-bottom: 0.5rem;
}
.my-team-link {
    color: #42b883;
    text-decoration: underline;
    font-weight: bold;
}
.badge {
    background: #42b883;
    color: #fff;
    border-radius: 8px;
    padding: 0.1em 0.6em;
    font-size: 0.8em;
    margin-left: 0.5em;
}
.error {
    color: red;
    margin-top: 1rem;
}
</style>

