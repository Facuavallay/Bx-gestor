// Configuración de Supabase
// Reemplaza los valores con tus credenciales de Supabase
const SUPABASE_URL = 'https://ymbvtceblkbdywoomdtk.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_rJcTbDoz-IqNog0PdGlKYw_3_M9i0bD';

const supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

console.log('Cliente de Supabase inicializado correctamente');
