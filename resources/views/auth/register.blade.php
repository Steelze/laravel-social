@extends('layouts.auth.app')
@section('content')
<div class="sign-up-form">
    <h2 class="text-white">#Social</h2>
    <div class="line-divider"></div>
    <div class="form-wrapper">
        <p class="signup-text">Be cool and join today. Meet millions</p>
        <form method="POST" action="{{ route('register') }}">
            @csrf
            <fieldset class="form-group">
                <label for="name" class="col-form-label text-md-right">{{ __('Full Name') }}</label>
                <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" autofocus>
                @if ($errors->has('name'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('name') }}</strong>
                    </span>
                @endif
            </fieldset>
            <fieldset class="form-group">
                <label for="email" class="col-form-label text-md-right">{{ __('E-Mail Address') }}</label>
                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" autofocus>
                @if ($errors->has('email'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('email') }}</strong>
                    </span>
                @endif
            </fieldset>
            <fieldset class="form-group">
                <select id="gender" class="form-control{{ $errors->has('gender') ? ' is-invalid' : '' }}" name="gender" value="{{ old('gender') }}">
                    <option value="" selected>Select Gender</option>
                    <option value="male" {{ old('gender') === 'male' ? 'selected' : '' }} >Male</option>
                    <option value="female" {{ old('gender') === 'female' ? 'selected' : '' }} >Female</option>
                    <option value="bisexual" {{ old('gender') === 'bisexual' ? 'selected' : '' }} >Bisexual</option>
                    <option value="transgender" {{ old('gender') === 'transgender' ? 'selected' : '' }} >Transgender</option>
                    <option value="confused" {{ old('gender') === 'confused' ? 'selected' : '' }} >Confused</option>
                </select>
                @if ($errors->has('gender'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('gender') }}</strong>
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
            <fieldset class="form-group">
                <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                <label class="form-check-label" for="remember">
                    {{ __('Remember Me') }}
                </label>
            </fieldset>
            <button type="submit" class="btn-secondary">Join</button>
        </form>
    </div>
    <a href="{{ route('login') }}">Already have an account? Login here.</a>
    <img class="form-shadow" src="{{ asset('images/bottom-shadow.png') }}" alt="" />
</div><!-- Sign Up Form End -->
@endsection
