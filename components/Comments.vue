<template>
  <div>
    <v-container>
    <h3 class="text-uppercase">Comments ({{comments.length}})</h3>
    <v-divider></v-divider>

    <v-row>
      <v-col col="12" sm="12" :key="id" v-for="{ id, post_id, name, email, body } in comments">

        <v-card class="card-bg-details">
          <v-card-title>

            <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
              <circle cx="20" cy="20" r="20" fill="#00F0FF"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M13.8462 13.8462C13.8462 10.4462 16.6 7.69238 20 7.69238C23.4 7.69238 26.1539 10.4462 26.1539 13.8462C26.1539 17.2462 23.4 20.0001 20 20.0001C16.6 20.0001 13.8462 17.2462 13.8462 13.8462Z" fill="white"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M7.69238 35.7658V27.6924C7.69238 23.6001 15.8924 21.5386 20.0001 21.5386C24.1078 21.5386 32.3078 23.6001 32.3078 27.6924V35.7657C28.914 38.4189 24.6417 40.0001 20 40.0001C15.3584 40.0001 11.0861 38.4189 7.69238 35.7658Z" fill="white"/>
            </svg>

            <h3 class="text-h5 font-weight-bold card-title-color ma-3 text-uppercase">{{ name }}</h3>
            <span class="text-h6 font-weight-light card-title-span-color ma-3">12 posts</span>
          </v-card-title>
          <v-card-text>{{ body }}</v-card-text>
        </v-card>

      </v-col>
    </v-row>
    </v-container>
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