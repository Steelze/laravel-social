<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Notifications\Notification;

class MarkNotificationAsRead
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ($request->has('read') && Auth::check()) {
            $notification = Auth::user()->unreadNotifications->where('id', $request->read)->first();
            if ($notification) {
                $notification->markAsRead();
            }
        }
        return $next($request);
    }
}
