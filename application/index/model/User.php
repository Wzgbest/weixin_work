<?php

namespace app\index\model;

use think\Model;

/**
 * 会员模型
 */
class User Extends Model
{

    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    // 追加属性
    protected $append = [
    ];
    public function getUserInfoByName($username, $field = '*'){
        $data = $this->getUserList(array('username' => $username),$field);
        return !empty($data) ? $data[0] : null;
    }
    public function getUserList($where = '', $field = '*', $limit = ''){
        return $this->where($where)->field($field)->limit($limit)->order('id desc')->select();
    }

}
