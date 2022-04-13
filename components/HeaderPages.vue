<template>
  <v-row>
    <v-col col="12">
      <h2 class="text-uppercase">{{title}}</h2>
      <v-divider color="white" class="mt-4 mb-5"></v-divider>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: 'HeaderPages',
  props: {
    title: String
  },

}
</script>

<style scoped>

</style>