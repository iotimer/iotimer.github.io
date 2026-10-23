-- Odpočet naživo: databáza v Supabase
-- Spusti celé naraz v Supabase: SQL Editor → New query → vlož → Run.

-- 1) Tabuľka: dva riadky, "setup" (program) a "state" (čo je práve na obrazovke)
create table if not exists public.odpocet (
  id         text primary key,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- 2) Prístupové pravidlá: čítať môže ktokoľvek s odkazom, meniť len prihlásený (ty)
alter table public.odpocet enable row level security;

drop policy if exists "citat moze kazdy" on public.odpocet;
create policy "citat moze kazdy" on public.odpocet
  for select to anon, authenticated using (true);

drop policy if exists "pridavat moze prihlaseny" on public.odpocet;
create policy "pridavat moze prihlaseny" on public.odpocet
  for insert to authenticated with check (true);

drop policy if exists "menit moze prihlaseny" on public.odpocet;
create policy "menit moze prihlaseny" on public.odpocet
  for update to authenticated using (true) with check (true);

grant select on public.odpocet to anon, authenticated;
grant insert, update on public.odpocet to authenticated;

-- 3) Začiatočné riadky
insert into public.odpocet (id, data) values
  ('setup', '{"people": [], "def": 180, "breakText": "Prestávka", "english": false}'),
  ('state', '{"mode": "idle"}')
on conflict (id) do nothing;

-- 4) Zmeny v reálnom čase pre divákov
do $$
begin
  alter publication supabase_realtime add table public.odpocet;
exception when duplicate_object then null;
end $$;
