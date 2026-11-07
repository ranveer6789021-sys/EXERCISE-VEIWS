-- Run this once in the Supabase SQL Editor for the project used by signup.html.
create table if not exists public.workout_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade default auth.uid(),
  workout text not null check (workout in ('Easy walk', 'Gentle stretch', 'Strength basics', 'Other movement')),
  completed_on date not null default current_date,
  created_at timestamptz not null default now()
);

alter table public.workout_logs enable row level security;

create policy "Users can read their own workouts"
  on public.workout_logs for select to authenticated
  using ((select auth.uid()) = user_id);

create policy "Users can add their own workouts"
  on public.workout_logs for insert to authenticated
  with check ((select auth.uid()) = user_id);

create policy "Users can delete their own workouts"
  on public.workout_logs for delete to authenticated
  using ((select auth.uid()) = user_id);
