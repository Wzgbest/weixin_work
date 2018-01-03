<?php

namespace app\index\model;

use think\Model;

/**
 * 二维码模型
 */
class WeixinLoginCode Extends Model{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    // 追加属性
    protected $append = [
    ];
    public function getCodeById($id){
        $map["id"] = $id;
        $data = $this
            ->where($map)
            ->find();
        return $data;
    }
    public function getCodeList($where = '', $field = '*', $limit = ''){
        return $this
            ->where($where)
            ->field($field)
            ->limit($limit)
            ->order('id desc')
            ->select();
    }
    public function updateCodeStatusByAid($aid,$status){
        $map["aid"] = $aid;
        $data["status"] = $status;
        return $this
            ->where($map)
            ->update($data);
    }
    public function updateCode($uid){
        $res = $this
            ->where(['status'=>1])
            ->limit(1)
            ->update(['bind_uid'=>$uid,'status'=>2]);

        return $res;
    }
    public function getNewCode($uid){
        $code = $this
            ->where(['status'=>2,'bind_uid'=>$uid])
            ->order('updatetime desc')
            ->find();
        return $code;
    }
}
