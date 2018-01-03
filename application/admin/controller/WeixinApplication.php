<?php

namespace app\admin\controller;

use app\common\controller\Backend;

/**
* 服务器管理
*/
class WeixinApplication extends Backend
{
	
	/**
     * WeixinServer
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('WeixinApplication');
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

    public function add(){
        return;
    }

    /**
     * 修改
     */
    public function edit($ids = NULL)
    {
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            $params['bind_time'] = strtotime($params["bind_time"]);
            $params['out_time'] = strtotime($params["out_time"]);
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