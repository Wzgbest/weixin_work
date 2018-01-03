define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'weixin_application/index',
                    add_url: '',
                    edit_url: 'weixin_application/edit',
                    del_url: 'weixin_application/del',
                    multi_url: 'weixin_application/multi',
                    table: 'weixin_application',
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
                        {checkbox: true},
                        {field: 'id', title: "ID",operate:false},
                        {field: 'ip', title:"IP"},
                        {field: 'pid', title: "进程"},
                        {field: 'bind_user', title:"绑定用户"},
                        {field: 'bind_time', title: "绑定时间",operate: false, formatter: Table.api.formatter.datetime,operate: 'BETWEEN', type: 'datetime', addclass: 'datetimepicker', data: 'data-date-format="YYYY-MM-DD"'},
                        {field: 'out_time', title: "下线时间",operate: false, formatter: Table.api.formatter.datetime,operate: false, type: 'datetime', addclass: 'datetimepicker', data: 'data-date-format="YYYY-MM-DD"'},
                        {field: 'createtime', title: "创建时间", operate: false, visible: false, formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: "更新时间", operate: false, visible: false, formatter: Table.api.formatter.datetime},
                        {field: 'status', title: "状态",formatter:function(value){
                            return value == '1'?"未使用":"登陆";
                        },searchList: {'1': "未登录", '2': "登陆"}, style: 'min-width:100px;'},
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