<script setup>
import { ref, onMounted } from 'vue'
import { supabase } from '../supabaseClient'

const profile = ref(null)
const teamName = ref('Kein Team')
const error = ref(null)

const fetchProfile = async () => {
    const { data: { user }, error: userError } = await supabase.auth.getUser()
    if (userError || !user) {
        error.value = 'Nicht eingeloggt.'
        return
    }

    const { data: profileData, error: profileError } = await supabase
        .from('profiles')
        .select('username')
        .eq('id', user.id)
        .single()

    if (profileError) {
        error.value = 'Profil nicht gefunden.'
        return
    }

    profile.value = profileData

    const { data: memberData } = await supabase
        .from('members')
        .select('team_id')
        .eq('user_id', user.id)
        .single()

    if (memberData?.team_id) {
        const { data: teamData } = await supabase
            .from('teams')
            .select('name')
            .eq('id', memberData.team_id)
            .single()

        if (teamData?.name) {
            teamName.value = teamData.name
        }
    }
}

onMounted(fetchProfile)
</script>
