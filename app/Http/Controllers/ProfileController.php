<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Post;

class ProfileController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    
    public function index(User $slug)
    {
        return view('profile.index')->with([
            'user' => $slug,
        ]);
    }
    
    public function uploadProfilePhoto(Request $request)
    {
        $request->validate([
            'profile' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048'
        ],[
            'required' => 'Captain, you are sending an empty package, the elders will be super angry',
            'image' => 'Captain, your package is not an image',
            'mimes' => 'Captain, your image should be one of the following jpeg, png, jpg, gif',
            'max' => 'Exceeded package limit...2MB',
        ]);
        $path = $request->file('profile')->store(Auth::user()->slug.'/upload', 'public');
        Auth::user()->update([
            'profile' => $path,
        ]);
        return response()->json('', 200);
        // return redirect()->route('view.profile', Auth::user()->slug)->with('info', 'Avatar Updated Succesfully');
    }
    
}
