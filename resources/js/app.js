
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
import Vuetify from 'vuetify';
import moment from 'vue-moment';
import Toasted from 'vue-toasted';
import { store } from './store';

Vue.prototype.$EventBus = new Vue();
Vue.use(Toasted)
Vue.use(Vuetify);
Vue.use(moment);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('create-post', require('./components/CreatePostComponent.vue'));
Vue.component('user-chat', require('./components/messenger/ChatComponent.vue'));
Vue.component('upload-profile', require('./components/profile/ProfileComponent.vue'));
Vue.component('user-timeline', require('./components/Timeline.vue'));
Vue.component('notification-show', require('./components/notifications/ShowNotificationComponent.vue'));
Vue.component('notification-bar', require('./components/notifications/NotificationComponent.vue'));
Vue.component('show-posts', require('./components/ShowPostComponent.vue'));
Vue.component('request-button', require('./components/ButtonsComponent.vue'));

const app = new Vue({
    el: '#app',
    store
});
