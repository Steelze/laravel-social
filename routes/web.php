<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Auth::routes();
Route::get('/', 'HomeController@index')->name('home');
Route::post('add/friend', 'FriendController@addFriend')->name('add.friend');
Route::get('check-status/{id}', 'FriendController@checkStatus')->name('check.request.status');
Route::get('/messages/t', 'MessageController@index')->name('messages');
Route::post('/messages/t', 'MessageController@chats');
Route::post('/messages/t/send', 'MessageController@store')->name('send.message');
Route::get('/notifications', 'NotificationController@index')->name('user.notifications');
Route::get('/notifications/all', 'NotificationController@show');
Route::get('/posts', 'PostController@index')->name('all.status');
Route::get('/posts', 'PostController@index')->name('all.status');
Route::post('/posts', 'PostController@store')->name('create.status');
Route::post('/posts/comment', 'CommentController@store')->name('create.comment');
Route::post('/posts/comment/like', 'CommentController@like')->name('like.comment');
Route::delete('/posts/comment/{id}', 'CommentController@destroy')->name('delete.comment');
Route::post('/posts/delete', 'PostController@delete')->name('delete.status');
Route::post('/posts/like', 'PostController@like')->name('like.status');
Route::post('/profile', 'ProfileController@uploadProfilePhoto')->name('upload.profile.pic');
Route::group(['middleware'=>'notif'], function(){
    Route::get('/profile/view/{slug}', 'ProfileController@index')->name('view.profile');
});
Route::get('/profile/view/{slug}/timeline', 'PostController@timelinePosts')->name('view.timeline');
Route::get('/profile/view/{slug}/album', 'FriendController@viewAlbum')->name('view.album');
Route::get('/profile/view/{slug}/friends', 'FriendController@showFriends')->name('view.friends');
Route::get('/profile/view/{slug}/friends/requests', 'FriendController@showReceivedRequests')->name('show.received.requests');
Route::post('remove/friend', 'FriendController@removeFriend')->name('remove.friend');
Route::post('respond/friend/request', 'FriendController@friendRequestResponse')->name('respond.friend.request');
Route::get('search/users', 'SearchController@search')->name('search');
