# Fahrrad Kilometer Tracker

A modern Vue 3 + Vite progressive web application for tracking and comparing bicycle kilometers in teams, using Supabase as the backend for database, authentication, and edge functions.

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Working Effectively

### Bootstrap and Development Setup

- **Node.js Requirements**: Node.js >=18 (v20.19.4 validated)
- **Install dependencies**:

  ```bash
  npm install
  ```

  - Takes ~2 minutes 20 seconds. NEVER CANCEL. Set timeout to 5+ minutes.

- **Environment setup**:

  ```bash
  cp .env.example .env
  ```

  - Edit `.env` file and add your Supabase URL and API keys

### Build and Development Commands

- **Development server**:

  ```bash
  npm run dev
  ```

  - Starts Vite dev server on `http://localhost:5173/fahrrad_kilometer_tracker/`
  - Ready in ~300ms
  - Hot reload enabled for all Vue/JS/CSS changes

- **Production build**:

  ```bash
  npm run build
  ```

  - Takes ~8 seconds. NEVER CANCEL. Set timeout to 2+ minutes.
  - Outputs to `docs/` directory (configured for GitHub Pages)
  - Creates PWA service worker and manifest files
  - May show warnings about large chunks (normal, can be ignored)

- **Preview production build**:

  ```bash
  npm run preview
  ```

  - Serves production build on `http://localhost:4173/fahrrad_kilometer_tracker/`
  - Use this to test production builds locally

### Supabase Local Development

- **Install Supabase CLI**:
  ```bash
  curl -fsSL https://github.com/supabase/cli/releases/download/v2.30.4/supabase_linux_amd64.tar.gz | tar -xz
  ```
- **Start local Supabase stack**:

  ```bash
  ./supabase start
  ```

  - Takes 5-10 minutes on first run to download Docker images. NEVER CANCEL. Set timeout to 15+ minutes.
  - Requires Docker to be running
  - Provides local database, auth, API, and studio on various ports (54321-54327)
  - **CRITICAL**: Wait for complete initialization before proceeding

- **Stop local Supabase**:
  ```bash
  ./supabase stop
  ```

## Validation and Testing

### Manual Application Validation

ALWAYS run through these complete user scenarios after making changes:

1. **Registration Flow Validation**:
   - Navigate to `http://localhost:5173/fahrrad_kilometer_tracker/`
   - Should redirect to login page
   - Click "Hier registrieren" link
   - Verify registration form has: E-Mail, Passwort, Benutzername fields
   - Verify "Mit GitHub registrieren" button exists
   - Test form validation (empty fields should show errors)

2. **Login Flow Validation**:
   - Navigate to login page
   - Verify login form has: E-Mail, Passwort fields
   - Verify "Mit GitHub anmelden" button exists
   - Test form validation

3. **Application Startup Validation**:
   - Check browser console for errors (should only see Vite connection messages)
   - Verify Supabase connection (check for "Supabase URL" in console)
   - Ensure UI renders properly with Vuetify components

### Build Validation

- Always run `npm run build` to ensure production build succeeds
- Always run `npm run preview` and manually test the built application
- Check that PWA files are generated (`docs/sw.js`, `docs/manifest.webmanifest`)

### Automated Testing Framework

- **Run tests**:
  ```bash
  npm run test
  ```
  - Runs Vitest test suite in watch mode
  - Takes ~1.4 seconds
  - 16 tests covering ride service functionality

- **Run tests once**:
  ```bash
  npm run test:run
  ```
  - Runs Vitest test suite once (non-watch mode)
  - Takes ~1.4 seconds

- **Run tests with UI**:
  ```bash
  npm run test:ui
  ```
  - Opens Vitest UI in browser for interactive testing

### Code Quality and Linting

- **Run ESLint**:
  ```bash
  npm run lint
  ```
  - Takes ~1.6 seconds
  - Checks all .js, .vue, and .mjs files
  - Currently finds 5 errors and 1 warning that need fixing

- **Auto-fix ESLint issues**:
  ```bash
  npm run lint:fix
  ```
  - Automatically fixes ESLint issues where possible

- **Format code with Prettier**:
  ```bash
  npm run format
  ```
  - Takes ~8 seconds
  - Formats all files according to .prettierrc configuration

### CI/CD Validation

