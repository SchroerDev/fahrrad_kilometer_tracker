<template>
    <div class="register">
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
        await supabase.from('profiles').insert([{ id: userId, username: username.value }])
    }

    router.push('/teams')
}
</script>

<style scoped>
.register {
    max-width: 400px;
    margin: 2rem auto;
}

input {
    display: block;
    width: 100%;
    margin-bottom: 1rem;
    padding: 0.5rem;
}

button {
    width: 100%;
    padding: 0.75rem;
    background-color: #2c3e50;
    color: white;
    border: none;
    border-radius: 4px;
}

.error {
    color: red;
    margin-top: 1rem;
}
</style>
  
