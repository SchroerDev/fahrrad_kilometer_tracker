<template>
    <div class="page-container">
        <h1>➕ Neues Team erstellen</h1>
        <form @submit.prevent="createTeam">
            <input v-model="teamName" type="text" placeholder="Teamname" required />
            <button type="submit">Team erstellen</button>
        </form>
        <p v-if="error" class="error">{{ error }}</p>
    </div>
</template>

<script setup>
import '../style.css'
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()
const teamName = ref('')
const error = ref(null)

async function createTeam() {
    const { data: { user } } = await supabase.auth.getUser()
    const { data: teamData, error: teamError } = await supabase
        .from('teams')
        .insert([{ name: teamName.value }])
        .select()
        .single()

    if (teamError) {
        error.value = teamError.message
        return
    }

    const { error: memberError } = await supabase
        .from('members')
        .insert([{ user_id: user.id, team_id: teamData.id }])

    if (memberError) {
        error.value = memberError.message
        return
    }

    router.push('/teams')
}
</script>


