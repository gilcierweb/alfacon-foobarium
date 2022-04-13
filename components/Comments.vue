<template>
  <div>
    <h1>Comments ({{comments.length}})</h1>
    <v-divider></v-divider>

    <v-row>
      <v-col col="12" sm="12" :key="id" v-for="{ id, post_id, name, email, body } in comments">

        <v-card class="card-bg-details">
          <v-card-title>{{ name }}</v-card-title>
          <v-card-subtitle>{{ email }}</v-card-subtitle>
          <v-card-text>{{ body }}</v-card-text>
        </v-card>

      </v-col>
    </v-row>

  </div>
</template>

<script>
export default {
  name: 'Comments',

  props: {
    postId: Number
  },

  data: () => ({
        comments: [],
      }
  ),

  async fetch() {
    let post_id = this.postId
    this.comments = await this.$axios.$get(`posts/${post_id}/comments`)
  },

  mounted: function () {
    this.fetch
  }
}
</script>

<style scoped>

</style>