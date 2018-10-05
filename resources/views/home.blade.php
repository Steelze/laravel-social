@extends('layouts.master.app')

@section('content')
    <div class="container">
        <div class="row">
            @include('partials.home.lsidebar')
            <div class="col-md-7">
                <create-post route="{{ route('create.status') }}" user="{{ Auth::user() }}" timeline="false"></create-post>
                <show-posts route="{{ route('all.status') }}" user="{{ Auth::user() }}" delete_route="{{ route('delete.status') }}"></show-posts>
                <!-- Post Content
                ================================================= -->
                
            </div>
            <!-- Newsfeed Common Side Bar Right
            ================================================= -->
            <div class="col-md-2 static">
                <div class="suggestions" id="sticky-sidebar">
                    <h4 class="grey">Who to Follow</h4>
                    @foreach($users as $user)
                        @if(!Auth::user()->isFriends($user) && !Auth::user()->hasReceivedRequest($user))
                            <div class="follow-user">
                                <img src="{{ $user->profile }}" alt="...{{ $user->name }}" class="profile-photo-sm pull-left" />
                                <div>
                                    <h5>
                                        <a href="{{ route('view.profile', $user->slug) }}">{{ $user->name }}</a>
                                    </h5>
                                    <request-button user="{{ $user }}"></request-button>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
