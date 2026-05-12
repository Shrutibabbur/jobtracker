-- Run this in your Supabase SQL Editor

create table if not exists public.applications (
  id            uuid default gen_random_uuid() primary key,
  user_id       uuid references auth.users(id) on delete cascade not null,
  company       text not null,
  role          text not null,
  status        text not null default 'applied'
                check (status in ('applied','interview','offer','rejected','withdrawn')),
  location      text,
  salary_range  text,
  job_url       text,
  notes         text,
  applied_date  date not null default current_date,
  deadline      date,
  ai_fit_score  integer check (ai_fit_score >= 0 and ai_fit_score <= 100),
  ai_feedback   text,
  created_at    timestamptz default now() not null,
  updated_at    timestamptz default now() not null
);

-- Row Level Security: users can only see their own rows
alter table public.applications enable row level security;

create policy "Users can view own applications"
  on public.applications for select
  using (auth.uid() = user_id);

create policy "Users can insert own applications"
  on public.applications for insert
  with check (auth.uid() = user_id);

create policy "Users can update own applications"
  on public.applications for update
  using (auth.uid() = user_id);

create policy "Users can delete own applications"
  on public.applications for delete
  using (auth.uid() = user_id);

-- Index for fast user queries
create index if not exists idx_applications_user_id on public.applications(user_id);
create index if not exists idx_applications_status on public.applications(status);
