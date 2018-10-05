<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Scout\Searchable;

class User extends Authenticatable
{
    use Notifiable;
    use Searchable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','slug','gender','profile'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function myFriend()
    {
        return $this->belongsToMany('App\User', 'friends', 'user_id', 'friend_id');
    }

    public function posts()
    {
        return $this->hasMany('App\Post');
    }
    
    public function likes()
    {
        return $this->hasMany('App\Like');
    }
    
    public function comments()
    {
        return $this->hasMany('App\Comment');
    }
    
    public function friendOf()
    {
        return $this->belongsToMany('App\User', 'friends', 'friend_id', 'user_id');
    }

    public function pendingSent()
    {
        return $this->myFriend()->wherePivot('accepted', false)->get();
    }
    
    public function pendingReceived()
    {

        return $this->friendOf()->wherePivot('accepted', false)->get();
    }

    public function hasSentRequest(User $user)
    {
        return (bool) $this->pendingSent()->where('id', $user->id)->count();
    }
    
    public function hasReceivedRequest(User $user)
    {
        return (bool) $this->pendingReceived()->where('id', $user->id)->count();
    }

    public function friends()
    {
        return collect($this->myFriend()->wherePivot('accepted', true)->get())->merge($this->friendOf()->wherePivot('accepted', true)->get());
    }

    public function isFriends(User $user)
    {
        return (bool) $this->friends()->where('id', $user->id)->count();
    }

    public function addFriend(User $user)
    {
        return $this->myFriend()->attach($user->id);
    }
    
    public function acceptFriend(User $user)
    {
        return $this->pendingReceived()->where('id', $user->id)->first()->pivot->update([
            'accepted' => 1
        ]);
    }

    public function rejectFriendRequest(User $user)
    {
        return $this->friendOf()->detach($user->id);
    }
    
    public function cancelFriendRequest(User $user)
    {
        return $this->myFriend()->detach($user->id);
    }
    
    public function deleteFriend(User $user)
    {
        $this->myFriend()->detach($user->id);
        $this->friendOf()->detach($user->id);
        return;
    }

    public function getProfileAttribute($value)
    {
        return ($value) ? asset('storage/'.$value) : asset('images/profile.png');
    }

}
