<template>
    <div>
        <div class="chat-offline" v-if="!check"></div>
        <div class="chat-online" v-else></div>
    </div>
</template>

<script>
    export default {
        props: {
            user: { required: true },
        },
        computed:{
            check() {
                if (this.$store.getters.get_online_users.length && this.user) {
                    return this.$store.getters.get_online_users.find( u => u.id == this.user.id);
                }
            }
        }
    }
</script>