<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/28
 * Time: 15:25
 */
namespace app\index\controller;

use think\Config;
use think\Session;
use app\index\controller\Base;
use app\index\model\Task as TaskModel;
class Task extends Base
{

    protected $layout = 'default';
    public function _initialize()
    {
        parent::_initialize();
        $this->model = new TaskModel();
    }
    public function index(){

        if ($this->request->isAjax())
        {
            $where['status'] = 1;

            $total = $this->model->getCount($where);
            $sort='id';
            $order='desc';
            $offset=$this->request->param('offset')?$this->request->param('offset'):0;
            $limit=$this->request->param('limit')?$this->request->param('limit'):10;
            $list = $this->model->getList($where, $sort, $order, $offset, $limit);
            $result = array("total" => $total, "rows" => $list);
            return json($result);
        }
        return $this->view->fetch();
    }
    public function details(){
        return $this->view->fetch();
    }
}