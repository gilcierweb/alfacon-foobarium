<template>
  <div>
    <v-container class="background-dark">

      <v-col col="12">
        <h2>Posts</h2>
        <v-divider></v-divider>
      </v-col>

      <v-row>

        <v-col col="12" lg="6" md="6" sm="12" :key="id" v-for="{ id, user_id, title, body } in posts">
          <nuxt-link v-if="title !== 'foo'" :to="`posts/${id}`">
          <v-card class="card-bg">
            <v-card-title>{{ title | truncate(40)}}</v-card-title>
            <v-card-subtitle>Learn Web Development In Chunks</v-card-subtitle>
            <v-card-text
            >{{body| truncate(80)}}
            </v-card-text
            >
          </v-card>
          </nuxt-link>
        </v-col>



        <v-col col="12">
          <v-card class="card-bg-dark">
            <v-card-title>Chunk Bytes</v-card-title>
            <v-card-subtitle>Learn Web Development In Chunks</v-card-subtitle>
            <v-card-text
            >Joke of the Day: debugging is removing the needles from the haystack.
            </v-card-text
            >
          </v-card>
        </v-col>

      </v-row>
    </v-container>
  </div>
</template>

<script>
import filter from '../../plugins/filters'
export default {
  async asyncData({ $axios }) {
    const posts = await $axios.$get('posts')
    // const comments = await $axios.$get('posts/post_id/comments')
    return { posts }
  },


};
</script>

<style lang="scss" scoped>
.background-dark {
  background: #41434B;

}

.card-bg {
  background: #61646D;
  border-radius: 15px;
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.25);
}

.card-bg-dark {
  background: #494B53;
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.25);
  border-radius: 15px;
}
</style>
