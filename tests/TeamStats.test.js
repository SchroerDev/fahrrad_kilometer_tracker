import { describe, it, expect, vi, beforeEach } from 'vitest'
import { mount } from '@vue/test-utils'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import TeamStats from '../src/views/TeamStats.vue'

// Mock Supabase client
const mockSupabase = {
  auth: {
    getUser: vi.fn()
  },
  from: vi.fn(() => ({
    select: vi.fn(() => ({
      eq: vi.fn(() => ({
        single: vi.fn()
      })),
      in: vi.fn(() => ({
        order: vi.fn(() => ({
          limit: vi.fn()
        }))
      }))
    }))
  }))
}

vi.mock('../src/supabaseClient', () => ({
  supabase: mockSupabase
}))

const vuetify = createVuetify({
  components,
  directives
})

const createWrapper = (options = {}) => {
  return mount(TeamStats, {
    global: {
      plugins: [vuetify],
    },
    ...options
  })
}

describe('TeamStats', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  it('should render loading state initially', () => {
    mockSupabase.auth.getUser.mockResolvedValue({
      data: { user: { id: 'user-1' } }
    })

    const wrapper = createWrapper()
    
    expect(wrapper.find('.v-progress-circular').exists()).toBe(true)
    expect(wrapper.text()).toContain('Lade Team-Statistiken...')
  })

  it('should show info message when user is not in a team', async () => {
    mockSupabase.auth.getUser.mockResolvedValue({
      data: { user: { id: 'user-1' } }
    })
    
    mockSupabase.from.mockReturnValue({
      select: vi.fn(() => ({
        eq: vi.fn(() => ({
          single: vi.fn().mockResolvedValue({
            data: null,
            error: { message: 'No rows found' }
          })
        }))
      }))
    })

    const wrapper = createWrapper()
    
    await wrapper.vm.$nextTick()
    await new Promise(resolve => setTimeout(resolve, 0))
    
    expect(wrapper.text()).toContain('Du bist in keinem Team')
  })

  it('should calculate team statistics correctly', () => {
    const wrapper = createWrapper()
    
    // Simulate member stats
    wrapper.vm.memberStats = [
      { user_id: '1', username: 'User1', totalKm: 100, rideCount: 5 },
      { user_id: '2', username: 'User2', totalKm: 150, rideCount: 8 },
      { user_id: '3', username: 'User3', totalKm: 75, rideCount: 3 }
    ]

    expect(wrapper.vm.totalKm).toBe(325)
    expect(wrapper.vm.totalRides).toBe(16)
    expect(wrapper.vm.avgPerMember).toBe(108) // 325 / 3 = 108.33 -> 108
  })

  it('should sort members by total kilometers', () => {
    const wrapper = createWrapper()
    
    wrapper.vm.memberStats = [
      { user_id: '1', username: 'User1', totalKm: 100, rideCount: 5 },
      { user_id: '2', username: 'User2', totalKm: 150, rideCount: 8 },
      { user_id: '3', username: 'User3', totalKm: 75, rideCount: 3 }
    ]

    const sorted = wrapper.vm.sortedMembers
    expect(sorted[0].totalKm).toBe(150) // User2 first
    expect(sorted[1].totalKm).toBe(100) // User1 second
    expect(sorted[2].totalKm).toBe(75)  // User3 third
  })

  it('should return correct rank colors', () => {
    const wrapper = createWrapper()
    
    expect(wrapper.vm.getRankColor(0)).toBe('gold')
    expect(wrapper.vm.getRankColor(1)).toBe('silver')
    expect(wrapper.vm.getRankColor(2)).toBe('orange')
    expect(wrapper.vm.getRankColor(3)).toBe('primary')
  })

  it('should format relative time correctly', () => {
    const wrapper = createWrapper()
    const now = new Date()
    
    // 30 minutes ago
    const recent = new Date(now.getTime() - 30 * 60 * 1000)
    expect(wrapper.vm.formatRelativeTime(recent.toISOString())).toBe('Vor wenigen Minuten')
    
    // 5 hours ago
    const hours = new Date(now.getTime() - 5 * 60 * 60 * 1000)
    expect(wrapper.vm.formatRelativeTime(hours.toISOString())).toBe('Vor 5 Stunden')
    
    // Yesterday
    const yesterday = new Date(now.getTime() - 30 * 60 * 60 * 1000)
    expect(wrapper.vm.formatRelativeTime(yesterday.toISOString())).toBe('Gestern')
  })
})