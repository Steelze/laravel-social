@extends('layouts.auth.app')
@section('content')
<div class="sign-up-form">
    <h2 class="text-white">#Social</h2>
    <div class="line-divider"></div>
    <div class="form-wrapper">
        <p class="signup-text">{{ __('Reset Password') }}</p>
        <form method="POST" action="{{ route('password.update') }}">
            @csrf
            <input type="hidden" name="token" value="{{ $token }}">
            <fieldset class="form-group">
                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" placeholder="Email" required autofocus>
                @if ($errors->has('email'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('email') }}</strong>
                    </span>
                @endif
            </fieldset>
            <fieldset class="form-group">
                <label for="password" class="col-form-label text-md-right">{{ __('Password') }}</label>
                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password">

                @if ($errors->has('password'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('password') }}</strong>
                    </span>
                @endif
            </fieldset>
            <fieldset class="form-group">
                <label for="password-confirm" class="col-form-label text-md-right">{{ __('Confirm Password') }}</label>
                <input id="password-confirm" type="password" class="form-control" name="password_confirmation">
            </fieldset>
            <button type="submit" class="btn-secondary">{{ __('Reset Password') }}</button>
        </form>
    </div>
    <img class="form-shadow" src="{{ asset('images/bottom-shadow.png') }}" alt="" />
</div>
@endsection
