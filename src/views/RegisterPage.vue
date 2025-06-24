<template>
    <div class="page-container">
        <h1>Registrieren</h1>
        <form @submit.prevent="register">
            <input v-model="email" type="email" placeholder="E-Mail" required />
            <input v-model="password" type="password" placeholder="Passwort" required />
            <input v-model="username" type="text" placeholder="Benutzername" required />
            <button type="submit">Registrieren</button>
        </form>
        <p v-if="error" class="error">{{ error }}</p>
    </div>
</template>

<script setup>
import '../style.css'
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const email = ref('')
const password = ref('')
const username = ref('')
const error = ref(null)
const router = useRouter()

async function register() {
    error.value = null
    const { data, error: signUpError } = await supabase.auth.signUp({
        email: email.value,
        password: password.value
    })

    if (signUpError) {
        error.value = signUpError.message
        return
    }

    // Benutzerprofil speichern
    const userId = data.user?.id
    if (userId) {
        const { error: profileError } = await supabase.from('profiles').update({ username: username.value }).eq('id', userId)
        if (profileError) {
            error.value = profileError.message
            return
        }
    }

    router.push('/teams')
}
</script>

