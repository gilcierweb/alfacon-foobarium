<template>
  <div>
    <v-container class="background-dark">

      <HeaderPages title="Users"></HeaderPages>

      <v-row>
        <v-col col="12">

          <v-card class="card-bg-details">
            <v-card-title>
              <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="20" cy="20" r="20" fill="#00F0FF"/>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M13.8462 13.8462C13.8462 10.4462 16.6 7.69238 20 7.69238C23.4 7.69238 26.1539 10.4462 26.1539 13.8462C26.1539 17.2462 23.4 20.0001 20 20.0001C16.6 20.0001 13.8462 17.2462 13.8462 13.8462Z" fill="white"/>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M7.69238 35.7658V27.6924C7.69238 23.6001 15.8924 21.5386 20.0001 21.5386C24.1078 21.5386 32.3078 23.6001 32.3078 27.6924V35.7657C28.914 38.4189 24.6417 40.0001 20 40.0001C15.3584 40.0001 11.0861 38.4189 7.69238 35.7658Z" fill="white"/>
              </svg>
              <h3 class="text-h4 font-weight-light card-title-color ma-3">{{user.name}}</h3> <span class="text-h6 font-weight-light card-title-span-color ma-3">12 posts</span>
            </v-card-title>
            <v-card-subtitle>{{ user.email }}</v-card-subtitle>
            <v-card-text>{{ gender_i18n(user.gender) }} - {{ status_i18n(user.status) }} </v-card-text>
            <v-card-actions class="pt-0">
              <v-btn text color="teal accent-4" @click="reveal = false">
                12 comments
              </v-btn>
            </v-card-actions>
          </v-card>

        </v-col>
      </v-row>

      <v-row>
        <v-col col="12" lg="6" md="6" :key="id" v-for="{ id, user_id, title, body } in posts">
          <nuxt-link v-if="title !== 'foo'" :to="`/posts/${id}`">
            <v-card class="card-bg">
              <v-card-title>{{ title }}</v-card-title>
              <v-card-subtitle>Learn Web Development In Chunks</v-card-subtitle>
              <v-card-text
              >{{ body | truncate(80) }}
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
import filter from '../../plugins/filters'
import global from "../../mixins/global";

export default {
  mixins: [global],
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