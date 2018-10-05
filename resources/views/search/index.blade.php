@extends('layouts.master.app')

@section('content')
<div class="container">
    <div class="timeline">
        <div id="page-contents">
            <div class="row">
                @include('partials.home.lsidebar')
                <div class="col-md-9">
                    <!-- Friend List
                    ================================================= -->
                    <div class="friend-list">
                        <div class="row">
                            @forelse($users as $user)
                                <div class="col-md-6 col-sm-6">
                                    <div class="friend-card">
                                        <img src="{{ asset('images/covers/1.jpg') }}" alt="profile-cover" class="img-responsive cover" />
                                        <div class="card-info">
                                            <img src="{{ $user->profile }}" alt="...{{ $user->name }}" class="profile-photo-lg" />
                                            <div class="friend-info">
                                                <h5><a href="{{ route('view.profile', $user->slug) }}" class="profile-link">{{ $user->name }}</a></h5>
                                                <p>{{ $user->friends()->count() }} {{ str_plural('friend', $user->friends()->count()) }}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @empty
                                <h4 class="text-center">No record Found</h4>
                            @endforelse
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
