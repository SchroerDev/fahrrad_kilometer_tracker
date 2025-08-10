import { supabase } from '../supabaseClient'

/**
 * Validates ride input data
 * @param {Object} rideData - The ride data to validate
 * @param {number} rideData.lat - Latitude coordinate
 * @param {number} rideData.lng - Longitude coordinate
 * @param {number} rideData.km - Kilometers traveled
 * @returns {Object} Validation result with isValid boolean and error message
 */
export function validateRideData({ lat, lng, km }) {
  if (!lat || !lng) {
    return {
      isValid: false,
      error: 'Bitte wähle einen Startpunkt auf der Karte.'
    }
  }

  if (!km || parseInt(km, 10) <= 1) {
    return {
      isValid: false,
      error: 'Bitte gib mindestens 2 Kilometer ein.'
    }
  }

  return { isValid: true }
}

/**
 * Creates a PostGIS POINT geometry string from coordinates
 * @param {number} lng - Longitude
 * @param {number} lat - Latitude
 * @returns {string} PostGIS POINT geometry string
 */
export function createStartPointGeometry(lng, lat) {
  return `SRID=4326;POINT(${lng} ${lat})`
}

/**
 * Creates a new ride entry in the database
 * @param {Object} rideData - The ride data
 * @param {number} rideData.lat - Latitude coordinate
 * @param {number} rideData.lng - Longitude coordinate
 * @param {number} rideData.km - Kilometers traveled
 * @param {string} userId - The user ID
 * @returns {Promise<Object>} Result with success boolean and error if any
 */
export async function createRide({ lat, lng, km }, userId) {
  // Validate user authentication
  if (!userId) {
    return {
      success: false,
      error: 'Nicht eingeloggt.'
    }
  }

  // Validate ride data
  const validation = validateRideData({ lat, lng, km })
  if (!validation.isValid) {
    return {
      success: false,
      error: validation.error
    }
  }

  // Create geometry for start point
  const startPoint = createStartPointGeometry(lng, lat)

  // Insert ride into database
  const { error: insertError } = await supabase.from('rides').insert([{
    user_id: userId,
    km: parseInt(km, 10),
    StartPoint: startPoint
  }])

  if (insertError) {
    return {
      success: false,
      error: insertError.message
    }
  }

  return { success: true }
}