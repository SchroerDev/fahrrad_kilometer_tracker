<template>
  <v-main>
    <v-container class="py-6" fluid>
      <v-row justify="center">
        <v-col cols="12" md="10" lg="8">
          <v-card class="pa-4" elevation="2">
            <v-card-title class="text-h5">Impressum</v-card-title>
            <v-card-subtitle class="text-body-2">Stand: {{ lastUpdated }}</v-card-subtitle>

            <v-card-text>
              <h2 class="text-h6 mb-2">Angaben gemäß § 5 TMG</h2>
              <p class="mb-4">
                <strong>Betreiber:</strong><br />
                Fridtjof Schuchardt<br />
                Heidestraße 12<br />
                46519 Alpen<br />
                Deutschland
              </p>

              <h2 class="text-h6 mb-2">Kontakt</h2>
              <p class="mb-4">
                <strong>E-Mail:</strong> fridtjof@schuchardt.cloud<br />
              </p>

              <h2 class="text-h6 mb-2">Verantwortlich für den Inhalt</h2>
              <p class="mb-4">
                Verantwortlich nach § 18 Abs. 2 MStV:<br />
                Fridtjof Schuchardt<br />
                Heidestraße 12<br />
                46519 Alpen<br />
                Deutschland
              </p>

              <h2 class="text-h6 mb-2">Haftung für Inhalte</h2>
              <p class="mb-4">
                Wir bemühen uns, die Inhalte dieser App aktuell und korrekt zu halten. Eine Gewähr
                für Vollständigkeit, Richtigkeit und Aktualität kann jedoch nicht übernommen werden.
              </p>

              <h2 class="text-h6 mb-2">Haftung für Links</h2>
              <p class="mb-4">
                Diese App kann Links zu externen Websites enthalten. Auf deren Inhalte haben wir
                keinen Einfluss; für die Inhalte externer Seiten ist stets der jeweilige Anbieter
                oder Betreiber verantwortlich.
              </p>

              <h2 class="text-h6 mb-2">Urheberrecht</h2>
              <p class="mb-0">
                Inhalte und Werke innerhalb dieser App unterliegen dem Urheberrecht. Soweit Inhalte
                nicht vom Betreiber erstellt wurden, werden die Rechte Dritter beachtet.
              </p>
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
