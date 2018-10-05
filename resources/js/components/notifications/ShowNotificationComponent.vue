<template>
    <audio id="audio" src="/sounds/ping.wav" autostart="false" ></audio>
</template>

<script>
export default {
    props: {
        id: { required: true },
    },
    mounted() {
        Echo.private(`App.User.${this.id}`).notification((notification) => {
            this.$toasted.show(notification.message, { 
                theme: "primary", 
                position: "bottom-left", 
                duration : 8000,
                type: "info"
            });
            document.getElementById('audio').play();
            if (notification.type !== 'App\Notifications\MessageNotification') {
                this.$store.commit('add_notification', [notification]);
            }            
        });
    }
}
</script>
