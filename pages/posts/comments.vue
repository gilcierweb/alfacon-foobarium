<template>
  <div>
    <v-container class="background-dark">
      <HeaderPages title="My Comments"></HeaderPages>

      <v-row>
        <v-col xl="6" lg="6" md="6" sm="12" :key="id" v-for="{ id, post_id,name, email, body} in user_comments">
          <v-card class="card-bg-dark">
            <v-card-title>{{ name }} - <NuxtLink :to="`posts/${post_id}`"> Post - {{post_id}}</NuxtLink></v-card-title>
            <v-card-subtitle>{{ email }}</v-card-subtitle>
            <v-card-text>
              {{ body }}
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
// id	110
// post_id	100
// name	"Charvi Singh"
// email	"singh_charvi@larson-kub.co"
// body	"Et ratione molestias. Aut doloremque sit."
// https://gorest.co.in/public/v2/comments?access-token=
export default {
  async asyncData({$axios, params}) {

    const ACCESS_TOKEN = process.env.NUXT_ENV_ACCESS_TOKEN
    const user_comments = await $axios.$get(`comments?access-token=/${ACCESS_TOKEN}`)
    // const posts = await $axios.$get(`users/${user_id}/posts`)


    return {user_comments: user_comments,}
  },
}
</script>

<style scoped>

</style>