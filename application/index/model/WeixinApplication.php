<?php

namespace app\index\model;

use think\Model;

/**
* 进程模型
*/
class WeixinApplication extends Model{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    // 追加属性
    protected $append = [
    ];

    public function getMyApp($id){
        return $this->where(['bind_user'=>$id])->order("bind_time desc")
            ->select();
    }

    public function getMyAppCount($id){
        return $this->where(['bind_user'=>$id])->order("bind_time desc")
            ->count();
    }
    public function add(){

    }

    public function getAppByIpSocketPid($ip, $socket_id, $pid, $lock=false){
        $map["ip"] = $ip;
        $map["socket_id"] = $socket_id;
        $map["pid"] = $pid;
        $map["status"] = ["gt",0];
        $data = $this
            ->where($map)
            ->lock($lock)
            ->find();
        return $data;
    }
    public function getAppById($id){
        $map["id"] = $id;
        $data = $this
            ->where($map)
            ->find();
        return $data;
    }
    public function getAppList($where = '', $field = '*', $limit = ''){
        return $this
            ->where($where)
            ->field($field)
            ->limit($limit)
            ->order('id desc')
            ->select();
    }
    public function updateToUser($id,$uid){
        $map["id"]=$id;
        $data["bind_user"]=$uid;
        $data["bind_time"]=time();
        $res = $this
            ->where($map)
            ->update($data);
        return $res;
    }
    public function updateCodeStatusByIpSocketPid($ip, $socket_id, $pid,$status){
        $map["ip"] = $ip;
        $map["socket_id"] = $socket_id;
        $map["pid"] = $pid;
        $data["status"] = $status;
        return $this
            ->where($map)
            ->update($data);
    }
}
