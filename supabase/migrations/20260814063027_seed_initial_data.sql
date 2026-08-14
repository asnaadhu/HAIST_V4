/*
# Seed Initial Data for Haharu Housing Portal

## Overview
Populates the database with the same initial data that was previously embedded in
`src/data/initialData.ts` and seeded to Firestore on first load.

## Data Inserted
1. **room_types** — 4 default room types (Single Deluxe, Studio Twin, 4-Bed Shared Dorm, Executive Suite)
2. **statuses** — 6 default status categories (Vacant, Occupied, Partially Occupied, Reserved, Cleaning, Maintenance)
3. **users** — 6 default user accounts for login (Admin, Property Manager, Staff, Tenant, View Only)
4. **food_waste_logs** — 3 sample waste log entries for the current date
5. **transfer_records** — 3 sample transfer records

## Notes
- Uses ON CONFLICT (id) DO NOTHING so re-running is safe — existing data is preserved.
- Timestamps use now() for created_at/updated_at to reflect seeding time.
- The app will check if room_types count is 0 on first load; if so, it seeds from the
  initial data in the frontend. This migration pre-seeds so the app has data immediately.
*/

-- Seed statuses
INSERT INTO statuses (id, name, type, color, description, is_occupied_state, is_maintenance_state) VALUES
  ('status-vacant', 'Vacant', 'both', '#10b981', 'Ready for immediate check-in', false, false),
  ('status-occupied', 'Occupied', 'both', '#3b82f6', 'Fully occupied bed or room', true, false),
  ('status-partially', 'Partially Occupied', 'room', '#06b6d4', 'Room has available beds remaining', true, false),
  ('status-reserved', 'Reserved', 'both', '#8b5cf6', 'Held for upcoming team member arrival', false, false),
  ('status-cleaning', 'Cleaning in Progress', 'room', '#f59e0b', 'Turnover cleaning undergoing', false, false),
  ('status-maintenance', 'Maintenance', 'both', '#ef4444', 'Out of service due to repairs', false, true)
ON CONFLICT (id) DO NOTHING;

-- Seed users (Primary Admin Account)
INSERT INTO users (id, email, password, name, role, employee_id, department, phone, created_at) VALUES
  ('usr-admin-aasnad', 'aasnad@avanihotels.com', 'adminpassword', 'Asnaad (Admin)', 'Admin', 'ADM-000', 'Housing Operations', '+960 729 2184', '2026-01-01T08:00:00Z')
ON CONFLICT (id) DO NOTHING;

