<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Post;
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
        // $userId = DB::table('users')->insertGetId([
        //     'name' => str_random(10),
        //     'email' => str_random(8) . '@qq.com',
        //     'password' => bcrypt('secret')
        // ]);
        // DB::table('users')->insert([
        //     ['name' => str_random(10), 'email' => str_random(8) . '@qq.com', 'password' => bcrypt('123')],
        //     ['name' => str_random(10), 'email' => str_random(8) . '@qq.com', 'password' => bcrypt('456')],
        //     ['name' => str_random(10), 'email' => str_random(8) . '@qq.com', 'password' => bcrypt('789')],
        // ]);
        // $email  = Db::table('users')->where('id',$id)->value('email');
        // echo $email;
        //pluck用法
        // $result = Db::table('users')->get()->pluck('email','id');
        //chunk
        // $names = [];
        // DB::table('users')->orderBy('id')->chunk(5, function ($users) use (&$names) {
        //     foreach ($users as $user) {
        //         $names[] = $user->name;
        //     }
        // });
        // dd($names);
        // $posts = DB::table('posts')
        //     ->rightJoin('users', 'users.id', '=', 'posts.user_id')
        //     ->select('posts.*', 'users.name', 'users.email')
        //     ->get();
        $posts = Post::all();
        dd($posts);
    }
}
