<?php

namespace App\Http\Controllers;

use App\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Events\BroadcastChat;
use App\Notifications\MessageNotification;
use App\User;

class MessageController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('messages.index');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $message = Message::create([
            'sender' => Auth::user()->id,
            'recepient' => $request->id,
            'msg' => $request->msg,
        ]);
        $user = User::find($request->id);
        $user->notify(new MessageNotification(Auth::user(), $request->msg));
        event(new BroadcastChat($message));

        return $message;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Message  $message
     * @return \Illuminate\Http\Response
     */
    public function chats(Request $request)
    {
        $id = $request->id;
        $messages = Message::where(function ($q) use ($id) {
            $q->where('sender', Auth::user()->id)->where('recepient', $id)
                ->orWhere('sender', $id)->where('recepient', Auth::user()->id);
        })->get();

        return $messages;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Message  $message
     * @return \Illuminate\Http\Response
     */
    public function destroy(Message $message)
    {
        //
    }
}
