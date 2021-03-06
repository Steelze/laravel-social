@extends('layouts.master.app')

@section('content')
<div class="container">
    <div class="timeline">
        @include('partials.profile.header')
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">
                <!-- Friend List
                ================================================= -->
                <div class="friend-list">
                    <div class="row">
                        @forelse(Auth::user()->pendingReceived() as $user)
                            <div class="col-md-6 col-sm-6">
                                <div class="friend-card">
                                    <img src="{{ asset('images/covers/1.jpg') }}" alt="profile-cover" class="img-responsive cover" />
                                    <div class="card-info">
                                        <img src="{{ $user->profile }}" alt="...{{ $user->name }}"  class="profile-photo-lg">
                                        <div class="friend-info">
                                            <h5><a href="{{ route('view.profile', $user->slug) }}">{{ $user->name }}</a></h5>
                                            <request-button user="{{ $user }}"></request-button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <h4 class="text-center">No Pending Requests</h4>
                        @endforelse
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</div>
@endsection
