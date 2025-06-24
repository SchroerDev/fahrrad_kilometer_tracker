<template>
    <div class="teams-page">
        <h1>🚴 Team-Übersicht</h1>

        <div v-if="loading">Lade Teams...</div>
        <div v-else-if="teams.length === 0">Keine Teams gefunden.</div>
        <ul v-else>
            <li v-for="team in teams" :key="team.id">
                <strong>{{ team.name }}</strong>
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
    const { data, error: fetchError } = await supabase
        .from('teams')
        .select('*')
        .order('created_at', { ascending: false })

    if (fetchError) {
        error.value = fetchError.message
    } else {
        teams.value = data
    }

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
</style>
  
