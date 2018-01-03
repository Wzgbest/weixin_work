<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use app\index\model\User as UserModel;
use think\Config;
use think\Validate;
use think\Session;

class Base extends Frontend{
    /**
     * 引入控制器的traits
     */
    use \app\index\library\traits\Backend;
    public function _initialize(){
        parent::_initialize();
        $actionname = strtolower($this->request->action());

        if ($actionname=="login"){
            return;
        }
        $user_info = userIsLogin();
        if ($actionname!="login" && !$user_info){
            $url = Session::get('referer');
            $url = $url ? $url : $this->request->url();
            $this->error(__('Please login first'), url('index/login', ['url' => $url]));
        }
        $this->view->assign('user', $user_info);

        // 定义是否Addtabs请求
        !defined('IS_ADDTABS') && define('IS_ADDTABS', input("addtabs") ? TRUE : FALSE);

        // 定义是否Dialog请求
        !defined('IS_DIALOG') && define('IS_DIALOG', input("dialog") ? TRUE : FALSE);

        // 定义是否AJAX请求
        !defined('IS_AJAX') && define('IS_AJAX', $this->request->isAjax());

        // 非选项卡时重定向
        if (!$this->request->isPost() && !IS_AJAX && !IS_ADDTABS && !IS_DIALOG && input("ref") == 'addtabs') {
            $url = preg_replace_callback("/([\?|&]+)ref=addtabs(&?)/i", function($matches) {
                return $matches[2] == '&' ? $matches[1] : '';
            }, $this->request->url());
            $this->redirect('index/index', [], 302, ['referer' => $url]);
            exit;
        }

        $this->view->breadcrumb = [];

//        <li class=" active"><a href="/" addtabs="1" url="" py="grzx" pinyin="gerenzhongxin"><i class="fa fa-dashboard"></i> <span>个人中心</span> <span class="pull-right-container"> <small class="label pull-right bg-blue">hot</small></span></a> </li>
        $menulist = '<li class=" active"><a href="/index/index/account?ref=addtabs" addtabs="1" url="/index/index/account"  py="grzx" pinyin="gerenzhongxin"><i class="fa fa-user"></i> <span>个人中心</span> <span class="pull-right-container"></span></a> </li>
                     <li class=" "><a href="/index/account/index?ref=addtabs" addtabs="2" url="/index/account/index" py="wdxh" pinyin="wodexiaohao"><i class="fa fa-group"></i> <span>我的小号</span> <span class="pull-right-container"></span></a> </li>
                     <li class=" "><a href="/index/index/empty?ref=addtabs" addtabs="3" url="/index/index/empty" py="xx" pinyin="xiaxian"><i class="fa fa-group"></i> <span>下线</span> <span class="pull-right-container"></span></a> </li>
                     <li class=" "><a href="/index/index/empty?ref=addtabs" addtabs="4" url="/index/index/empty" py="tx" pinyin="tixian"><i class="fa fa-money"></i> <span>提现</span> <span class="pull-right-container"></span></a> </li>
                     <li class=" "><a href="/index/task/index?ref=addtabs" addtabs="5" url="/index/task/index" py="sgrw" pinyin="shougongrenwu"><i class="fa fa-dashboard"></i> <span>手工任务</span> <span class="pull-right-container"></span></a> </li>
                     <li class=" "><a href="/index/index/empty?ref=addtabs" addtabs="6" url="/index/index/empty" py="zfsz" pinyin="zhifushezhi"><i class="fa fa-dashboard"></i> <span>支付设置</span> <span class="pull-right-container"></span></a> </li>
                     <li class=" "><a href="/index/index/empty?ref=addtabs" addtabs="7" url="/index/index/empty" py="mmxg" pinyin="mimaxiugai"><i class="fa fa-dashboard"></i> <span>密码修改</span> <span class="pull-right-container"></span></a> </li>
                    ';
        $this->view->assign('menulist', $menulist);
    }
}
