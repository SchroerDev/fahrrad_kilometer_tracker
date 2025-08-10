import { describe, it, expect, vi, beforeEach } from 'vitest'
import { validateRideData, createStartPointGeometry, createRide } from '../src/services/rideService'

// Mock Supabase client
vi.mock('../src/supabaseClient', () => ({
  supabase: {
    from: vi.fn(() => ({
      insert: vi.fn(),
    })),
  },
}))

describe('Ride Service', () => {
  describe('validateRideData', () => {
    it('should return valid for correct ride data', () => {
      const rideData = {
        lat: 52.52,
        lng: 13.405,
        km: 5,
      }

      const result = validateRideData(rideData)

      expect(result.isValid).toBe(true)
    })

    it('should return invalid when coordinates are missing', () => {
      const rideData = {
        lat: null,
        lng: null,
        km: 5,
      }

      const result = validateRideData(rideData)

      expect(result.isValid).toBe(false)
      expect(result.error).toBe('Bitte wähle einen Startpunkt auf der Karte.')
    })

    it('should return invalid when latitude is missing', () => {
      const rideData = {
        lat: null,
        lng: 13.405,
        km: 5,
      }

      const result = validateRideData(rideData)

      expect(result.isValid).toBe(false)
      expect(result.error).toBe('Bitte wähle einen Startpunkt auf der Karte.')
    })

    it('should return invalid when longitude is missing', () => {
      const rideData = {
        lat: 52.52,
        lng: null,
        km: 5,
      }

      const result = validateRideData(rideData)

      expect(result.isValid).toBe(false)
      expect(result.error).toBe('Bitte wähle einen Startpunkt auf der Karte.')
    })

    it('should return invalid when km is missing', () => {
      const rideData = {
        lat: 52.52,
        lng: 13.405,
        km: null,
      }

      const result = validateRideData(rideData)

      expect(result.isValid).toBe(false)
      expect(result.error).toBe('Bitte gib mindestens 2 Kilometer ein.')
    })

    it('should return invalid when km is less than 2', () => {
      const rideData = {
        lat: 52.52,
        lng: 13.405,
        km: 1,
      }

      const result = validateRideData(rideData)

      expect(result.isValid).toBe(false)
      expect(result.error).toBe('Bitte gib mindestens 2 Kilometer ein.')
    })

    it('should return valid when km is exactly 2', () => {
      const rideData = {
        lat: 52.52,
        lng: 13.405,
        km: 2,
      }

      const result = validateRideData(rideData)

      expect(result.isValid).toBe(true)
    })
  })

  describe('createStartPointGeometry', () => {
    it('should create correct PostGIS POINT geometry string', () => {
      const lng = 13.405
      const lat = 52.52

      const result = createStartPointGeometry(lng, lat)

      expect(result).toBe('SRID=4326;POINT(13.405 52.52)')
    })

    it('should handle negative coordinates', () => {
      const lng = -122.4194
      const lat = 37.7749

      const result = createStartPointGeometry(lng, lat)

      expect(result).toBe('SRID=4326;POINT(-122.4194 37.7749)')
    })

    it('should handle decimal coordinates', () => {
      const lng = 2.3522
      const lat = 48.8566

      const result = createStartPointGeometry(lng, lat)

      expect(result).toBe('SRID=4326;POINT(2.3522 48.8566)')
    })
  })

  describe('createRide', () => {
    beforeEach(async () => {
      // Reset all mocks before each test
      vi.clearAllMocks()
    })

    it('should successfully create a ride with valid data', async () => {
      // Arrange
      const rideData = {
        lat: 52.52,
        lng: 13.405,
        km: 10,
      }
      const userId = 'test-user-id'

      // Import the mocked module and setup the mock
      const { supabase } = await import('../src/supabaseClient')
      const mockInsert = vi.fn().mockResolvedValue({ error: null })
      supabase.from.mockReturnValue({ insert: mockInsert })

      // Act
      const result = await createRide(rideData, userId)

      // Assert
      expect(result.success).toBe(true)
      expect(supabase.from).toHaveBeenCalledWith('rides')
      expect(mockInsert).toHaveBeenCalledWith([
        {
          user_id: userId,
          km: 10,
          StartPoint: 'SRID=4326;POINT(13.405 52.52)',
        },
      ])
    })

    it('should fail when user is not authenticated', async () => {
      // Arrange
      const rideData = {
        lat: 52.52,
        lng: 13.405,
        km: 10,
      }
      const userId = null

      // Import the mocked module
      const { supabase } = await import('../src/supabaseClient')

      // Act
      const result = await createRide(rideData, userId)

      // Assert
      expect(result.success).toBe(false)
      expect(result.error).toBe('Nicht eingeloggt.')
      expect(supabase.from).not.toHaveBeenCalled()
    })

    it('should fail when ride data is invalid', async () => {
      // Arrange
      const rideData = {
        lat: null,
        lng: null,
        km: 1,
      }
      const userId = 'test-user-id'

      // Import the mocked module
      const { supabase } = await import('../src/supabaseClient')

      // Act
      const result = await createRide(rideData, userId)

      // Assert
      expect(result.success).toBe(false)
      expect(result.error).toBe('Bitte wähle einen Startpunkt auf der Karte.')
      expect(supabase.from).not.toHaveBeenCalled()
    })

    it('should handle database error', async () => {
      // Arrange
      const rideData = {
        lat: 52.52,
        lng: 13.405,
        km: 15,
      }
      const userId = 'test-user-id'
      const dbError = { message: 'Database connection failed' }

      // Import the mocked module and setup the mock
      const { supabase } = await import('../src/supabaseClient')
      const mockInsert = vi.fn().mockResolvedValue({ error: dbError })
      supabase.from.mockReturnValue({ insert: mockInsert })

      // Act
      const result = await createRide(rideData, userId)

      // Assert
      expect(result.success).toBe(false)
      expect(result.error).toBe('Database connection failed')
      expect(supabase.from).toHaveBeenCalledWith('rides')
    })

    it('should convert km to integer when saving', async () => {
      // Arrange
      const rideData = {
        lat: 52.52,
        lng: 13.405,
        km: '25', // String value
      }
      const userId = 'test-user-id'

      // Import the mocked module and setup the mock
      const { supabase } = await import('../src/supabaseClient')
      const mockInsert = vi.fn().mockResolvedValue({ error: null })
      supabase.from.mockReturnValue({ insert: mockInsert })

      // Act
      const result = await createRide(rideData, userId)

      // Assert
      expect(result.success).toBe(true)
      expect(mockInsert).toHaveBeenCalledWith([
        {
          user_id: userId,
          km: 25, // Should be converted to integer
          StartPoint: 'SRID=4326;POINT(13.405 52.52)',
        },
      ])
    })

    it('should create ride with exact test data values', async () => {
      // Arrange - Specific test data for acceptance criteria
      const testRideData = {
        lat: 51.1657, // Göttingen latitude
        lng: 10.4515, // Göttingen longitude
        km: 12,
      }
      const testUserId = 'test-user-uuid-12345'

      // Import the mocked module and setup the mock
      const { supabase } = await import('../src/supabaseClient')
      const mockInsert = vi.fn().mockResolvedValue({ error: null })
      supabase.from.mockReturnValue({ insert: mockInsert })

      // Act
      const result = await createRide(testRideData, testUserId)

      // Assert - Verify stored values match test data
      expect(result.success).toBe(true)

      const insertCall = mockInsert.mock.calls[0][0][0]
      expect(insertCall.user_id).toBe(testUserId)
      expect(insertCall.km).toBe(12)
      expect(insertCall.StartPoint).toBe('SRID=4326;POINT(10.4515 51.1657)')

      // Verify the function was called with correct parameters
      expect(supabase.from).toHaveBeenCalledWith('rides')
      expect(mockInsert).toHaveBeenCalledTimes(1)
    })
  })
})
