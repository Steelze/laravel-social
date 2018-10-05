<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        Auth::user()->unreadNotifications->markAsRead();
        return view('notifications');
    }

    public function show()
    {
        return Auth::user()->unreadNotifications;
    }
}
