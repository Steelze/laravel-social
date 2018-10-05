<template>
    <li class="dropdown">
        <a href="/notifications"><i class="fa fa-globe"></i>
        <span> {{  (notification_count ? notification_count : '')}} </span> </a>
    </li>
</template>

<script>
export default {
    mounted() {
        this.get_nots();
        Echo.join('online')
            .here((users) => {                    
               this.$store.commit('add_online_users', users); 
            })
            .joining((user) => {
               this.$store.commit('new_online_users', user); 
            })
            .leaving((user) => {
               this.$store.commit('leave_online_users', user); 
            });   
    },
    methods: {
        get_nots() {
            axios.get('/notifications/all').then( response => {
                this.$store.commit('add_notification', response.data);
            })
        }
    },
    computed: {
        notification_count() {
            return this.$store.getters.get_notification_count;
        },
    }
}
</script>
