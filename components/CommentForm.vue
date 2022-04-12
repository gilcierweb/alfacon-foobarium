<template>

    <v-col col="12" sm="12">
    <h1>Make a comment</h1>
    <v-form v-model="valid">

      <v-col cols="12">
        <v-container fluid>
          <v-textarea name="input-7-1"
              filled label="Label" auto-grow
              value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."
          ></v-textarea>
        </v-container>
      </v-col>

      <v-col cols="12">
        <v-btn :disabled="!valid" color="success" class="mr-4" @click="validate">
          Validate
        </v-btn>
      </v-col>

    </v-form>
    </v-col>

</template>

<script>
export default {
  data: () => ({
    valid: true,
    name: '',
    nameRules: [
      v => !!v || 'Name is required',
      v => (v && v.length <= 10) || 'Name must be less than 10 characters',
    ],

  }),

  methods: {
    validate() {
      this.$refs.form.validate()
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