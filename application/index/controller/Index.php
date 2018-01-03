<?php

namespace app\index\controller;

use app\index\model\User as UserModel;
use think\Config;
use think\Validate;

class Index extends Base{
    public function _initialize(){
        parent::_initialize();
	}

    public function _empty(){
        echo "功能开发中!";
    }

    public function index(){
        return $this->view->fetch();
    }

    public function login(){
        $url = $this->request->get('url', 'index/index');
        if (userIsLogin())
        {
            $this->error(__("You've logged in, do not login again"), $url);
        }
        if ($this->request->isPost()){
            $username = $this->request->post('username');
            $password = $this->request->post('password');
            $keeplogin = $this->request->post('keeplogin');
            $token = $this->request->post('__token__');
            $rule = [
                'username'  => 'require|length:3,30',
                'password'  => 'require|length:3,30',
                '__token__' => 'token',
            ];
            $data = [
                'username'  => $username,
                'password'  => $password,
                '__token__' => $token,
            ];
            if (Config::get('fastadmin.login_captcha')){
                $rule['captcha'] = 'require|captcha';
                $data['captcha'] = $this->request->post('captcha');
            }
            $validate = new Validate($rule, [], ['username' => __('Username'), 'password' => __('Password'), 'captcha' => __('Captcha')]);

            $result = $validate->check($data);

            if (!$result){
                $this->error($validate->getError(), $url, ['token' => $this->request->token()]);
            }
            $result = $this->userLogin($username, $password, $keeplogin ? 86400 : 0);

            if ($result['status'] == 1){
                $user_info = $result["data"];
                $this->success(__('Login successful'), $url, ['url' => $url, 'id' => $user_info["id"], 'username' => $username, 'avatar' => $user_info["avatar"]]);
            }else{
                $this->error(__('Username or password is incorrect'), $url, ['token' => $this->request->token()]);
            }
        }
        $background = cdnurl(Config::get('fastadmin.login_background'));
        $this->view->assign('background', $background);
        return $this->view->fetch();
    }

    public function account(){
        return $this->view->fetch();
    }

    public function logout(){
        session('user_info',null);
        $this->success(__('Logout successful'), 'index/login');
    }

    public function news(){
        $newslist = [];
        return jsonp(['newslist' => $newslist, 'new' => count($newslist), 'url' => 'http://www.fastadmin.net?ref=news']);
    }

    protected function userLogin($username, $password, $keeplogin=0){
//        $login_flg = false;
        $info['status'] = false;
        //TODO 用户登录验证
        $user_model = new UserModel;
        $res = $user_model->where('username', $username)->find();
        if(!$res){
            $info['msg'] = '不存在该用户';
            return $info;
        }
        if ($res['status'] != 'normal') {
            $info['msg'] = '该用户状态不正常';
            return $info;
        }
        if ($res['password'] != md5(md5($password) . $res['salt'])) {
            $info['msg'] = '登录用户名或密码错误';
            return $info;
        }
        $user_info=array(
            'id'=>$res['id'],
            'nickname'=>$res['nickname'],
            'avatar'=>$res['avatar'],
            'logintime'=>$res['logintime']
        );
        session('user_info',$user_info);
        $info['status'] = true;
        $info['msg'] = '登录成功';
        $info['data'] = $user_info;
        return $info;
    }

}
