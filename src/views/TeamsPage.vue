<template>
    <div class="teams-page">
        <h1>🚴 Team-Übersicht</h1>

        <div v-if="loading">Lade Teams...</div>
        <div v-else-if="teams.length === 0">Keine Teams gefunden.</div>
        <ul v-else>
            <li v-for="team in teams" :key="team.id">
                <strong>{{ team.name }}</strong>
                – {{ team.total_km ?? 0 }} km
            </li>
        </ul>

        <div v-if="!hasTeam">
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
const hasTeam = ref(false)

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

async function checkUserTeam() {
    const user = supabase.auth.getUser()
    const { data, error: teamError } = await supabase
        .from('teams')
        .select('id')
        .eq('created_by', (await user).data.user.id)

    if (teamError) {
        console.error(teamError)
    } else {
        hasTeam.value = data.length > 0
    }
}

function goToCreateTeam() {
    router.push('/create-team')
}

onMounted(() => {
    fetchTeams()
    checkUserTeam()
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
.error {
    color: red;
    margin-top: 1rem;
}
</style>

