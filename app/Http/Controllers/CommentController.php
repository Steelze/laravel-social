<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use Illuminate\Support\Facades\Auth;
use App\Comment;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function store(Request $request)
    {
        $request->validate([
            'comment' => 'required',
            'id' => 'required'
        ]);
        $post = Post::findOrFail($request->id);
        $comment = $post->comments()->create(['user_id' => Auth::user()->id, 'comment' => $request->comment]);
        return $comment->load('user', 'likes');
    }
    
    public function destroy(Comment $id)
    {
        $id->delete();
        return response([], 204);
    }

    public function like(Request $request)
    {
        $comment = Comment::findOrFail($request->id);
        $hasliked = (bool) $comment->likes->where('user_id', Auth::user()->id)->count();
        if ($hasliked) {
            $like = $comment->likes()->where(['user_id' => Auth::user()->id])->delete();
        } else {
            $comment->likes()->create(['user_id' => Auth::user()->id]);
        }
        return response([], 204);
    }
}
