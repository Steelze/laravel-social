<template>
    <!-- Post Create Box
    ================================================= -->
    <div class="create-post">
        <div class="row">
            <div class="col-md-7 col-sm-7">
                <div class="form-group">
                    <img :src="auth.profile ? '/storage/'+auth.profile :'/images/profile.png'" alt="" class="profile-photo-md" />
                    <textarea name="texts" id="exampleTextarea" cols="50" rows="1" class="form-control" placeholder="Write what you wish" v-model="post" ></textarea>
                </div>
                <div class="mt-2 mb-2 profile-pic" v-if="image">
                    <img :src="image" alt="..." width="200">
                    <div class="edit"><i class="fa fa-times fa-lg text-danger" @click="image = ''; file = ''"></i></div>
                </div>
            </div>
            <div class="col-md-5 col-sm-5">
                <div class="tools">
                    <ul class="publishing-tools list-inline">
                        <li>
                            <a href="#">
                                <label for="image">
                                    <i class="ion-images"></i>
                                    <input type="file" @change="changeImage" id="image" style="display:none;">
                                </label>
                            </a>
                        </li>
                    </ul>
                    <button type="button" :disabled="(!post && !image)" class="btn btn-primary pull-right" @click.prevent='submit'>Publish</button>
                </div>
            </div>
        </div>
    </div><!-- Post Create Box End-->
</template>

<script>
    export default {
        props: {
            user: { required: true },
            route: { type: String, required: true },
            timeline: { required: true}
        },
        mounted() {
            
        },
        data() {
            return {
                post: '',
                image: '',
                file: '',
                auth: JSON.parse(this.user),
            }
        },
        methods: {
            submit() {
                if (!this.post && !this.file) return;
                const post = this.post;
                const image = this.file;
                this.post = '';
                this.image = '';
                this.file = '';
                let formData = new FormData();
                formData.append('image', image);
                formData.append('post', post);
                axios.post(this.route, formData).then((response) => {
                    this.$toasted.show('Post Added Successfully', { 
                        theme: "primary", 
                        position: "top-center", 
                        duration : 2000,
                        type: "success"
                    });
                    if (this.timeline === "true") {
                        this.$store.commit('new_timeline_post', response.data.data);
                    } else {
                        this.$store.commit('new_post', response.data.data);
                    }
                }).catch((error) => {
                    this.$toasted.show(error.response.data.errors.post[0], { 
                        theme: "primary", 
                        position: "top-center", 
                        duration : 2000,
                        type: "error"
                    });
                })
            },
            changeImage(e) {
                const image = e.target.files[0];
                this.file = image;
                if (!image) {
                    this.image = '';
                    this.file = '';
                    return;
                }
                let reader = new FileReader();
                reader.readAsDataURL(image);
                reader.onload = e => {
                    this.image = e.target.result;
                };
            },
        }
    }
</script>

<style scoped>
    .fa-camera{
        font-size: 24px;
        cursor: pointer;
    }
    .profile-pic {
	    position: relative;
	    display: inline-block;
    }
    .edit {
        padding-top: 7px;	
        padding-right: 7px;
        position: absolute;
        right: 0;
        top: 0;
    }
    .ion-images, .edit i {
        cursor: pointer;
    }
</style>
