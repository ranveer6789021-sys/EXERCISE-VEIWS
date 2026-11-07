# Turn on Good Move accounts

The signup page uses Supabase Auth and a private per-user workout log. The HTML is ready, but sign-up and saving stay disabled until the site owner connects a Supabase project.

1. Create a Supabase project at [supabase.com](https://supabase.com/).
2. In that project's SQL Editor, run the contents of `workout_logs_setup.sql`.
3. Copy the project URL and the project's publishable key (or legacy anon key) from Project Settings → API Keys.
4. In `signup.html`, replace `PASTE_SUPABASE_PROJECT_URL_HERE` and `PASTE_SUPABASE_PUBLISHABLE_KEY_HERE` with those values.
5. In Supabase Authentication → URL Configuration, add the published website URL to the allowed redirect URLs.
6. Publish `index.html`, `signup.html`, and `workout_logs_setup.sql`'s companion site files together again.

Only use the public publishable/anon key in `signup.html`. Never put a `service_role` key or other secret in a public website. The SQL enables row level security so each signed-in person can read, add, and remove only their own workout records.

Supabase account creation and email confirmation follow the project's Auth settings. Email confirmation should remain enabled for a public site.
