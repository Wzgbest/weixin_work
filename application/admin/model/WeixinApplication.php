<?php

namespace app\admin\model;

use think\Model;

class WeixinApplication extends Model
{

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    public function getList($where, $sort, $order, $offset, $limit){

    	$list = $this->where($where)
                     ->order($sort, $order)
                     ->limit($offset, $limit)
                     ->select();

    	return $list;
    }
    public function getCount($where, $sort, $order){

    	$num = $this->where($where)
                    ->order($sort, $order)
                    ->count();

    	return $num;
    }
}