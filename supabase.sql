-- Rode no Supabase: SQL Editor > New query > Run
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  nome text not null default 'Jogador',
  saldo integer not null default 1000 check (saldo >= 0),
  melhor_ganho integer not null default 0,
  atualizado_em timestamptz not null default now()
);

alter table public.profiles enable row level security;

create policy "ranking publico" on public.profiles for select using (true);
create policy "cria o proprio perfil" on public.profiles for insert with check (auth.uid() = id);
create policy "atualiza o proprio perfil" on public.profiles for update using (auth.uid() = id) with check (auth.uid() = id);

create or replace function public.novo_perfil() returns trigger
language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, nome)
  values (new.id, coalesce(new.raw_user_meta_data->>'nome', split_part(new.email, '@', 1)));
  return new;
end $$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created after insert on auth.users
for each row execute function public.novo_perfil();
