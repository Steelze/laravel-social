<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Notifications\FriendRequestAccepted;
use App\Notifications\NewFriendRequest;
use Illuminate\Support\Facades\Storage;

class FriendController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function checkStatus($id)
    {
        if (Auth::user()->id == $id) {
            return ['status' => 'me'];
        }
        $user = User::findOrFail($id);
        if (Auth::user()->isFriends($user)) {
            return ['status' => 'friends'];
        }
        if (Auth::user()->hasSentRequest($user)) {
            return ['status' => 'waiting'];
        }
        if (Auth::user()->hasReceivedRequest($user)) {
            return ['status' => 'pending'];
        }

        return ['status' => '0'];
    }

    public function addFriend(Request $request)
    {
        $request->validate([
            'id' => 'required|integer'
        ]);
        $user = User::findOrFail($request->id);
        if(Auth::user()->hasSentRequest($user) || Auth::user()->hasReceivedRequest($user) || Auth::user()->isFriends($user)) {
            return response()->json('error', 400);
        }
        Auth::user()->addFriend($user);
        $user->notify(new NewFriendRequest(Auth::user()));
        return response()->json('', 200);
    }

    public function friendRequestResponse(Request $request)
    {
        $user = User::findOrFail($request->id);
        if ($request->type === 'confirm') {
            Auth::user()->acceptFriend($user);
            $user->notify(new FriendRequestAccepted(Auth::user()));
            return response()->json('', 200);
        } elseif($request->type === 'cancel') {
            Auth::user()->cancelFriendRequest($user);
            return response()->json('', 200);
        } elseif($request->type === 'decline') {
            Auth::user()->rejectFriendRequest($user);
            return response()->json('', 200);
        }else{
            return response()->json('Error', 400);
        }
    }

    public function showFriends(User $slug)
    {
        $friends = $slug->friends();
        $user = $slug;
        return view('profile.friends', compact('friends', 'user'));
    }
    
    public function showReceivedRequests(User $slug)
    {
        if (Auth::user()->id != $slug->id) {
            return redirect('/');
        }
        $user = $slug;
        return view('profile.pending-request', compact('user'));
    }

    public function removeFriend(Request $request)
    {
        $user = User::findOrFail($request->id);
        Auth::user()->deleteFriend($user);
        return response()->json('', 200);
    }

    public function viewAlbum(User $slug)
    {
        $uploads = Storage::files('public/'.$slug->slug.'/upload');
        $timeline = Storage::files('public/'.$slug->slug.'/timeline');
        $albums = array_merge($uploads, $timeline);
        return view('profile.album')->with([
            'user' => $slug,
            'albums' => $albums
        ]);

    }
}