- **CRITICAL**: Always run these commands before committing to ensure CI passes:
  ```bash
  npm run lint
  npm run test:run
  npm run build
  ```
- The GitHub Actions workflow (.github/workflows/eslint.yml) will fail if linting errors exist

## Project Structure and Key Files

### Core Application Files

```
src/
├── main.js              # Vue app initialization with Vuetify and routing
├── App.vue              # Root component
├── supabaseClient.js    # Supabase client configuration
├── router/              # Vue Router configuration
├── views/               # Page components
└── components/          # Reusable components
```

### Configuration Files

```
package.json             # Dependencies and npm scripts
vite.config.js          # Vite build configuration with PWA
vitest.config.js        # Vitest test configuration
eslint.config.js        # ESLint linting configuration
.prettierrc             # Prettier formatting configuration
jsconfig.json           # JavaScript project configuration
.env.example            # Environment variables template
.vscode/extensions.json  # Recommended VSCode extensions (Deno)
```

### Test Files

```
tests/
└── rideService.test.js  # Comprehensive tests for ride service (16 tests)
```

### Supabase Configuration

```
supabase/
├── config.toml                                    # Supabase local development config
├── migrations/20250708113412_initial_structure.sql # Database schema
└── seed.sql                                       # Sample data
```

### Database Schema

- **profiles**: User profiles (id, username, created_at)
- **teams**: Team information (id, name, created_by, created_at)
- **members**: Team membership (user_id, team_id)
- **rides**: Bicycle rides (id, user_id, km, StartPoint, created_at)
- Uses PostGIS extension for geographical data
- Row Level Security (RLS) policies implemented

## Key Technologies

### Frontend Stack

- **Vue 3**: Progressive framework with Composition API
- **Vite**: Build tool and development server
- **Vuetify 3**: Material Design component library
- **Vue Router**: Client-side routing
- **MapLibre GL**: Map rendering for geographical features

### Backend Stack

- **Supabase**: Database, authentication, real-time, edge functions
- **PostgreSQL**: Database with PostGIS extension
- **Supabase Auth**: User authentication with GitHub OAuth

### Deployment

- **GitHub Pages**: Static hosting (outputs to `docs/` directory)
- **PWA**: Progressive Web App with service worker and manifest
- **Base path**: `/fahrrad_kilometer_tracker/` (configured for GitHub Pages)

## Common Development Tasks

### Adding New Pages

1. Create Vue component in `src/views/`
2. Add route in `src/router/index.js`
3. Test navigation in development server

### Database Changes

1. Create new migration file in `supabase/migrations/`
2. Test with local Supabase: `./supabase db reset`
3. Apply to production via Supabase dashboard

### Styling Changes

- Uses Vuetify theming system (configured in `src/main.js`)
- Custom CSS in `src/style.css`
- Material Design Icons available via `@mdi/font`

### Environment Variables

Required in `.env` file:

```
VITE_SUPABASE_URL=https://XXXXXXXXXXXXXXXXX.supabase.co
VITE_SUPABASE_ANON_KEY=XXXXXXXXXXXXXXXXX
VITE_SUPABASE_FUNCTIONS_URL=https://XXXXXXXXXXXXXXXXX.supabase.co/functions/v1
```

## Troubleshooting

### Common Issues

- **Build fails**: Check for syntax errors in Vue components or missing imports
- **Dev server won't start**: Ensure port 5173 is available
- **Supabase connection fails**: Verify environment variables in `.env`
- **PWA not working**: Rebuild application and check service worker registration

### Performance Notes

- Large bundle warning is normal (Vuetify + MapLibre are large)
- First Supabase start downloads ~2GB of Docker images
- Development mode includes helpful Vue DevTools integration

## Deployment Process

### GitHub Pages Deployment

1. Ensure base path is set to `/fahrrad_kilometer_tracker/` in `vite.config.js`
2. Run `npm run build` (outputs to `docs/`)
3. Push to GitHub
4. Enable GitHub Pages with `docs/` as source in repository settings
5. Access at: `https://username.github.io/fahrrad_kilometer_tracker/`

### Production Environment Setup

- Configure production Supabase project
- Update environment variables for production URLs
- Enable necessary OAuth providers in Supabase Auth settings
- Configure email templates for user invitations

This application is fully functional for development and can be built/deployed successfully. Always test complete user flows manually after making changes since there are no automated tests.
