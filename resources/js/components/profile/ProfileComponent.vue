<template>
    <div class="profile-info">
        <img :src="(!image) ? user.profile : image" class="img-responsive profile-photo" id="avatar"/>
        <form v-if="user.id == id">
            <label for="profile">
                <i class="ion-images" style="font-size: 25px; cursor:pointer;"></i>
            </label>
            <input type="file" name="profile" id="profile" style="display: none;" @change="changeImage">
            <button type="button" @click.prevent="upload" class="btn btn-secondary btn-sm" :disabled="!file">Upload</button>
        </form>
        <h4>{{ user.name }}</h4>
    </div>
</template>

<script>
export default {
    props: {
        route: {type: String, required: true},
        profile: {required: true},
        id: {type: String, required: true}
    },
    data() {
        return {
            post: '',
            file: '',
            image: '',
            user: JSON.parse(this.profile)
        }
    },
    methods: {
        upload() {
            if (!this.file) return;
            const image = this.file;
            let formData = new FormData();
            formData.append('profile', image);
            axios.post(this.route, formData).then((response) => {
                this.$toasted.show('Profile Updated Successfully', { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 2000,
                    type: "success"
                });
            }).catch((error) => {
                this.$toasted.show(error.response.data.errors.profile[0], { 
                    theme: "primary", 
                    position: "top-center", 
                    duration : 3000,
                    type: "error"
                });
            })
        },
        changeImage(e) {
            const image = e.target.files[0];
            this.file = image;
            if (!image) {
                this.file = '';
                this.image = '';
                return;
            }
            let reader = new FileReader();
            reader.readAsDataURL(image);
            reader.onload = e => {
                this.image = e.target.result;
            };
        }
    }
}
</script>
