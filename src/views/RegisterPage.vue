<template>
    <v-main>
        <v-container class="d-flex align-center justify-center" style="min-height: calc(80vh - 64px);" fluid>
            <v-row justify="center">
                <v-col cols="12" sm="8" md="4">
                    <v-card class="pa-4" elevation="6">
                        <v-card-title class="text-h5 text-center">🚴 Fahrrad App – Registrieren</v-card-title>

                        <v-card-text>
                            <v-form v-if="!success" @submit.prevent="register">
                                <v-text-field v-model="email" label="E-Mail" type="email" required
                                    prepend-inner-icon="mdi-email" />
                                <v-text-field v-model="password" label="Passwort" type="password" required
                                    prepend-inner-icon="mdi-lock" />
                                <v-text-field v-model="username" label="Benutzername" type="text" required
                                    prepend-inner-icon="mdi-account" />
                                <v-btn type="submit" color="primary" block class="mt-3">Registrieren</v-btn>
                            </v-form>

                            <v-btn class="mt-4" color="black" block @click="signInWithGithub" prepend-icon="mdi-github">
                                Mit GitHub registrieren
                            </v-btn>

                            <v-alert v-if="error" type="error" class="mt-4" dense border="start">
                                {{ error }}
                            </v-alert>

                            <v-alert v-if="success" type="success" class="mt-4" dense border="start">
                                {{ success }}
                            </v-alert>

                            <div class="mt-4 text-center">
                                Schon ein Konto?
                                <router-link to="/login">Hier anmelden</router-link>
                            </div>
                        </v-card-text>
                    </v-card>
                </v-col>
            </v-row>
        </v-container>
    </v-main>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const email = ref('')
const password = ref('')
const username = ref('')
const error = ref(null)
const success = ref(null)
const router = useRouter()

async function register() {
    error.value = null
    success.value = null
    const { data, error: signUpError } = await supabase.auth.signUp({
        email: email.value,
        password: password.value,
        options: {
            emailRedirectTo: 'https://schroerdev.github.io/fahrrad_kilometer_tracker/'
        }
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

    // Erfolgsmeldung anzeigen und nicht weiterleiten
    success.value = 'Bitte bestätige deine E-Mail-Adresse über den Link, den wir dir geschickt haben, bevor du dich einloggst.'
}

async function signInWithGithub() {
    const { error: oauthError } = await supabase.auth.signInWithOAuth({
        provider: 'github',
        options: {
            redirectTo: 'https://schroerdev.github.io/fahrrad_kilometer_tracker/',
        }
    })
    if (oauthError) {
        error.value = oauthError.message
    }
}
</script>
