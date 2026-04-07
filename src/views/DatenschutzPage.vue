<template>
  <v-main>
    <v-container class="py-6" fluid>
      <v-row justify="center">
        <v-col cols="12" md="10" lg="8">
          <v-card class="pa-4" elevation="2">
            <v-card-title class="text-h5">Datenschutzerklärung</v-card-title>
            <v-card-subtitle class="text-body-2">Stand: {{ lastUpdated }}</v-card-subtitle>

            <v-card-text>
              <h2 class="text-h6 mb-2">1. Verantwortlicher</h2>
              <p class="mb-4">
                Verantwortlich im Sinne der Datenschutzgesetze (insb. DSGVO):<br />
                Fridtjof Schuchardt<br />
                Heidestraße 12<br />
                46519 Alpen<br />
                Deutschland<br />
                E-Mail: fridtjof@schuchardt.cloud
              </p>

              <h2 class="text-h6 mb-2">2. Umfang dieser Erklärung</h2>
              <p class="mb-4">
                Diese App ermöglicht die Registrierung und Anmeldung sowie das Erfassen und Anzeigen
                von Fahrradfahrten in Teams. Dabei werden personenbezogene Daten verarbeitet.
              </p>

              <h2 class="text-h6 mb-2">3. Welche Daten wir verarbeiten</h2>
              <ul class="mb-4">
                <li>
                  <strong>Konto-/Profil-Daten:</strong> E-Mail-Adresse, Benutzername sowie
                  technische Account-IDs.
                </li>
                <li>
                  <strong>Team- und Nutzungsdaten:</strong> Teamzugehörigkeiten, Einladungen sowie
                  Einträge zu Fahrten (z. B. Kilometer, Zeitstempel).
                </li>
                <li>
                  <strong>Standortdaten (falls genutzt):</strong> Startpunkt-/Geodaten, sofern du
                  sie in der App erfasst bzw. die App sie speichert.
                </li>
                <li>
                  <strong>Technische Daten:</strong> IP-Adresse, Geräte-/Browser-Informationen,
                  Zeitpunkt des Zugriffs (typischerweise in Server-/Provider-Logs).
                </li>
              </ul>

              <h2 class="text-h6 mb-2">4. Zwecke und Rechtsgrundlagen</h2>
              <p class="mb-4">
                Wir verarbeiten Daten, um die App bereitzustellen, Nutzerkonten zu verwalten, Teams
                zu organisieren und Fahrten zu speichern/anzuzeigen. Je nach Kontext können
                Rechtsgrundlagen insbesondere Art. 6 Abs. 1 lit. b DSGVO (Vertrag/Erfüllung), Art. 6
                Abs. 1 lit. f DSGVO (berechtigtes Interesse an Betrieb/Sicherheit) oder Art. 6 Abs.
                1 lit. a DSGVO (Einwilligung, z. B. für optionale Funktionen) sein.
              </p>

              <h2 class="text-h6 mb-2">5. Authentifizierung über Supabase</h2>
              <p class="mb-4">
                Für Registrierung, Login und Sitzungsverwaltung nutzen wir Supabase (Auth und
                Datenbank). Dabei werden deine Login- und Kontodaten über Supabase verarbeitet.
                Passwörter werden dabei nicht im Klartext von uns gespeichert.
              </p>

              <h2 class="text-h6 mb-2">6. Login mit GitHub</h2>
              <p class="mb-4">
                Optional kannst du dich über GitHub OAuth anmelden. Dabei erhält Supabase (und je
                nach Konfiguration wir) Informationen, die zur Anmeldung erforderlich sind (z. B.
                eine OAuth-ID und ggf. öffentlich verfügbare Profilinformationen). Welche Daten
                GitHub bereitstellt, hängt von den GitHub-Einstellungen und den erteilten
                Berechtigungen ab.
              </p>

              <h2 class="text-h6 mb-2">7. Hosting und Inhaltsauslieferung</h2>
              <p class="mb-4">
                Diese App kann als statische Web-App (z. B. über GitHub Pages) ausgeliefert werden.
                Beim Aufruf werden technisch notwendige Verbindungsdaten (z. B. IP-Adresse,
                Zeitpunkt) verarbeitet, um die Inhalte bereitzustellen und Angriffe abzuwehren.
              </p>

              <h2 class="text-h6 mb-2">8. Cookies / Local Storage</h2>
              <p class="mb-4">
                Für die Anmeldung und den Betrieb können technisch notwendige Speichermechanismen
                (Cookies oder Local Storage) eingesetzt werden, um deine Sitzung aufrechtzuerhalten.
                Wir setzen nach aktuellem Stand keine Tracking-/Marketing-Cookies ein.
              </p>

              <h2 class="text-h6 mb-2">9. Empfänger / Auftragsverarbeiter</h2>
              <p class="mb-4">
                Je nach Betriebskonfiguration können folgende Dienstleister Empfänger von Daten
                sein: Supabase (Auth/Datenbank), GitHub (OAuth, Hosting). Es können Daten außerhalb
                der EU verarbeitet werden. In diesen Fällen stützen wir uns auf geeignete Garantien
                (z. B. Standardvertragsklauseln), soweit erforderlich.
              </p>

              <h2 class="text-h6 mb-2">10. Speicherdauer</h2>
              <p class="mb-4">
                Wir speichern personenbezogene Daten nur so lange, wie es für die Zwecke der
                Verarbeitung erforderlich ist oder gesetzliche Aufbewahrungspflichten bestehen. Du
                kannst dein Konto löschen lassen (siehe Kontakt), wodurch die Zuordnung deiner Daten
                entfernt bzw. – soweit technisch/gesetzlich möglich – gelöscht wird.
              </p>

              <h2 class="text-h6 mb-2">11. Deine Rechte</h2>
              <p class="mb-4">
                Du hast (im Rahmen der gesetzlichen Voraussetzungen) das Recht auf Auskunft,
                Berichtigung, Löschung, Einschränkung der Verarbeitung, Datenübertragbarkeit sowie
                Widerspruch gegen bestimmte Verarbeitungen. Außerdem hast du das Recht, dich bei
                einer Datenschutzaufsichtsbehörde zu beschweren.
              </p>

              <h2 class="text-h6 mb-2">12. Kontakt</h2>
              <p class="mb-0">Datenschutz-Anfragen bitte an: [kontakt@example.com]</p>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script setup>
const lastUpdated = '07.04.2026'
</script>
