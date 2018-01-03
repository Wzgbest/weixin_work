<?php

namespace app\index\controller;

use think\Config;
use think\Session;

use app\index\model\WeixinApplication;
use app\index\model\WeixinLoginCode;

class Account extends Base{
    protected $layout = 'default';
    public function _initialize(){
        parent::_initialize();
    }
    //创建进程方法
    protected function create_application(){
        $create_flg = 0;
        //通过配置获取curl连接参数,访问接口,获取返回值,解析
        $server_config = Config::get("pc_server");
        $key = $server_config["key"];
        $host = $server_config["host"];
        $post = $server_config["port"]!=80?(':'.$server_config["port"]):'';
        $cmd = 'create';
        $url = 'http://'.$host.$post."/".$cmd;
        $params["num"] = 1;
        $params_str_arr = [];
        foreach ($params as $name=>$param){
            $params_str_arr[]="$name=$param";
        }
        $params_str = implode("&",$params_str_arr);
        $signature = sha1($params_str."&key=".$key);
        $params_str .= "&signature=".$signature;
        $url.="?".$params_str;
//        var_exp($url,'$url',1);
        $create_data_origin = curl_get($url);
        $create_data = decrypt($create_data_origin,$key);
        $create_arr = json_decode($create_data,true);
        if(isset($create_arr["status"])&&$create_arr["status"]==1){
            $create_flg = 1;
        }
        return $create_flg;
    }

     //小号列表
    public function index(){
        if ($this->request->isAjax()){
            //列出绑定uid为当前用户的application记录
            $userinfo = Session::get('user_info');
            $weixinApplicationM = new WeixinApplication();
            $total = $weixinApplicationM->getMyAppCount($userinfo['id']);

            $list = $weixinApplicationM->getMyApp($userinfo['id']);
            foreach ($list as &$value) {
                $value['bind_time'] = date('Y-m-d H:m',$value['bind_time']);
                if ($value['out_time'] != 0) {
                    $value['out_time'] = date('Y-m-d H:m',$value['out_time']);
                }
            }
//            var_exp($list,'$list');

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    //小号添加页面
    public function add(){
        //调用上面的创建进程接口,显示添加页面,默认显示等待二维码
        $res = $this->create_application();
        if ($res) {
            return $this->view->fetch();
        }else{
            return $this->view->fetch('error');//
        }
    }

    //等待二维码
    public function wait_qr(){
        //尝试更新一个未用的二维码,更新数量为1则成功,成功返回aid和二维码
        $result = ['status'=>0,'meesage'=>"获取失败"];
        $userinfo = Session::get('user_info');
        $weixinLoginCodeM = new WeixinLoginCode();
        $res = 0;
        $res = $weixinLoginCodeM->updateCode($userinfo['id']);
        if ($res){
            $code = $weixinLoginCodeM->getNewCode($userinfo['id']);
            $weixinApplicationM = new WeixinApplication();
            $res = $weixinApplicationM->updateToUser($code["aid"],$userinfo['id']);
            if (!empty($code)) {
                $code['url'] = "/addons/qrcode/index/build.html?issubmit=1&text=". $code['code'] ."&label=&logo=0&labelhalign=0&labelvalign=3&foreground=%23ffffff&background=%23000000&size=256&padding=10&logosize=50&labelfontsize=14&errorcorrection=medium";
                $result['status'] = 1;
                $result['message'] = "获取成功";
                $result['data'] = $code;
            }
        }

        return $result;
    }

    //等待登录
    public function wait_login(){
        //根据aid查询该application记录是否是已登录
        $result = ['status'=>0,'message'=>"登录失败"];
        if ($this->request->isPost()) {
            $id = $this->request->post('aid');
            if (!$id) {
                $result['message'] = "aid不能为空";
                return $result;
            }
            $weixinApplicationM = new WeixinApplication();
            $res = 0;
            $appinfo = $weixinApplicationM->getAppById($id);
            $res = $appinfo['status'];
            if ($res == 2){
                $result['status'] = 1;
                $result['message'] = "登陆成功";
            }
        }
        return $result;
    }
}
