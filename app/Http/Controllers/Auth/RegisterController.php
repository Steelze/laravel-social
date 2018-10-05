<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255',
            'gender' => 'required',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ], [
            'name.required' => 'Hey Yo! What\'s your name 😒',
            'name.max' => 'Thats a pretty long name you got 😒',
            'name.string' => 'Duh! Your name can\'t be numbers 😒',
            'gender.required' => 'C\'mon seriously 🙄',
            'email.required' => 'Email Address is so so required',
            'email.email' => 'This ain\'t a valid email 😒',
            'email.unique' => 'Ooops email already in use 😳',
            'password.required' => 'You need to protect your account 💀',
            'password.min' => 'Minimum length of 6 😟',
            'password.confirmed' => 'Uhm! passwords not matching 😟',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'slug' => str_slug($data['name'].' '.str_random(2), '-'),
            'gender' => $data['gender'],
            'password' => Hash::make($data['password']),
        ]);
    }
}
