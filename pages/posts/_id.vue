<template>
  <div>
    <v-container class="background-dark">

      <HeaderPages title="Posts"></HeaderPages>

      <v-row>

        <v-col col="12" sm="12">

          <v-card class="card-bg-details">
            <v-card-title><h1 class="text-h4 font-weight-bold">{{ post.title }}</h1></v-card-title>
            <v-card-title>
              <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="20" cy="20" r="20" fill="#00F0FF"/>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13.8462 13.8462C13.8462 10.4462 16.6 7.69238 20 7.69238C23.4 7.69238 26.1539 10.4462 26.1539 13.8462C26.1539 17.2462 23.4 20.0001 20 20.0001C16.6 20.0001 13.8462 17.2462 13.8462 13.8462Z" fill="white"/>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M7.69238 35.7658V27.6924C7.69238 23.6001 15.8924 21.5386 20.0001 21.5386C24.1078 21.5386 32.3078 23.6001 32.3078 27.6924V35.7657C28.914 38.4189 24.6417 40.0001 20 40.0001C15.3584 40.0001 11.0861 38.4189 7.69238 35.7658Z" fill="white"/>
              </svg>

              <h3 class="text-h5 font-weight-light card-title-color ma-3">JONH USERNAME</h3>
              <span class="text-h6 font-weight-light card-title-span-color ma-3">12 posts</span>
            </v-card-title>
            <v-card-text>
              {{ post.body }}
            </v-card-text
            >
          </v-card>

        </v-col>
      </v-row>

      <v-row>
        <CommentForm/>

        <Comments :postId="post.id"/>
      </v-row>

    </v-container>
  </div>
</template>

<script>
import CommentForm from "../../components/CommentForm";

export default {

  components: {CommentForm},
  async asyncData({$axios, params}) {
    const post_id = params.id
    const post = await $axios.$get(`posts/${post_id}`)
    return {post}
  },
  head() {
    let post = this.post
    return {
      title: post.title,
      meta: [
        {
          hid: 'description',
          name: 'description',
          content: post.body
        }
      ]
    }
  }
}
</script>

<style scoped>

</style>