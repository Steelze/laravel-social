@extends('layouts.master.app')

@section('content')
    <div id="page-contents">
    	<div class="container-fluid" id="app">
    		<div class="row">
                @include('partials.home.lsidebar')
                <div class="chat-room col-md-9">
                    <div class="content container-fluid bootstrap snippets">
                        <user-chat id={{ Auth::user()->id }} friends="{{ Auth::user()->friends() }}" img="{{ url('/') }}" route="{{ route('messages') }}"  send_msg="{{ route('send.message') }}"></user-chat>
                    </div>
                </div>
          </div>
    	</div>
    </div>		
   
@endsection