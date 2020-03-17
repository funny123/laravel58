<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
class UserController extends Controller
{
   public function getUser($id)
   {
    // $user = Db::select("select * from users where id =?",[$id]);
    //where条件
    // $user  = Db::table('users')->where('id',$id)->get();
    //查询第一条
    // $user = Db::table('users')->where('id','>',$id)->first();
    // $flag = DB::table('users')->insert([
    //     'name' => str_random(10),
    //     'email' => str_random(8) . '@163.com',
    //     'password' => bcrypt('secret')
    // ]);
    $userId = DB::table('users')->insertGetId([
        'name' => str_random(10),
        'email' => str_random(8) . '@qq.com',
        'password' => bcrypt('secret')
    ]);
    dd($userId);
   }
}
