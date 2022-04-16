<template>
  <v-app dark>
    <v-navigation-drawer v-model="drawer" :mini-variant="miniVariant" :clipped="clipped" fixed app class="sidebar-bg v-sidebar-menu">
      <v-list>
        <nuxt-link to="/">
          <v-list-item class="mt-2 mb-6">
            <v-img src="/logo.png">
            </v-img>
          </v-list-item>
        </nuxt-link>
        <v-divider color="white"></v-divider>

        <v-list-item v-for="(item, i) in items" :key="i" :to="item.to" router exact>
          <v-list-item-action>
            <span class="menu-rectangle"></span>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title v-text="item.title"/>
          </v-list-item-content>
        </v-list-item>

      </v-list>

      <template v-slot:append>

        <div class="pa-2">
          <nuxt-link to="/">
            <v-list-item class="mt-2 mb-6">
              <span class="menu-rectangle pa-0"></span>
              <v-list-item-title>My Posts</v-list-item-title>
            </v-list-item>
          </nuxt-link>
          <nuxt-link to="/">
            <v-list-item class="mt-2 mb-6">
              <v-list-item-title>My Posts</v-list-item-title>
            </v-list-item>
          </nuxt-link>
          <v-btn block>
            Logout
          </v-btn>
        </div>
      </template>
    </v-navigation-drawer>

    <v-app-bar :clipped-left="clipped" fixed app class="header-bg">
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"/>

      <v-btn icon @click.stop="miniVariant = !miniVariant">
        <v-icon>mdi-{{ `chevron-${miniVariant ? 'right' : 'left'}` }}</v-icon>
      </v-btn>

      <v-btn icon @click.stop="$router.go(-1)">
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

<!--      <v-toolbar-side-icon>-->
        <nuxt-link to="/">
          <v-img src="/logo.svg" height="30px" width="60%" alt="title"></v-img>
        </nuxt-link>
<!--      </v-toolbar-side-icon>-->

      <v-spacer/>

      <v-app-bar-nav-icon @click.stop="drawer = !drawer"/>

    </v-app-bar>

    <v-main>
      <v-container>
        <v-slide-x-transition mode="out-in">
        <Nuxt/>
        </v-slide-x-transition>
      </v-container>
    </v-main>

    <v-footer :absolute="!fixed" app>
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>

  </v-app>
</template>

<script>
import styles from '../assets/styles.scss'

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
          icon: 'mdi-post-outline',
          title: 'Posts',
          to: '/posts'
        },
        {
          icon: 'mdi-account-multiple-plus-outline',
          title: 'Users',
          to: '/users'
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'Inspire',
          to: '/inspire'
        },
        {
          icon: 'mdi-note-edit-outline',
          title: 'My Posts',
          to: '/posts/show'
        },
        {
          icon: 'mdi-comment-processing-outline',
          title: 'My Comments',
          to: '/posts/comments'
        }
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'FOOBARIUM'
    }
  },

}
</script>
