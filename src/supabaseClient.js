import { createClient } from "@supabase/supabase-js";

console.log('Supabase URL:', import.meta.env.VITE_SUPABASE_URL)

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseKey);