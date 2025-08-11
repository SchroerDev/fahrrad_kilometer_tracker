# Fahrrad Kilometer Tracker

A modern Vue 3 + Vite progressive web application for tracking and comparing bicycle kilometers in teams, using Supabase as the backend for database, authentication, and edge functions.

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Primary Development Focus

This project primarily supports **bugfixes** and **UI changes**. The key to successful development is understanding and effectively using the different tools integrated into the project:

- **Testing**: `npm run test` (your most important tool - use it frequently)
- **Linting**: `npm run lint` (catch code quality issues early)
- **Building**: `npm run build` (verify production readiness)
- **Development**: `npm run dev` (hot reload for rapid iteration)

**Goal**: Achieve full test coverage across all application functionality. The current test suite provides a foundation, but comprehensive coverage of all components and user flows is highly desirable.

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

### Automated Testing Framework (Primary Tool)

**⭐ MOST IMPORTANT**: `npm run test` is your primary development tool. Use it frequently during development!

- **Run tests in watch mode** (recommended for active development):
  ```bash
  npm run test
  ```
  - Runs Vitest test suite in watch mode
  - Takes ~1.4 seconds
  - 16 tests covering ride service functionality
  - Automatically re-runs tests when files change
  - **Use this constantly while developing**

- **Run tests once**:
  ```bash
  npm run test:run
  ```
  - Runs Vitest test suite once (non-watch mode)
  - Takes ~1.4 seconds
  - Use before commits and in CI

- **Run tests with UI**:
  ```bash
  npm run test:ui
  ```
  - Opens Vitest UI in browser for interactive testing
  - Great for debugging failing tests and exploring coverage

**Testing Strategy**: Full test coverage is highly desirable. The current test suite provides a solid foundation with comprehensive ride service testing, but expanding coverage to all components, views, and user interactions would significantly improve code quality and development confidence.

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

### Bugfix Workflow

1. **Identify the issue**: Reproduce the bug and understand the expected behavior
2. **Write/update tests**: Use `npm run test` to create tests that demonstrate the bug
3. **Run tests**: Verify the test fails (`npm run test:run`)
4. **Fix the bug**: Make minimal code changes to address the issue
5. **Validate fix**: Ensure tests pass (`npm run test`)
6. **Quality check**: Run `npm run lint` and `npm run build`
7. **Manual validation**: Test the fix in the browser (`npm run dev`)

### UI Changes Workflow

1. **Start development server**: `npm run dev` for hot reload
2. **Run tests in watch mode**: `npm run test` (keep running during development)
3. **Make UI changes**: Edit Vue components, CSS, or Vuetify configurations
4. **Test responsiveness**: Check different screen sizes and devices
5. **Validate accessibility**: Ensure proper contrast, keyboard navigation
6. **Run linting**: `npm run lint` to catch styling issues
7. **Build verification**: `npm run build` and `npm run preview` to test production build
8. **Write tests**: Add component tests for new UI functionality

### Understanding Project Tools

**Essential Tools Overview**:
- **Vitest**: Testing framework (`npm run test`) - your primary development tool
- **ESLint**: Code linting (`npm run lint`) - catches errors and enforces code style
- **Prettier**: Code formatting (`npm run format`) - consistent code style
- **Vite**: Build tool and dev server (`npm run dev`, `npm run build`)
- **Vue 3**: Frontend framework with Composition API
- **Vuetify 3**: Material Design UI components
- **Supabase**: Backend database, auth, and real-time features

**Tool Integration**: All tools work together seamlessly. The test suite validates functionality, ESLint ensures code quality, Prettier maintains formatting consistency, and Vite provides fast development and production builds.

### Adding New Pages (UI Development)

1. Create Vue component in `src/views/`
2. Add route in `src/router/index.js`
3. **Write tests**: Add component tests for new page functionality
4. **Test development**: Use `npm run test` while developing
5. Test navigation in development server (`npm run dev`)
6. **Quality check**: Run `npm run lint` and `npm run build`

### Database Changes

1. Create new migration file in `supabase/migrations/`
2. Test with local Supabase: `./supabase db reset`
3. Apply to production via Supabase dashboard

### Styling Changes (UI Development)

- Uses Vuetify theming system (configured in `src/main.js`)
- Custom CSS in `src/style.css`
- Material Design Icons available via `@mdi/font`
- **Development workflow**: 
  1. Use `npm run dev` for hot reload while styling
  2. Keep `npm run test` running to catch any regressions
  3. Run `npm run lint` to validate CSS and component structure
  4. Test responsive design on different screen sizes

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

This application is fully functional for development and can be built/deployed successfully. The comprehensive testing framework, linting tools, and development setup support efficient bugfix and UI development workflows. Use `npm run test` as your primary development tool to ensure code quality and catch regressions early.
