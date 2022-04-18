<template>
  <div>
    <v-container class="background-dark">
      <HeaderPages title="My posts"></HeaderPages>

      <v-row>
        <v-col xl="6" lg="6" md="6" sm="12" :key="id" v-for="{ id, user_id, title, body} in user_posts">
          <NuxtLink :to="`/posts/${id}`">
            <v-card class="card-bg-dark">
              <v-card-title><h1 class="font-weight-bold text-uppercase title-post-24" :title="title">
                {{ title | truncate(70, '...') }}</h1>
              </v-card-title>
              <v-card-text class="post-body-16">{{ body| truncate(230, '...') }}</v-card-text>
            </v-card>
          </NuxtLink>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  async asyncData({$axios, params}) {

    const ACCESS_TOKEN = process.env.NUXT_ENV_ACCESS_TOKEN
    const user_posts = await $axios.$get(`posts?access-token=/${ACCESS_TOKEN}`)

    return {user_posts: user_posts,}
  },
}
</script>

<style scoped>

</style>