<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/29
 * Time: 11:01
 */

namespace app\index\model;
use think\Model;


class Task extends Model
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
    public function getCount($where){

        $num = $this->where($where)
            ->count();

        return $num;
    }
}