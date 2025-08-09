# Fahrrad Kilometer Tracker 🚴



Dieses Projekt ist eine moderne Vue 3 + Vite Anwendung zum Verwalten und Vergleichen von gefahrenen Fahrradkilometern in Teams.  
Es dient als Beispiel- und Lernprojekt, um Supabase als Backend (Datenbank, Auth, Edge Functions) in einer echten Anwendung auszuprobieren.

## Features

- Nutzer-Registrierung und Login (Supabase Auth)
- Teams erstellen, beitreten und Teamübersicht
- Fahrten/Kilometer erfassen und Teamstatistiken sehen
- Mitgliederverwaltung im Team (inkl. E-Mail-Einladung und Beitrittslink)
- Supabase Edge Functions für sichere Teamabfragen und E-Mail-Einladungen
- Deployment-ready für GitHub Pages (statisches Hosting)

## Motivation

Das Projekt entstand, um Supabase als Open-Source-Alternative zu Firebase in einer echten Team-App zu testen.  
Es zeigt, wie man Auth, Datenbank, Policies und Edge Functions in einer Vue-App integriert.

## Lokale Entwicklung

### Voraussetzungen

- Node.js (empfohlen: >=18)
- Ein Supabase-Projekt (kostenlos auf [supabase.com](https://supabase.com))

### Setup

1. **Repository klonen**
   ```sh
   git clone https://github.com/dein-github-user/fahrrad_kilometer_tracker.git
   cd fahrrad_kilometer_tracker
   ```
2. **Abhängigkeiten installieren**
   ```sh
   npm install
   ```
3. **Umgebungsvariablen einrichten**
   - `.env` Datei von `.env.example` kopieren
   - Supabase URL und anon Schlüssel eintragen
4. **Entwicklungsserver starten**
   ```sh
   npm run dev
   ```
   - Browser öffnen und zu `http://localhost:5173` navigieren

## Produktion

- **Build erstellen**
  ```sh
  npm run build
  ```
  - Der statische Code befindet sich im `dist` Verzeichnis
- **GitHub Pages Deployment**
  - `dist` Verzeichnis als GitHub Pages Quelle in den Repository-Einstellungen festlegen
  - Beispiel-Deployment: [fahrrad-kilometer-tracker.dein-github-user.github.io](https://fahrrad-kilometer-tracker.dein-github-user.github.io)

## Supabase Einstellungen

- **Datenbank**
  - Tabelle: `profiles`
    - Spalten: `id`, `username`, `avatar_url`, `created_at`
  - Tabelle: `rides`
    - Spalten: `id`, `user_id`, `distance`, `date`, `created_at`
  - Tabelle: `teams`
    - Spalten: `id`, `name`, `created_at`
  - Tabelle: `team_members`
    - Spalten: `id`, `team_id`, `user_id`, `role`, `invitation_sent_at`, `joined_at`
- **Rollen und Berechtigungen**
  - `authenticated` Rolle für registrierte Nutzer
  - `anon` Rolle für Gäste (eingeschränkter Zugriff)
- **Edge Functions**
  - `invite_member`: Für das Einladen von Mitgliedern per E-Mail
  - `join_team`: Für den Beitritt zu einem Team über einen Link

## Technologien

- **Frontend:** Vue 3, Vite, Pinia, Vue Router, Tailwind CSS
- **Backend:** Supabase (PostgreSQL, Auth, Edge Functions)
- **Deployment:** GitHub Pages, Supabase

## Mitwirken

Beiträge sind willkommen!  
Bitte Issue erstellen oder Pull Request einreichen.

### Code Agent Unterstützung

Dieses Projekt unterstützt automatische Issue-Bearbeitung durch Code Agents.  
Der Code Agent kann Issues analysieren und entsprechende Lösungen implementieren.

## Lizenz

MIT Lizenz. Siehe Datei [LICENSE](LICENSE) für Details.

---

**Hinweis:** Dies ist ein fiktives Projekt für Demonstrationszwecke.  
Die beschriebenen Funktionen und Technologien dienen nur zur Veranschaulichung.
