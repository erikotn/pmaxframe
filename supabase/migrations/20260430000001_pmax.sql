-- pmaxframe — initial schema
-- Brand kits zijn gedeeld met SocialFrame v2 (zelfde Supabase-project,
-- zelfde brand_kits-tabel). Alleen designs zijn tool-specifiek.

create table if not exists public.pmax_designs (
  id text primary key,
  placement text,           -- 'search-mobile' | 'youtube-feed' | 'discover-feed' | 'display-banner'
  display_size text,        -- '300x250' | '336x280' | '728x90' | '160x600' (alleen voor display)
  content jsonb,
  style jsonb,
  date text,
  created_at timestamptz default now()
);

alter table public.pmax_designs enable row level security;
-- Geen policies = geen direct anon-toegang. Alleen via Edge Function (service-role).
