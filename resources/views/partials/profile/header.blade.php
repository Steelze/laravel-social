<div class="timeline-cover">
    <!--Timeline Menu for Large Screens-->
    <div class="timeline-nav-bar hidden-sm hidden-xs">
        <div class="row">
            <div class="col-md-3">
                <upload-profile route="{{ route('upload.profile.pic') }}" profile="{{ $user }}" id="{{ Auth::user()->id }}"></upload-profile> 
            </div>
            <div class="col-md-9">
                <ul class="list-inline profile-menu">
                    <li><a href="{{ route('view.profile', $user->slug) }}" class="{{ Route::currentRouteNamed('view.profile') ? 'active' : '' }}">Timeline</a></li>
                    <li><a href="{{ route('view.album', $user->slug) }}" class="{{ Route::currentRouteNamed('view.album') ? 'active' : '' }}">Album</a></li>
                    <li><a href="{{ route('view.friends', $user->slug) }}" class="{{ Route::currentRouteNamed('view.friends') ? 'active' : '' }}">Friends</a></li>
                    @if(Auth::user()->id == $user->id)
                        <li><a href="{{ route('show.received.requests', $user->slug) }}" class="{{ Route::currentRouteNamed('show.received.requests') ? 'active' : '' }}">Pending Requests</a></li>
                    @endif
                </ul>
                <ul class="follow-me list-inline">
                    <li>{{ $user->friends()->count() }} Friend</li>
                    <li>
                        @if(Auth::user()->id !== $user->id)
                            <request-button user="{{ $user }}"></request-button>
                        @endif
                    </li>
                </ul>
            </div>
        </div>
    </div><!--Timeline Menu for Large Screens End-->
    <!--Timeline Menu for Small Screens-->
    <div class="navbar-mobile hidden-lg hidden-md">
        <upload-profile route="{{ route('upload.profile.pic') }}" profile="{{ $user }}" id="{{ Auth::user()->id }}"></upload-profile> 
        <div class="mobile-menu">
            <ul class="list-inline">
                <li><a href="{{ route('view.profile', Auth::user()->slug) }}" class="active">Timeline</a></li>
                <li><a href="{{ route('view.album', $user->slug) }}">Album</a></li>
                <li><a href="{{ route('view.friends', $user->slug) }}">Friends</a></li>
                @if(Auth::user()->id == $user->id)
                    <li><a href="{{ route('show.received.requests', $user->slug) }}">Pending Requests</a></li>
                @endif
            </ul>
            @if(Auth::user()->id !== $user->id)
                <request-button user="{{ $user }}"></request-button>
            @endif
        </div>
    </div><!--Timeline Menu for Small Screens End-->
</div>