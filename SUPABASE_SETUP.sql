-- SCRIPT DE CONFIGURACIÓN PARA SUPABASE
-- Copia y pega esto en el SQL Editor de tu proyecto de Supabase

-- ATENCIÓN: Estas líneas borran los datos actuales para crear la estructura limpia
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS beds CASCADE;
DROP TABLE IF EXISTS rooms CASCADE;
DROP TABLE IF EXISTS houses CASCADE;

-- 1. Tabla de Casas
CREATE TABLE IF NOT EXISTS houses (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    icon TEXT,
    subtitle TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Tabla de Habitaciones
CREATE TABLE IF NOT EXISTS rooms (
    id SERIAL PRIMARY KEY,
    house_id INTEGER REFERENCES houses(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    type TEXT, -- 'COMPARTIDA' o 'PRIVADA'
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Tabla de Camas
CREATE TABLE IF NOT EXISTS beds (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    room_id INTEGER REFERENCES rooms(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Tabla de Reservas
CREATE TABLE IF NOT EXISTS reservations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bed_id UUID REFERENCES beds(id) ON DELETE CASCADE,
    guest_name TEXT NOT NULL,
    guest_email TEXT,
    guest_phone TEXT,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    status TEXT DEFAULT 'ocupado',
    payment_value NUMERIC(10,2) DEFAULT 0,
    deposit NUMERIC(10,2) DEFAULT 0,
    total_paid NUMERIC(10,2) DEFAULT 0,
    package_type TEXT DEFAULT 'solo_hospedaje',
    surf_level TEXT DEFAULT 'principiante',
    package_days INTEGER DEFAULT 0,
    guest_dni TEXT,
    guest_nationality TEXT,
    guest_birthdate DATE,
    food_preferences TEXT,
    payment_method TEXT DEFAULT 'efectivo', -- efectivo, transferencia, tarjeta
    payment_status TEXT DEFAULT 'pendiente', -- pendiente, parcial, pagado, cancelado
    notes TEXT,
    full_house_group_id UUID, -- Para identificar reservas que pertenecen a una casa completa
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Habilitar acceso público (Solo para propósitos de desarrollo/ejemplo)
-- IMPORTANTE: En producción deberías configurar políticas de RLS adecuadas.
ALTER TABLE houses ENABLE ROW LEVEL SECURITY;
ALTER TABLE rooms ENABLE ROW LEVEL SECURITY;
ALTER TABLE beds ENABLE ROW LEVEL SECURITY;
ALTER TABLE reservations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public access" ON houses FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow public access" ON rooms FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow public access" ON beds FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow public access" ON reservations FOR ALL USING (true) WITH CHECK (true);

-- ==========================================================
-- SCRIPT DE MIGRACIÓN (Si ya tienes datos y solo quieres añadir los campos nuevos)
-- ==========================================================
-- Si ya tienes la tabla creada y no quieres borrar nada, 
-- copia y pega estas líneas una por una en el SQL Editor:

-- ALTER TABLE reservations ADD COLUMN IF NOT EXISTS guest_dni TEXT;
-- ALTER TABLE reservations ADD COLUMN IF NOT EXISTS guest_nationality TEXT;
-- ALTER TABLE reservations ADD COLUMN IF NOT EXISTS guest_birthdate DATE;
-- ALTER TABLE reservations ADD COLUMN IF NOT EXISTS food_preferences TEXT;
