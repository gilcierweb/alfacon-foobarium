<template>
  <div>
    <v-container>
      <v-row>
        <v-col col="12" sm="12">
          <h3 class="text-uppercase mt-4 mb-5">New User</h3>
          <v-form ref="form" v-model="valid" lazy-validation>

            <v-text-field v-model="name" :counter="248" :rules="nameRules" label="Name"
                required single-line outlined background-color="rgba(255, 255, 255, 0.1)"
            ></v-text-field>

            <v-text-field v-model="email" :rules="emailRules"
                label="E-mail" required single-line outlined background-color="rgba(255, 255, 255, 0.1)"></v-text-field>

            <v-row>
              <v-col cols="6">
                <v-select v-model="gender"
                    :items="items"
                    :rules="[v => !!v || 'Gender is required']"
                    label="Gender"
                    required single-line outlined background-color="rgba(255, 255, 255, 0.1)"
                ></v-select>
              </v-col>
              <v-col cols="6">
                <v-select
                    v-model="status"
                    :items="items_status"
                    :rules="[v => !!v || 'Status is required']"
                    label="Status"
                    required single-line outlined background-color="rgba(255, 255, 255, 0.1)"
                ></v-select>
              </v-col>
            </v-row>
            <v-btn :disabled="!valid"
                color="success" class="mr-4" @click="validate">
              Save
            </v-btn>

            <v-btn color="error" class="mr-4" @click="reset">
              Reset Form
            </v-btn>

            <v-btn color="warning" @click="resetValidation">
              Reset Validation
              <p>{{user | json}}</p>
            </v-btn>
            <p>{{user | json}}</p>
          </v-form>
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

// '{"name":"Tenali Ramakrishna", "gender":"male", "email":"tenali.ramakrishna@15ce.com", "status":"active"}'
export default {
  data: () => ({
    valid: true,
    name: '',
    nameRules: [
      v => !!v || 'Name is required',
      v => (v && v.length <= 248) || 'Name must be less than 248 characters',
    ],
    email: '',
    emailRules: [
      v => !!v || 'E-mail is required',
      v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
    ],
    gender: null,
    items: [
      'male',
      'female',
    ],
    status: null,
    items_status: ['active', 'inactive'],
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

      const data = {name: this.name, email: this.email, gender: this.gender, status: this.status,} // required on API

      const user = await this.$axios.post(`/users`, data, headers)
      this.snackbar = false
      this.reset()
      return {user}
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