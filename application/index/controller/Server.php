<?php

namespace app\index\controller;

use think\Db;
use think\Config;
use app\index\model\WeixinApplication;
use app\index\model\WeixinLoginCode;
use think\Log;

class Server{
    public function _initialize(){
    }

    //上传二维码
    public function update_qr(){
        Log::write("update_qr_start");
        $result = ['status'=>0 ,'info'=>"保存二维码时发生错误！"];
        $ip = input('ip','','long2ip');
        $socket_id = input('socket_id','','string');
        $pid = input('pid','','string');
        $code = input('qr','','string');
        $weixinApplicationM = new WeixinApplication();
        $weixinLoginCodeM = new WeixinLoginCode();
        $time = time();
        try{
            //开启事务
            Db::startTrans();

            //根据ip,socket_id和端口号,检查是否有该进程->lock(true),没有的话新建
            $app_info = $weixinApplicationM->getAppByIpSocketPid($ip,$socket_id,$pid,true);
//            var_exp($app_info,'$app_info');
            if(!$app_info){
                Log::write("get_app_true");
                $app_info["ip"] = $ip;
                $app_info["socket_id"] = $socket_id;
                $app_info["pid"] = $pid;
                $app_info["createtime"] = $time;
                $app_info["updatetime"] = $time;
                $app_info["status"] = 1;
                $app_info_id = $weixinApplicationM->insertGetId($app_info);
//                var_exp($app_info_id,'$app_info_id');
                if(!$app_info_id){
                    $result['info'] = "保存进程数据时发生错误！";
                    return json($result);
                }
                $app_info["id"] = $app_info_id;
            }else{
                Log::write("get_app_false");
                //根据aid更新所有二维码为失效
                $update_num = $weixinLoginCodeM->updateCodeStatusByAid($app_info["id"],0);
//                var_exp($update_num,'$update_num');
            }
            //添加新的二维码
            $code_info["aid"] = $app_info["id"];
            $code_info["code"] = $code;
            $code_info["createtime"] = $time;
            $code_info["updatetime"] = $time;
            $code_info["status"] = 1;
            $code_info["dead_line"] = $time+Config::get("pc_server.dead_line");
            $code_info_id = $weixinLoginCodeM->insertGetId($code_info);
            Log::write("insert_qr_id:".$code_info_id);
//            var_exp($code_info_id,'$code_info_id');
            if(!$code_info_id){
                $result['info'] = "保存二维码数据时发生错误！";
                return json($result);
            }
            $code_info["id"] = $code_info_id;

            // 提交事务
            Db::commit();
        }catch (\Exception $ex){
            //回滚事务
            Db::rollback();
            $result['info'] = $ex->getLine().':'.$ex->getMessage();
            return json($result);
        }
        Log::write("update_qr_end");
        $result['status'] = 1;
        $result['info'] = "保存二维码信息成功！";
        return json($result);
    }

    //登陆成功
    public function login_success(){
        Log::write("login_start");
        //根据ip和进程号更新进程表
        $result = ['status'=>0 ,'info'=>"保存进程登录时发生错误！"];
        $ip = input('ip','','long2ip');
        $socket_id = input('socket_id','','string');
        $pid = input('pid','','string');
        $weixinApplicationM = new WeixinApplication();
        $update_num = $weixinApplicationM->updateCodeStatusByIpSocketPid($ip,$socket_id,$pid,2);
        Log::write("login_update_num:".$update_num);
        if(!$update_num){
            $result['info'] = "保存进程登录数据时发生错误！";
            return json($result);
        }
        Log::write("login_end");
        $result['status'] = 1;
        $result['info'] = "保存进程登录成功！";
        return json($result);
    }
}
