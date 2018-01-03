define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'task/index',
                    add_url: '',
                    edit_url: '',
                    del_url: '',
                    multi_url: '',
                    table: 'task',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: false},
                        {field: 'id', title: "编码",operate: false},
                        {field: 'title', title: "任务标题",operate: false},
                        {field: 'commission', title:"佣金",operate: false},
                        {field: 'platform', title: "所需平台",operate: false},
                        {field: 'demand_count', title:"任务需求量",operate: false},
                        {field: 'received_count', title: "已领取数量",operate: false},
                        {field: 'time_limit', title:"完成时效(分钟)",operate: false},
                        {field: 'createtime', title: "创建时间", operate: false,  formatter: Table.api.formatter.datetime},
                        {field: 'end_time', title: "结束时间", operate: false,  formatter: Table.api.formatter.datetime},
                        {field: 'status', title: "状态",operate: false,formatter:function(value){
                            return value == '1'?"正常":"已结束";
                        }},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});