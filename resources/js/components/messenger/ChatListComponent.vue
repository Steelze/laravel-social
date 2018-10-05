<template>
    <div class="col-md-3">
        <!-- Contact List in Left-->
        <ul class="nav nav-tabs contact-list scrollbar-wrapper scrollbar-outer">
            <li class="active" v-for="user in users" :key="user.id" @click="chat(user.id)">
                <a href="#">
                    <div class="contact">
                        <img :src="user.profile"  alt="" class="profile-photo-sm pull-left"/>
                        <div class="msg-preview">
                            <h6>{{ user.name }}</h6>
                            <presence-icon :user="user"></presence-icon>
                        </div>
                    </div>
                </a>
            </li>
        </ul><!--Contact List in Left End-->
    </div>
</template>

<script>
    import UserPresence from "./Presence.vue";
    export default {
        props: {
            id: { type: String, required: true },
            friends: { required: true },
            img: { type: String, required: true }
        },
        components: {
            'presence-icon': UserPresence
        },
        data() {
            return {
                users: JSON.parse(this.friends),
            }
        },
        methods: {
            chat(id) {
                this.$emit('chat', id);
            },
        },
        computed: {
        }
    }
</script>
