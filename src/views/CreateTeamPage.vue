<template>
  <v-main>
    <v-container
      class="d-flex align-center justify-center"
      style="min-height: calc(80vh - 64px)"
      fluid
    >
      <v-row justify="center">
        <v-col cols="12" sm="8" md="4">
          <v-card class="pa-4" elevation="6">
            <v-card-title class="text-h5 text-center">➕ Neues Team erstellen</v-card-title>

            <v-card-text>
              <v-form @submit.prevent="createTeam">
                <v-text-field
                  v-model="teamName"
                  label="Teamname"
                  type="text"
                  required
                  prepend-inner-icon="mdi-account-group"
                />
                <v-btn type="submit" color="primary" block class="mt-3">Team erstellen</v-btn>
              </v-form>

              <v-alert v-if="error" type="error" class="mt-4" dense border="start">
                {{ error }}
              </v-alert>
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

const router = useRouter()
const teamName = ref('')
const error = ref(null)

async function createTeam() {
  const {
    data: { user },
  } = await supabase.auth.getUser()
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
