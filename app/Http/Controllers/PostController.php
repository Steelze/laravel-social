<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use App\Post;
use Symfony\Component\HttpFoundation\Response as ResponseCode;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\File;
use App\User;

class PostController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }


    public function store(Request $request)
    {
        $file = $request->file('image');
        if ($request->hasFile('image')) {
            $file = $request->file('image')->store(Auth::user()->slug.'/timeline', 'public');
        }
        $post = Auth::user()->posts()->create([
            'status' => $request->post,
            'image' => $file
        ]);
        return response([
            'data' => $post->load('user', 'likes', 'comments')
        ], ResponseCode::HTTP_CREATED);
    }
    
    public function index()
    {
        $posts = Post::with('user', 'comments.user', 'comments.likes', 'likes')->where(function ($q) {
            $q->where('user_id', Auth::user()->id)
                ->orWhereIn('user_id', Auth::user()->friends()->pluck('id'));
        })->orderBy('created_at', 'desc')->paginate(5);
        return Response::json(array('data' => $posts));
    }

    public function timelinePosts(User $slug)
    {
        $posts = Post::with('user', 'comments.user', 'comments.likes', 'likes')->where('user_id', $slug->id)->orderBy('created_at', 'desc')->paginate(5);
        return Response::json(array('data' => $posts));
    }
    
    public function delete(Request $request)
    {
        $post = Post::findOrFail($request->id);
        $post->likes()->where('likeable_id', $request->id)->delete();
        $post->comments()->where('commentable_id', $request->id)->delete();
        if ($post->image) {
            Storage::delete('public/'.$post->image);
        }
        Auth::user()->posts()->where('id', $request->id)->delete();
        return response([], 204);
    }
    
    public function like(Request $request)
    {
        $post = Post::findOrFail($request->id);
        $hasliked = (bool) $post->likes->where('user_id', Auth::user()->id)->count();
        if ($hasliked) {
            $like = $post->likes()->where(['user_id' => Auth::user()->id])->delete();
        } else {
            $like = $post->likes()->create(['user_id' => Auth::user()->id]);
        }
        return response([], 204);
    }
}
