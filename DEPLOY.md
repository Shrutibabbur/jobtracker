# Deploy in 10 Minutes

## Step 1 — Supabase (Database + Auth)

1. Go to https://supabase.com → New project
2. Copy your **Project URL** and **anon public key** from Settings → API
3. Go to SQL Editor → paste contents of `SUPABASE_SCHEMA.sql` → Run
4. Go to Authentication → Email Templates → confirm email is enabled

## Step 2 — Environment Variables

Create `.env.local` in project root:
```
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
ANTHROPIC_API_KEY=your-anthropic-key   # optional, enables real AI scoring
```

## Step 3 — Run locally

```bash
npm install
npm run dev
# Open http://localhost:3000
```

## Step 4 — Deploy to Vercel (free)

```bash
npm i -g vercel
vercel
```

When prompted, add the same environment variables in Vercel dashboard:
- Settings → Environment Variables
- Add NEXT_PUBLIC_SUPABASE_URL, NEXT_PUBLIC_SUPABASE_ANON_KEY, ANTHROPIC_API_KEY

## Step 5 — Supabase redirect URL

In Supabase → Authentication → URL Configuration:
- Site URL: `https://your-app.vercel.app`
- Redirect URLs: `https://your-app.vercel.app/**`

## Get an Anthropic API Key (for real AI scoring)
1. Go to https://console.anthropic.com
2. API Keys → Create Key
3. Add as ANTHROPIC_API_KEY in Vercel env vars

Without the key, a demo score is shown instead.

## Tech Stack Summary
- **Frontend**: Next.js 14 (App Router) + TypeScript
- **Auth**: Supabase Auth (email/password)
- **Database**: Supabase PostgreSQL with Row Level Security
- **AI**: Claude Haiku via Anthropic API
- **Hosting**: Vercel (free tier)
- **Styling**: Custom CSS variables (no UI library needed)
