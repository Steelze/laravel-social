<!-- Newsfeed Common Side Bar Left
================================================= -->
<div class="col-md-3 static">
    <div class="profile-card">
        <img src="{{ Auth::user()->profile }}" alt="user" class="profile-photo" />
        <h5><a href="timeline.html" class="text-white">{{ Auth::user()->name }}</a></h5>
        <a href="#" class="text-white"><i class="ion ion-android-person-add"></i> {{ Auth::user()->friends()->count() }} friends</a>
    </div><!--profile card ends-->
    <ul class="nav-news-feed">
        <li><i class="icon ion-ios-paper"></i><div><a href="{{ route('view.profile', Auth::user()->slug) }}">My Newsfeed</a></div></li>
        <li><i class="icon ion-ios-people-outline"></i><div><a href="{{ route('view.friends', Auth::user()->slug) }}">Friends</a></div></li>
        <li><i class="icon ion-chatboxes"></i><div><a href="{{ route('messages') }}">Messages</a></div></li>
        <li><i class="icon ion-images"></i><div><a href="{{ route('view.album', Auth::user()->slug) }}">Images</a></div></li>
    </ul><!--news-feed links ends-->
</div>