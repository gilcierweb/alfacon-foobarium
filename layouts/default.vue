<template>
  <v-app dark>
    <v-navigation-drawer v-model="drawer":mini-variant="miniVariant" :clipped="clipped" fixed      app    >
      <v-list>
        <v-list-item
            v-for="(item, i) in items"
            :key="i"
            :to="item.to"
            router
            exact
        >
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title v-text="item.title"/>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar :clipped-left="clipped" fixed app>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"/>

      <v-btn icon @click.stop="miniVariant = !miniVariant">
<!--        <v-icon>mdi-{{ `chevron-${miniVariant ? 'right' : 'left'}` }}</v-icon>-->
     <svg width="21" height="22" viewBox="0 0 21 22" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M20 10V9H19H9.24421L13.1271 5.11711L13.8367 4.4075L13.1246 3.7004L11.7046 2.2904L10.9975 1.58828L10.2929 2.29289L2.29289 10.2929L1.58579 11L2.29289 11.7071L10.2929 19.7071L11 20.4142L11.7071 19.7071L13.1171 18.2971L13.8236 17.5906L13.1177 16.8835L9.24116 13H19H20V12V10Z" fill="white" stroke="white" stroke-width="2"/>
        </svg>
      </v-btn>

      <v-btn icon @click.stop="clipped = !clipped">
        <v-icon>mdi-application</v-icon>
      </v-btn>

      <v-btn icon @click.stop="fixed = !fixed">
        <v-icon>mdi-minus</v-icon>
      </v-btn>

      <v-toolbar-title v-text="title"/>
      <v-spacer/>
      <v-btn icon @click.stop="rightDrawer = !rightDrawer">
        <v-icon>mdi-menu</v-icon>
      </v-btn>
      <v-btn icon>
        <v-icon>mdi-export</v-icon>
      </v-btn>
    </v-app-bar>

    <v-main>
      <v-container>
        <Nuxt/>
      </v-container>
    </v-main>
    <v-navigation-drawer
        v-model="rightDrawer"
        :right="right"
        temporary
        fixed
    >
      <v-list>
        <v-list-item @click.native="right = !right">
          <v-list-item-action>
            <v-icon light>
              mdi-repeat
            </v-icon>
          </v-list-item-action>
          <v-list-item-title>Switch drawer (click me)</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-footer
        :absolute="!fixed"
        app
    >
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  name: 'DefaultLayout',
  data() {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      items: [
        {
          icon: 'mdi-apps',
          title: 'Welcome',
          to: '/'
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'Posts',
          to: '/posts'
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'Users',
          to: '/users'
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'Inspire',
          to: '/inspire'
        }
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'Vuetify.js'
    }
  }
}
</script>
