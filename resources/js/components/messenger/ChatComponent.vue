<template>
    <div class="row">
        <chat-list :id="id" :friends="friends" :img="img" @chat="chat"></chat-list>
        <div class="col-md-9">
            <!--Chat Messages in Right-->
            <div class="tab-content scrollbar-wrapper wrapper scrollbar-outer">
                <div class="tab-pane active">
                    <div class="chat-body">
                        <ul class="chat-message" v-for="message in messages"  :key="message.id">
                            <li class="left" v-if="message.sender == id">
                                <img src="images/users/user-2.jpg" alt="" class="profile-photo-sm pull-left" />
                                <div class="chat-item">
                                    <div class="chat-item-header">
                                        <h5></h5>
                                        <small class="text-muted">{{ message.created_at | moment("from",true) }}</small>
                                    </div>
                                    <p>{{ message.msg }}</p>
                                </div>
                            </li>
                            <li class="right" v-else>
                                <img src="images/users/user-1.jpg" alt="" class="profile-photo-sm pull-right" />
                                <div class="chat-item">
                                    <div class="chat-item-header">
                                        <small class="text-muted">{{ message.created_at | moment("from",true) }}</small>
                                    </div>
                                    <p>{{ message.msg }}</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div><!--Chat Messages in Right End-->

            <div class="send-message" v-if="recepient">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Type your message" v-model="newMessage" @keyup.enter="sendMessage">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Send</button>
                    </span>
                </div>
            </div>
        </div>
        <!-- <div v-show="typing" class="help-block" style="font-style: italic;">
                is typing... -->
        <div class="clearfix"></div>
        <audio id="audio" src="/sounds/ping.wav" autostart="false" ></audio>
    </div>
</template>

<script>
    import ChatList from "./ChatListComponent.vue";
    export default {
        components: {
            'chat-list': ChatList
        },
        props: {
            id: { type: String, required: true },
            friends: { required: true },
            img: { type: String, required: true },
            route: { type: String, required: true },
            send_msg: { type: String, required: true },
        },
        mounted() {
            Echo.private(`Message.${this.id}`).listen('BroadcastChat', (e) => {
                this.messages.push(e.message);
                document.getElementById('audio').play();
            });
            // Echo.private(`Message.${this.recepient}`).listenForWhisper('typing', (e) => {
            //     if (e.name != '') {
            //         this.typing = true;
            //     } else {
            //         this.typing = false;
            //     }
            // });
        },
        data() {
            return {
               messages: [],
               recepient: null,
               newMessage: null,
            //    typing: null,
            }
        },
        methods: {
            chat(id) {
                this.recepient = id;
                axios.post(this.route, {id}).then((response) => {
                    this.messages = response.data;
                }).catch((error) => {
                    console.log(error);
                });
            },
            sendMessage() {
                if(!this.newMessage || !this.recepient) return;
                const msg = this.newMessage;
                this.newMessage = '';
                axios.post(this.send_msg, {id: this.recepient, msg}).then((response) => {
                    this.messages.push(response.data);
                    this.newMessage = null;
                }).catch((error) => {
                    console.log(error);
                });
            }
        },
        watch: {
            // newMessage() {
            //     Echo.private(`Message.${this.id}`)
            //     .whisper('typing', {
            //         name: this.newMessage
            //     });
            // }
        }
    }
</script>
