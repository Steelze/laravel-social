<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $guarded = [];
    
    public function user()
    {
        return $this->belongsTo('App\User');
    }
    
    public function likes()
    {
        return $this->MorphMany('App\Like', 'likeable');
    }
    
    public function comments()
    {
        return $this->MorphMany('App\Comment', 'commentable');
    }

    public function getImageAttribute($value)
    {
        return ($value) ? asset('storage/'.$value) : null;
    }
}
