<template>
    <div>
        <div class="post-container">
            <div v-for="comment in post.comments" :key="comment.id">
                <img :src="comment.user.profile" alt="user" class="profile-photo-md pull-left" />
                <div class="post-detail">
                    <div class="user-info">
                        <h5><a :href="'/profile/view/'+comment.user.slug" class="profile-link">@{{ comment.user.name }}</a></h5>
                        <p class="text-muted">{{ comment.created_at | moment("from",true) }}</p>
                        <p class="text-muted" @click="deleteComment(post, comment)" v-if="comment.user.id == user.id"><a href="#" class="profile-link">Delete</a></p>
                    </div>
                    <div class="reaction">
                        <a class="btn text-green" @click.prevent="likeComment(comment)">
                            <i class="fa fa-thumbs-up" style="font-size: 25px" v-if="hasLiked(comment)"></i>
                            <i class="fa fa-thumbs-o-up" style="font-size: 24px" v-else></i>
                            {{ comment.likes.length }}
                        </a>
                    </div>
                    <div class="line-divider"></div>
                    <div class="post-text">
                        <p>{{ comment.comment }}<i class="em em-anguished"></i> <i class="em em-anguished"></i> <i class="em em-anguished"></i></p>
                    </div>
                </div>
            </div>
            <div class="post-comment">
                <img :src="user.profile ? '/storage/'+user.profile : '/images/profile.png'" alt="" class="profile-photo-sm" />
                <input type="text" class="form-control" placeholder="Post a comment" v-model="comment" @keyup.enter="postComment(post)">
            </div>
        </div>
    </div>
</template>


<script>
export default {
    props: {
        user: { required: true },
        post: {required: true },
    },
    data() {
        return {
            comment: null,
        }
    },
    methods: {
        postComment(post) {
            if(!this.comment) return;
            const id = post.id
            const comment = this.comment;
            this.comment = null;
            axios.post('/posts/comment', {id, comment}).then((response) => {
                post.comments.push(response.data)
            }).catch((error) => {
                console.log(error);
            })
        },
        deleteComment(post, comment) {
            const index = post.comments.indexOf(comment);
            post.comments.splice(index, 1);
            axios.delete(`/posts/comment/${comment.id}`).then((response) => {
                console.log(response.data);
            }).catch((error) => {
                console.log(error);
            })
        },
        hasLiked(comment) {
            if (comment.likes.length > 0) return comment.likes.find(u => u.user_id == this.user.id);
        },
        likeComment(comment) {
            if(this.hasLiked(comment)) {
                comment.likes = comment.likes.filter( u => u.user_id != this.user.id );
            }else {
                comment.likes.push({
                    'user_id': this.user.id
                })
            }
            axios.post('/posts/comment/like', {id: comment.id}).then((response) => {
                console.log(response.data);
            }).catch((error) => {
                console.log(error);                 
            })
        },
    }
}
</script>

<style scoped>
    .comment {
        border-top: 2px solid aliceblue;
        margin-left: 10%;
    }
    .comment img{
        border-radius: 50%;
    }
    .comment p{
        border-radius: 10px;
        background: ghostwhite;
        padding: 5px 10px;
    }
    .comment input{
        background: #F2F3F5;
        border-radius: 50px;
    }
    .text-info{
        cursor: pointer;
    }
</style>
