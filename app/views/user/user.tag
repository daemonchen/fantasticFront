<user>
    <style>
        .avatar-wrapper{ padding: 10px; text-align: center; }
        .crop-wrapper{ width: 80%; margin: 0 auto; }
        .crop-wrapper img{ width: 100%; }
    </style>
    <section class="user">
        <navigation title="修改头像" parent="home"></navigation>
        <section class="avatar-wrapper">
            <h2>点击可以修改头像</h2>
            <div class="avatar-preview-wrapper">
                <n-avatar avatar="{ userAvatar }" after_file_change="{ afterFileChange }"></n-avatar>
            </div>
            <div class="crop-wrapper">
                <img src="{userAvatar}" alt="" />
            </div>
        </section>
    </section>
    <bottom-menu controller="user"></bottom-menu>
    <script>
        getCurrentData(){
            if ($('#avatar-hidden-data').length > 0) {
                this.userAvatar = $('#avatar-hidden-data').text()
                this.update()
            }
        }
        renderView(){
            this.getCurrentData()
        }
        afterFileChange(){
            this.renderView()
        }
    </script>
</user>