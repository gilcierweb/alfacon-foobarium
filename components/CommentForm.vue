<template>

  <v-col col="12" sm="12">
    <h1>Make a comment</h1>
    <v-form ref="form" v-model="valid" lazy-validation>

      <v-col cols="12">

        <v-textarea name="input-7-1"
            filled label="Label" auto-grow
            v-model="body"
            :counter="350"
            :rules="bodyRules"
            required
            value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."
        ></v-textarea>

      </v-col>

      <v-col cols="12">
        <v-btn :disabled="!valid" color="success" class="mr-4" @click="validate">
          Validate - {{ id }}
        </v-btn>
        <v-btn
            color="error"
            class="mr-4"
            @click="reset"
        >
          Reset Form
        </v-btn>

        <v-btn
            color="warning"
            @click="resetValidation"
        >
          Reset Validation
        </v-btn>
      </v-col>

    </v-form>
  </v-col>

</template>

<script>
// /public/v2/posts/100/comments
// {
//   "id": 109,
//     "post_id": 100,
//     "name": "Aadi Iyer",
//     "email": "aadi_iyer@abshire-ward.com",
//     "body": "Quidem quas est. Fugiat impedit aut. Adipisci repudiandae odio. Sit maiores nulla."
// }

export default {
  name: 'CommentForm',
  async asyncData({$axios, params}) {
    // let post
    this.id = params.id
    // let post_id = params.id
    // const data = { body: this.body,     }
    // const comments = await $axios.$post(`/posts/${post_id}/comments`, data)
    // // const comments = await $axios.$get('posts/post_id/comments')
    // return {comments}
  },
  data: () => ({
    valid: true,
    id: '',
    body: '',
    bodyRules: [
      v => !!v || 'Name is required',
      v => (v && v.length <= 350) || 'Name must be less than 350 characters',
    ],

  }),

  methods: {
    async validate({$axios, params}) {
      this.$refs.form.validate()
      const ACCESS_TOKEN = process.env.ACCESS_TOKEN
      let headers = {
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          "Authorization": `Bearer ${ACCESS_TOKEN}`,
        }
      }
      let post_id = this.$route.params.id
      const data = {body: this.body, name: 'gilweb', email: 'gil@mail.com'}
      const comment = await this.$axios.post(`/posts/${post_id}/comments`, data, headers)
      return {comment}
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