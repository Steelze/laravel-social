<template>
    <div>
        <button v-if="loading" class="btn btn-primary btn-sm float-right" disabled><i class="fa fa-circle-o-notch"></i></button>
        <button v-if="status==0 && !loading" class="btn btn-primary btn-sm float-right" @click="addfriend">Add</button>
        <button v-if="status==='pending' && !loading" class="btn btn-primary btn-sm float-right" @click="acceptFriendRequest">Accept</button>
        <button v-if="status==='waiting' && !loading" class="btn btn-primary btn-sm float-right" @click="cancelSentRequest">Cancel</button>
        <button v-if="status==='pending' && !loading" class="btn btn-primary btn-sm float-right" @click="declineReceivedRequest">Decline</button>
        <button v-if="status==='friends'" class="btn btn-primary btn-sm float-right" @click="unfriend">Unfriend</button>
    </div>
</template>

<script>
export default {
    props: {
        user: { required: true },
    },
    created() {
        this.loading = true;
        axios.get(`/check-status/${this.current_user.id}`).then((response) => {
            this.status = response.data.status
            this.loading = false;
        }).catch((error) => {
        })
    },
    data() {
        return {
           status: '',
           loading: null,
           current_user: JSON.parse(this.user)
        }
    },

    methods: {
        addfriend() {
            this.$toasted.show('Please Wait', { 
                theme: "primary", 
                position: "top-center", 
                duration : 2000,
                type: "info"
            });
            axios.post('/add/friend', {id: this.current_user.id}).then((response) => {
                this.status = 'waiting';
                this.$toasted.show('Request Sent', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "success"
                });
            }).catch((error) => {
                this.$toasted.show('Oops, an error occured.....', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "error"
                });
            })
        },
        cancelSentRequest() {
            this.$toasted.show('Please Wait', { 
                theme: "primary", 
                position: "top-center", 
                duration : 2000,
                type: "info"
            });
            axios.post('/respond/friend/request', {id: this.current_user.id, type: 'cancel'}).then((response) => {
                this.status = 0;
                this.$toasted.show('Request Cancelled', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "success"
                });
            }).catch((error) => {
                this.$toasted.show('Oops, an error occured.....', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "error"
                });
            })
        },
        declineReceivedRequest() {
            this.$toasted.show('Please Wait', { 
                theme: "primary", 
                position: "top-center", 
                duration : 2000,
                type: "info"
            });
            axios.post('/respond/friend/request', {id: this.current_user.id, type: 'decline'}).then((response) => {
                this.status = 0;
                this.$toasted.show('Request Declined', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "success"
                });
            }).catch((error) => {
                this.$toasted.show('Oops, an error occured.....', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "error"
                });
            })
        },
        acceptFriendRequest() {
            this.$toasted.show('Please Wait', { 
                theme: "primary", 
                position: "top-center", 
                duration : 2000,
                type: "info"
            });
            axios.post('/respond/friend/request', {id: this.current_user.id, type: 'confirm'}).then((response) => {
                this.status = 'friends';
                this.$toasted.show('Request Accepted', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "success"
                });
            }).catch((error) => {
                this.$toasted.show('Oops, an error occured.....', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "error"
                });
            })
        },
        unfriend() {
            this.$toasted.show('Please Wait', { 
                theme: "primary", 
                position: "top-center", 
                duration : 2000,
                type: "info"
            });
            axios.post('/remove/friend', {id: this.current_user.id}).then((response) => {
                this.status = '';
                this.$toasted.show('Friend Deleted', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "success"
                });
            }).catch((error) => {
                this.$toasted.show('Oops, an error occured.....', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "error"
                });
            })
        }
    }
}
</script>
