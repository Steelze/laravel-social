@extends('layouts.master.app')

@section('content')
<div class="container">
    <div class="timeline">
        <!-- Timeline
        ================================================= -->
        @include('partials.profile.header')
        <div id="page-contents">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <!-- Friend List
                    ================================================= -->
                    <div class="friend-list">
                        <div class="row">
                            @foreach($friends as $user)
                                <div class="col-md-6 col-sm-6">
                                    <div class="friend-card">
                                        <img src="{{ asset('images/covers/1.jpg') }}" alt="profile-cover" class="img-responsive cover" />
                                        <div class="card-info">
                                            <img src="{{ $user->profile }}" alt="...{{ $user->name }}" class="profile-photo-lg" />
                                            <div class="friend-info">
                                                <h5><a href="{{ route('view.profile', $user->slug) }}" class="profile-link">{{ $user->name }}</a></h5>
                                                <p>{{ $user->friends()->count() }} {{ str_plural('friend', $user->friends()->count()) }}</p>
                                                <div class="pull-right">
                                                    <request-button user="{{ $user }}"></request-button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
