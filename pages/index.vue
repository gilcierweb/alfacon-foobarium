<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="8" md="6">
      <v-card class="logo py-4 d-flex justify-center">
        <NuxtLogo/>
        <VuetifyLogo/>
      </v-card>
      <v-card>
        <v-card-title class="headline">
          Welcome to the FOOBARIUM
        </v-card-title>
        <v-card-text>
          <p>Application developer with Vue.js, Nuxt.js, Node.js, vuetify UI, Docker and Docker Compose.</p>
          <p>
            <NuxtLink to="posts">
              POSTS
            </NuxtLink>
          </p>
          <p>
            <NuxtLink to="users">
              USERS
            </NuxtLink>
          </p>
          <p>
            Find a bug? Report it on the github <a
              href="https://github.com/gilcierweb"
              target="_blank"
              rel="noopener noreferrer"
              title="GilicerWeb"
          > GilicerWeb </a>.
          </p>

          <div class="text-xs-right">
            <em><small>&mdash; GilcierWeb</small></em>
          </div>
          <hr class="my-3">
          <a href="https://gilcierweb.com.br/"
              target="_blank"
              rel="noopener noreferrer"
          > GilcierWeb </a>
          <br> <a href="https://www.alfaconcursos.com.br/"
            target="_blank"
            rel="noopener noreferrer"
            title="AlfaCon - Concursos"
        > AlfaCon - Concursos </a>
        </v-card-text>
        <v-card-actions>
          <v-spacer/>
          <v-btn color="primary" nuxt to="/inspire">
            Continue
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: 'IndexPage'
}
</script>
