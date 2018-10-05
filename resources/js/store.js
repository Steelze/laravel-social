import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
    state: {
        notifications: [],
        onlineUsers: [],
        posts:[],
        timeline_posts:[],
    },
    getters:{
        get_notification_count(state){
            return state.notifications.length;
        },
        get_notifications(state){
            return state.notifications;
        },
        get_online_users(state) {
            return state.onlineUsers;
        },
        get_all_posts(state) {
            return state.posts;
        },
        get_timeline_posts(state) {
            return state.timeline_posts;
        }
    },
    mutations: {
        add_notification(state, not) {
            state.notifications.push(...not);
        },
        add_online_users(state, users){
            state.onlineUsers = users;
        },
        new_online_users(state, user){
            state.onlineUsers.push(user);
        },
        leave_online_users(state, user){
            state.onlineUsers = state.onlineUsers.filter( u => u.id != user.id);
        },
        add_posts(state, post){
            state.posts = post;
        },
        add_timeline_posts(state, post){
            state.timeline_posts = post;
        },
        older_posts(state, post){
            state.posts.push(...post);
        },
        timeline_older_posts(state, post){
            state.timeline_posts.push(...post);
        },
        new_post(state, post){
            state.posts.unshift(post);
        },
        new_timeline_post(state, post){
            state.timeline_posts.unshift(post);
        },
        delete_post(state, post){
            const index = state.posts.indexOf(post);
            state.posts.splice(index, 1);
        },
        delete_timeline_post(state, post){
            const index = state.timeline_posts.indexOf(post);
            state.timeline_posts.splice(index, 1);
        },
    }
})