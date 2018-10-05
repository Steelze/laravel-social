@extends('layouts.master.app')
@section('link-css')
<style>
    .card-header{
        background: #231F20;
        color: white;
        padding: 2%;
        margin-bottom: 2%;
        border-radius: 12px;
        text-align: center;
    }
</style>
@endsection
@section('content')
<div id="page-contents">
    	<div class="container-fluid">
    		<div class="row">
                @include('partials.home.lsidebar')
                <div class="chat-room col-md-9">
                    <div class="card">
                        <div class="card-header font-weight-bold">Your Notifications</div>
                        <div class="card-body">
                            <div class="list-group">
                                @foreach(Auth::user()->notifications as $notification)
                                    <a href="javascript:void(0)" class="list-group-item list-group-item-action flex-column align-items-start" style="background: #f6f6f7;">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1"></h5>
                                    </div>
                                    <p class="mb-1">{{ $notification->data['message'] }}</p>
                                    <small>{{ $notification->created_at->diffForHumans() }}</small>
                                    </a>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
    		</div>
        </div>
    </div>
</div>
@endsection
