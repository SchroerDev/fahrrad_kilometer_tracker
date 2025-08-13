import { createRouter, createWebHistory } from 'vue-router'
import HomePage from '../views/HomePage.vue'
import LoginPage from '../views/LoginPage.vue'
import RegisterPage from '../views/RegisterPage.vue'
import TeamsPage from '../views/TeamsPage.vue'
import CreateTeamPage from '../views/CreateTeamPage.vue'
import ProfilePage from '../views/ProfilePage.vue'
import NewRidePage from '../views/NewRidePage.vue'
import MyTeamPage from '../views/MyTeamPage.vue'
import TeamStats from '../views/TeamStats.vue' // Hinzugefügt

import { supabase } from '../supabaseClient'

const routes = [
  { path: '/', component: HomePage },
  { path: '/login', component: LoginPage },
  { path: '/register', component: RegisterPage },
  { path: '/teams', component: TeamsPage },
  { path: '/create-team', component: CreateTeamPage },
  { path: '/profile', component: ProfilePage },
  { path: '/rides/new', component: NewRidePage },
  { path: '/my-team', component: MyTeamPage },
  { path: '/team-stats', component: TeamStats }, // Neue Route
  { path: '/join-team/:teamId', component: () => import('../views/JoinTeamPage.vue') },
  { path: '/invite-member', component: () => import('../views/InviteMemberPage.vue') },
]

const router = createRouter({
  history: createWebHistory('/fahrrad_kilometer_tracker/'),
  routes,
})

// Navigation Guard für die Root-Seite
router.beforeEach(async (to, from, next) => {
  if (to.path === '/') {
    const {
      data: { session },
    } = await supabase.auth.getSession()
    if (session) {
      next('/teams')
    } else {
      next('/login')
    }
  } else {
    next()
  }
})

export default router
