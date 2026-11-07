# Turn on Good Move accounts

The signup page uses Supabase Auth and a private per-user workout log. The HTML is ready, but sign-up and saving stay disabled until the site owner connects a Supabase project.

1. Create a Supabase project at [supabase.com](https://supabase.com/).
2. In that project's SQL Editor, run the contents of `workout_logs_setup.sql`.
3. Copy the project URL and the project's publishable key (or legacy anon key) from Project Settings → API Keys.
4. In `signup.html`, replace `PASTE_SUPABASE_PROJECT_URL_HERE` and `PASTE_SUPABASE_PUBLISHABLE_KEY_HERE` with those values.
5. Create a Google OAuth client in the [Google Cloud Console](https://console.cloud.google.com/) for a Web application. Add `https://ranveer6789021-sys.github.io` as an authorized JavaScript origin. Use the callback URL shown in Supabase's Google provider settings as the authorized redirect URI.
6. In Supabase Authentication → Sign In / Providers → Google, enable Google and enter the Google OAuth client ID and client secret. Keep the client secret in Supabase; never put it in the public website.
7. In Supabase Authentication → URL Configuration, set the site URL to `https://ranveer6789021-sys.github.io/EXERCISE-VEIWS/` and allow the redirect URL `https://ranveer6789021-sys.github.io/EXERCISE-VEIWS/signup.html`.
8. In `signup.html`, replace `PASTE_SUPABASE_PROJECT_URL_HERE` and `PASTE_SUPABASE_PUBLISHABLE_KEY_HERE` with the project URL and publishable key from Project Settings → API Keys.
9. Commit the updated `signup.html` and publish the repository again.

Only use the public publishable/anon key in `signup.html`. Never put a `service_role` key or other secret in a public website. The SQL enables row level security so each signed-in person can read, add, and remove only their own workout records.

The sign-in page offers Google OAuth and email/password. Supabase account creation and email confirmation follow the project's Auth settings. Email confirmation should remain enabled for a public site.

The Kids / Adult view switch is a saved display preference in each browser. It changes the guidance and sign-in prompt, but it is not age verification or an account access restriction. Children should use the site with a parent or guardian.
