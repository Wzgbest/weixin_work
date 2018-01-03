<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/29
 * Time: 10:58
 */

namespace app\admin\controller;
use app\common\controller\Backend;


class Task extends Backend
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Task');
    }

    public function index(){
        if ($this->request->isAjax())
        {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model->getCount($where,$sort,$order);

            $list = $this->model->getList($where, $sort, $order, $offset, $limit);
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * @return mixed
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            $params['end_time'] = strtotime($params["end_time"]);
            $this->request->post(['row' => $params]);
        }
        return parent::add();
    }

    /**
     * 修改
     */
    public function edit($ids = NULL)
    {
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            $params['end_time'] = strtotime($params["end_time"]);
            $this->request->post(['row' => $params]);
        }
        return parent::edit($ids);
    }

    /**
     * Selectpage搜索
     *
     * @internal
     */
    public function selectpage()
    {
        return parent::selectpage();
    }
}