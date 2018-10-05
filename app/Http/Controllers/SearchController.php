<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        if ($request->data == '') {
            $users = [];
        }else {
            $users = User::search($request->data)->get();
        }
        return view('search.index', compact('users'));
    }
}
