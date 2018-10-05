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
                    <!-- Photo Album
                    ================================================= -->
                    <ul class="album-photos">
                        @foreach ($albums as $album)
                            <li>
                                <div class="img-wrapper" data-toggle="modal" data-target=".{{ $loop->index }}">
                                    <img src="{{asset(Storage::url($album)) }}" alt="photo" />
                                </div>
                                <div class="modal fade {{ $loop->index }}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <img src="{{asset(Storage::url($album)) }}" alt="photo" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
