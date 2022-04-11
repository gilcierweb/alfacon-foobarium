<template>
  <div>
    <v-container class="background-dark">
      <v-row>
        <v-col col="12">
          <h2>Users</h2>
          <v-divider></v-divider>
        </v-col>
      </v-row>

      <v-row>
        <v-col col="12">

          <v-card class="card-bg">
            <v-card-title>{{ user.name | truncate(50) }}</v-card-title>
            <v-card-subtitle>{{ user.email }}</v-card-subtitle>
            <v-card-text
            >{{ user.gender| truncate(80) }} - {{ user.status }}
            </v-card-text
            >
          </v-card>

        </v-col>
      </v-row>

      <v-row>
        <v-col  col="12" lg="6" md="6" :key="id" v-for="{ id, user_id, title, body } in posts">
          <nuxt-link v-if="title !== 'foo'" :to="`/${id}`">
            <v-card class="card-bg">
              <v-card-title>{{ title | truncate(50) }}</v-card-title>
              <v-card-subtitle>Learn Web Development In Chunks</v-card-subtitle>
              <v-card-text
              >{{ body| truncate(80) }}
              </v-card-text
              >
            </v-card>
          </nuxt-link>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  async asyncData({$axios, params}) {
    let user_id = params.id
    const user = await $axios.$get(`users/${user_id}`)
    const posts = await $axios.$get(`users/${user_id}/posts`)

    return {user: user, posts: posts}
  },
}
</script>

<style scoped>

</style>