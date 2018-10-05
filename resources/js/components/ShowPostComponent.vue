<template>
    <div>
        <div class="card" style="margin-top: 1em; margin-bottom: 1em;">
            <button type="button" class="btn btn-primary" @click="getPosts">Refresh Posts</button> 
        </div>
        <div class="post-content" v-for="post in posts" :key="post.id">
            <img v-if="post.image" :src="post.image" alt="post-image" class="img-responsive post-image" />
            <div class="post-container">
                <img :src="post.user.profile" alt="user" class="profile-photo-md pull-left" />
                <div class="post-detail">
                    <div class="user-info">
                        <h5><a :href="'/profile/view/'+post.user.slug" class="profile-link">@{{ post.user.name }}</a></h5>
                        <p class="text-muted">{{ post.created_at | moment("from",true) }}</p>
                        <p class="text-muted" @click="deletePost(post)" v-if="post.user.id == auth.id"><a href="javascript:void(0)" class="profile-link">Delete</a></p>
                    </div>
                    <div class="reaction">
                        <a class="btn text-green" @click.prevent="like(post)">
                            <i class="fa fa-thumbs-up" style="font-size: 24px" v-if="hasLiked(post)"></i>
                            <i class="fa fa-thumbs-o-up" style="font-size: 24px" v-else></i> 
                            {{ post.likes.length }}
                        </a>
                    </div>
                    <div class="line-divider"></div>
                    <div class="post-text" v-if="post.status">
                        <p>{{ post.status }}<i class="em em-anguished"></i> <i class="em em-anguished"></i> <i class="em em-anguished"></i></p>
                    </div>
                    <div class="line-divider"></div>
                    <comments :post="post" :user="auth"></comments>
                </div>
            </div>
        </div>
        <div class="card" style="margin-top: 1em; margin-bottom: 1em; text-align: center;">
            <button type="button" class="btn btn-primary" @click="scroll" :disabled="!nextUrl">Older Posts</button> 
        </div>
    </div>
</template>

<script>
    import Comments from './CommentComponent.vue';
    export default {
        props: {
            user: { required: true },
            route: { type: String, required: true },
            delete_route: { type: String, required: true },
        },
        components: {
            'comments': Comments
        },
        created() {
        },
        mounted() {
            this.scroll();
            this.getPosts();
        },
        data() {
            return {
                nextUrl: '',
                auth: JSON.parse(this.user),
            }
        },
        methods: {
            getPosts() {
                 axios.get(this.route).then((response) => {
                    this.$store.commit('add_posts', response.data.data.data)
                    this.nextUrl = response.data.data.next_page_url;
                }).catch((error) => {
                    console.log(error);
                })
            },
            scroll() {
                if (this.nextUrl) {
                    const url = this.nextUrl;
                    this.nextUrl = null;
                    this.getOlderPosts(url);
                }
            },
            deletePost(post) {
                this.$store.commit('delete_post', post)
                axios.post(this.delete_route, {id: post.id}).then((response) => {
                    this.$toasted.show('Post Deleted Successfully', { 
                        theme: "primary", 
                        position: "top-center", 
                        duration : 2000,
                        type: "info"
                    });
                    console.log(response.data);
                }).catch((error) => {
                    this.$toasted.show(error.response.data.errors.post[0], { 
                        theme: "primary", 
                        position: "top-center", 
                        duration : 2000,
                        type: "error"
                    });
                })
            },
            like(post) {
                if(this.hasLiked(post)) {
                    post.likes = post.likes.filter( u => u.user_id != this.auth.id );
                }else {
                    post.likes.push({
                        'user_id': this.auth.id
                    })
                }
                axios.post('/posts/like', {id: post.id}).then((response) => {
                    console.log(response.data);
                }).catch((error) => {
                    this.error = error.response.data.errors.post[0];                    
                })
            },
            hasLiked(post) {
                if (post.likes.length > 0) return post.likes.find(u => u.user_id == this.auth.id);
            },
            getOlderPosts(url) {
                axios.get(url).then((response) => {
                    this.$store.commit('older_posts', response.data.data.data)
                    this.nextUrl = response.data.data.next_page_url;
                }).catch((error) => {
                    console.log(error);
                })
            }
        },
        computed: {
            posts() {
                if (this.timeline) {
                    return this.$store.getters.get_all_posts.filter( post => post.user_id == this.auth.id);
                }
                return this.$store.getters.get_all_posts;
            }
        }
    }
</script>

<style scoped>
    .wrapper {
        margin-top: 30px;
        padding-left: 30px;
        background: #fff;
    }
    .wrapper-cell {
        display: flex;
        margin-bottom: 30px;
    }
    @-webkit-keyframes placeHolderShimmer {
        0% {
            background-position: -468px 0;
        }
        100% {
            background-position: 468px 0;
        }
    }
    @keyframes placeHolderShimmer {
        0% {
            background-position: -468px 0;
        }
        100% {
            background-position: 468px 0;
        }
    }
    .animated-background, .image, .text-line {
        -webkit-animation-duration: 1.25s;
        animation-duration: 1.25s;
        -webkit-animation-fill-mode: forwards;
        animation-fill-mode: forwards;
        -webkit-animation-iteration-count: infinite;
        animation-iteration-count: infinite;
        -webkit-animation-name: placeHolderShimmer;
        animation-name: placeHolderShimmer;
        -webkit-animation-timing-function: linear;
        animation-timing-function: linear;
        background: #F6F6F6;
        background: linear-gradient(to right, #F6F6F6 8%, #F0F0F0 18%, #F6F6F6 33%);
        background-size: 800px 104px;
        height: 96px;
        position: relative;
    }
    .image {
        height: 60px;
        width: 60px;
    }
    .text {
        margin-left: 20px;
    }
    .text-line {
        height: 10px;
        width: 500px;
        margin: 4px 0;
    }
    .text-info{
        cursor: pointer;
    }
    /* .post-image{
        width: auto; 
        max-width: 50%;
    } */
</style>
