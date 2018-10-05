@extends('layouts.auth.app')
@section('content')
<div class="sign-up-form">
    <h2 class="text-white">#Social</h2>
    <div class="line-divider"></div>
    <div class="form-wrapper">
        <p class="signup-text">Login</p>
        <form method="POST" action="{{ route('login') }}">
            @csrf
            <fieldset class="form-group">
                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>
                @if ($errors->has('email'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('email') }}</strong>
                    </span>
                @endif
            </fieldset>
            <fieldset class="form-group">
                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

                @if ($errors->has('password'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('password') }}</strong>
                    </span>
                @endif
            </fieldset>
            <fieldset class="form-group">
                <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                <label class="form-check-label" for="remember">
                    {{ __('Remember Me') }}
                </label>
            </fieldset>
            <button type="submit" class="btn-secondary">Login</button>
        </form>
    </div>
    <a href="{{ route('register') }}">Create a free account</a>
    <br><br>
    <a href="{{ route('password.request') }}">Forgot Your Password?</a>
    <img class="form-shadow" src="{{ asset('images/bottom-shadow.png') }}" alt="" />
</div><!-- Sign Up Form End -->
@endsection
