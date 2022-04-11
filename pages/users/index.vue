<template>
  <div>
    <v-container class="background-dark">

      <v-col col="12">
        <h2>Users</h2>
        <v-divider></v-divider>
      </v-col>

      <v-row>

        <v-col col="12" lg="6" md="6" :key="id" v-for="{ id, name, email, gender, status } in users">
          <nuxt-link :to="`users/${id}`">
            <v-card class="card-bg">
              <v-card-title>{{ name}}</v-card-title>
              <v-card-subtitle>{{email}}</v-card-subtitle>
              <v-card-text
              >{{gender_i18n(gender)}} - {{status_i18n(status)}}
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

import global from "../../mixins/global";
export default {
  mixins: [global],
  async asyncData({ $axios }) {
    const users = await $axios.$get('users')
    return { users }
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
</style>
