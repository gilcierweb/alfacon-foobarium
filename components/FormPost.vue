<template>
  <div>
    <v-container>
      <v-row>
        <v-col col="12" sm="12">
          <h3 class="text-uppercase mt-4 mb-5">New Post</h3>
          <v-form ref="form" v-model="valid" lazy-validation>

            <v-text-field v-model="title" :counter="248" :rules="titleRules" label="Title"
                required single-line outlined background-color="rgba(255, 255, 255, 0.1)"
            ></v-text-field>

            <v-textarea name="input-7-1"
                background-color="rgba(255, 255, 255, 0.1)"
                rows="5"
                filled label="Body here" auto-grow
                v-model="body"
                :counter="600"
                :rules="bodyRules"
                required
                single-line outlined
            ></v-textarea>

            <v-text-field v-model="user_id" :counter="10" label="User ID"
                required single-line outlined background-color="rgba(255, 255, 255, 0.1)"
            ></v-text-field>

            <v-btn :disabled="!valid"
                color="success" class="mr-4" @click="validate">
              Save
            </v-btn>

            <v-btn color="error" class="mr-4" @click="reset">
              Reset Form
            </v-btn>

            <v-btn color="warning" @click="resetValidation">
              Reset Validation
            </v-btn>
          </v-form>

        </v-col>

        <v-col col="12" sm="12" v-if="post" :key="id" v-for="{ id, user_id, title, body } in post">
          <NuxtLink :to="`posts/${id}`">
            <v-card class="card-bg-dark">
              <v-card-title><h1 class="font-weight-bold text-uppercase title-post-24" :title="title">{{ title }} - {{ id }} - {{ user_id }}</h1></v-card-title>
              <v-card-text class="post-body-16"> {{ body }}
              </v-card-text>
            </v-card>
          </NuxtLink>
        </v-col>
      </v-row>
    </v-container>

    <v-snackbar v-model="snackbar" :right="true" :top="true" :vertical="true" timeout="8000" color="success">
      <p class="text--white font-weight-bold">{{ text }}</p>
      <template v-slot:action="{ attrs }">
        <v-btn color="red" text v-bind="attrs" @click="snackbar = false">
          Close
        </v-btn>
      </template>
    </v-snackbar>
  </div>
</template>

<script>
// id, user_id, title, body,
// /public/v2/users/100/posts
export default {
  name: 'FormPost',
  data: () => ({
    valid: true,
    title: '',
    titleRules: [
      v => !!v || 'Name is required',
      v => (v && v.length <= 248) || 'Name must be less than 248 characters',
    ],
    body: '',
    bodyRules: [
      v => !!v || 'Name is required',
      v => (v && v.length <= 600) || 'Name must be less than 600 characters',
    ],
    user_id: '',
    post: [],
    snackbar: false,
    text: `Dados gravados com sucesso!`,
  }),

  methods: {
    async validate({$axios, params}) {
      this.snackbar = true
      this.$refs.form.validate()
      const ACCESS_TOKEN = process.env.NUXT_ENV_ACCESS_TOKEN

      let headers = {
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          "Authorization": `Bearer ${ACCESS_TOKEN}`,
        }
      }

      const data = {title: this.title, body: this.body, user_id: this.user_id} // required on API

      let post = await this.$axios.post(`users/${this.user_id}/posts`, data, headers)
      this.snackbar = false
      this.reset()
      this.post = post
      // return {post}
    },
    reset() {
      this.$refs.form.reset()
    },
    resetValidation() {
      this.$refs.form.resetValidation()
    },
  },
}
</script>

<style scoped>

</style>