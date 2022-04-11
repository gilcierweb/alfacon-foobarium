<template>
  <div>
    <v-container class="background-dark">

      <v-col col="12">
        <h2>Posts</h2>
        <v-divider></v-divider>
      </v-col>

      <v-row>

        <v-col col="12" sm="12">

            <v-card class="card-bg">
              <v-card-title>{{ post.title}}</v-card-title>
              <v-card-subtitle>Learn Web Development In Chunks</v-card-subtitle>
              <v-card-text
              >{{post.body}}
              </v-card-text
              >
            </v-card>

        </v-col>

      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  async asyncData({ $axios, params }) {
    let post_id = params.id
    const post = await $axios.$get(`posts/${post_id}`)
    // const comments = await $axios.$get('posts/post_id/comments')
    return { post }
  },
}
</script>

<style scoped>

</style>