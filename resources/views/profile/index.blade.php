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
                    @if (Auth::user()->id === $user->id)
                        <create-post route="{{ route('create.status') }}" user="{{ Auth::user() }}" timeline="true"></create-post>
                    @endif
                    <!-- Post Content
                    ================================================= -->
                    <user-timeline route="{{ route('view.timeline', $user->slug) }}" user="{{ Auth::user() }}" delete_route="{{ route('delete.status') }}"></user-timeline>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
