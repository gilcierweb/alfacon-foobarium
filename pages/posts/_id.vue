<template>
  <div>
    <v-container class="background-dark">

      <HeaderPages title="Posts"></HeaderPages>

      <v-row>

        <v-col col="12" sm="12">

          <div class="card-bg-details">
            <div><h1 class="font-weight-bold text-uppercase title-post-36">{{ post.title }}</h1></div>
            <div class="user-box mt-6 d-flex">
              <NuxtLink :to="`/users/${post.user_id}`" >
                <div class="float-left">
                  <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="20" cy="20" r="20" fill="#00F0FF"/>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M13.8462 13.8462C13.8462 10.4462 16.6 7.69238 20 7.69238C23.4 7.69238 26.1539 10.4462 26.1539 13.8462C26.1539 17.2462 23.4 20.0001 20 20.0001C16.6 20.0001 13.8462 17.2462 13.8462 13.8462Z" fill="white"/>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.69238 35.7658V27.6924C7.69238 23.6001 15.8924 21.5386 20.0001 21.5386C24.1078 21.5386 32.3078 23.6001 32.3078 27.6924V35.7657C28.914 38.4189 24.6417 40.0001 20 40.0001C15.3584 40.0001 11.0861 38.4189 7.69238 35.7658Z" fill="white"/>
                  </svg>
                </div>
                <h3 class="float-left username-title font-weight-bold card-title-color ma-2 text-uppercase " color="white">
                  {{ post.user_name }}
                </h3>
              </NuxtLink>
              <span class="float-left card-title-span-color ma-3 username-comments">{{ post.user_posts_count }}  posts</span>
            </div>
            <div class="post-body">
              <p>
                {{ post.body }}
              </p>
            </div>
          </div>

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

    let post_user = []
    let user_id = post.user_id

    const user = await $axios.$get(`users/${user_id}`)
    const user_posts = await $axios.$get(`users/${user_id}/posts`)

    post_user = {
      id: post.id,
      title: post.title,
      body: post.body,
      user_id: user_id,
      user_name: user.name,
      user_posts_count: user_posts.length,
    }

    return {post: post_user}
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
.user-box {

}
.username-title{
  font-style: normal;
  font-weight: 700;
  font-size: 18px;
  line-height: 22px;
  letter-spacing: -0.1em;
  text-transform: uppercase;
  color: #DDDDDD;
}
.username-comments{
  font-family: 'Oxygen';
  font-style: normal;
  font-weight: 400;
  font-size: 14px;
  line-height: 18px;
  color: #CCCCCC;
}
</style>