<template>
  <v-container>
    <v-row>
      <v-col col="12" sm="12">
        <h3 class="text-uppercase mt-4 mb-5">Make a comment</h3>
        <v-form ref="form" v-model="valid" lazy-validation>
          <v-row>
            <v-col cols="12">

              <v-textarea name="input-7-1"
                  background-color="rgba(255, 255, 255, 0.1)"
                  rows="1"
                  class="textarea-input-custom"
                  filled label="Type here" auto-grow
                  v-model="body"
                  :counter="350"
                  :rules="bodyRules"
                  required
                  value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."
              ></v-textarea>

            </v-col>

            <v-col cols="12" class="d-flex mt-2 float-left">
              <div class="float-left">
                <svg width="24" height="24" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <circle cx="20" cy="20" r="20" fill="#00F0FF"/>
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M13.8462 13.8462C13.8462 10.4462 16.6 7.69238 20 7.69238C23.4 7.69238 26.1539 10.4462 26.1539 13.8462C26.1539 17.2462 23.4 20.0001 20 20.0001C16.6 20.0001 13.8462 17.2462 13.8462 13.8462Z" fill="white"/>
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M7.69238 35.7658V27.6924C7.69238 23.6001 15.8924 21.5386 20.0001 21.5386C24.1078 21.5386 32.3078 23.6001 32.3078 27.6924V35.7657C28.914 38.4189 24.6417 40.0001 20 40.0001C15.3584 40.0001 11.0861 38.4189 7.69238 35.7658Z" fill="white"/>
                </svg>
              </div>
              <h3 class="float-left font-weight-bold ma-1 text-uppercase username-title">YOU</h3>

              <div class="ml-auto flex-column-reverse mb-6 font-weight-bold">
                <v-btn :disabled="!valid" color="#00F0FF"  @click="validate">
                  Send
                </v-btn>

                <!--                <v-btn color="error" class="mr-4" @click="reset">-->
                <!--                  Reset Form-->
                <!--                </v-btn>-->

                <!--                <v-btn color="warning" @click="resetValidation">-->
                <!--                  Reset Validation-->
                <!--                </v-btn>-->
              </div>
            </v-col>
          </v-row>
        </v-form>
      </v-col>
    </v-row>

    <v-snackbar v-model="snackbar" :right="true" :top="true" :vertical="true" timeout="8000" color="success">
      <p class="text--white font-weight-bold">{{ text }}</p>
      <template v-slot:action="{ attrs }">
        <v-btn color="red" text v-bind="attrs" @click="snackbar = false">
          Close
        </v-btn>
      </template>
    </v-snackbar>

  </v-container>

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
  },
  data: () => ({
    valid: true,
    id: '',
    body: '',
    bodyRules: [
      v => !!v || 'Comment is required',
      v => (v && v.length <= 350) || 'Comment must be less than 350 characters',
    ],
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
      let post_id = this.$route.params.id
      const data = {body: this.body, name: 'gilweb', email: 'gil@mail.com'} // required on API

      const comment = await this.$axios.post(`/posts/${post_id}/comments`, data, headers)
      this.snackbar = false
      this.reset()
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
.textarea-input-custom {
  min-height: 58px !important;
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid #747784;
  box-sizing: border-box;
  border-radius: 5px;
}

.username-title {
  font-style: normal;
  font-weight: 700;
  font-size: 16px;
  line-height: 20px;
  letter-spacing: -0.1em;
  color: #DDDDDD;
}
</style>