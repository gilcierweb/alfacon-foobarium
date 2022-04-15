<template>
  <div>
    <v-container class="background-dark">

      <HeaderPages title="Posts"></HeaderPages>

      <v-row>

        <v-col col="12" xl="4" lg="6" md="6" sm="12" :key="id" v-for="{ id, user_id, title, body, user_name, user_posts_count, post_comments_count } in posts">
          <nuxt-link :to="`posts/${id}`">
            <v-card class="card-bg card-size-min">
              <v-card-title>

                <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <circle cx="20" cy="20" r="20" fill="#00F0FF"/>
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M13.8462 13.8462C13.8462 10.4462 16.6 7.69238 20 7.69238C23.4 7.69238 26.1539 10.4462 26.1539 13.8462C26.1539 17.2462 23.4 20.0001 20 20.0001C16.6 20.0001 13.8462 17.2462 13.8462 13.8462Z" fill="white"/>
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M7.69238 35.7658V27.6924C7.69238 23.6001 15.8924 21.5386 20.0001 21.5386C24.1078 21.5386 32.3078 23.6001 32.3078 27.6924V35.7657C28.914 38.4189 24.6417 40.0001 20 40.0001C15.3584 40.0001 11.0861 38.4189 7.69238 35.7658Z" fill="white"/>
                </svg>

                <h3 class="text-h5 font-weight-bold card-title-color ma-3">{{ user_name }}</h3>
                <span class="text-h6 font-weight-light card-title-span-color ma-3">{{ user_posts_count }} posts</span>
              </v-card-title>

              <v-card-title><h1 class="font-weight-bold" :title="title">{{ title | truncate(70, '...') }}</h1>
              </v-card-title>
              <v-card-text>{{ body| truncate(80) }}</v-card-text>

              <v-card-actions class="pt-0">
                <v-btn text color="teal accent-4" @click="reveal = false">
                  {{ post_comments_count }} comments
                </v-btn>
              </v-card-actions>
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
import global from "../../mixins/global";
import filter from '../../plugins/filters'

export default {
  mixins: [global],
  async asyncData({$axios}) {
    let posts_users = []

    const posts = await $axios.$get('posts')

    posts.map(async function (value, key) {
      let user_id = value.user_id
      let post_id = value.id

      const user = await $axios.$get(`users/${user_id}`)
      const user_posts = await $axios.$get(`users/${user_id}/posts`)
      const post_comments = await $axios.$get(`posts/${post_id}/comments`)

      posts_users.push(
          {
            id: value.id,
            title: value.title,
            body: value.body,
            user_id: user_id,
            user_name: user.name,
            user_posts_count: user_posts.length,
            post_comments_count: post_comments.length
          }
      )

    });

    return {posts: posts_users}

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

.card-title-color {
  color: #DDDDDD;
}

.card-title-span-color {
  color: #CCCCCC;
}
</style>
