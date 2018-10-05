@extends('layouts.auth.app')
@section('content')
<div class="sign-up-form">
    <h2 class="text-white">#Social</h2>
    <div class="line-divider"></div>
    <div class="form-wrapper">
        <p class="signup-text">{{ __('Reset Password') }}</p>
        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif
        <form method="POST" action="{{ route('password.email') }}">
            @csrf
            <fieldset class="form-group">
                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" placeholder="Email" required autofocus>
                @if ($errors->has('email'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('email') }}</strong>
                    </span>
                @endif
            </fieldset>
            <button type="submit" class="btn-secondary">{{ __('Password Reset') }}</button>
        </form>
    </div>
    <img class="form-shadow" src="{{ asset('images/bottom-shadow.png') }}" alt="" />
</div>
@endsection

