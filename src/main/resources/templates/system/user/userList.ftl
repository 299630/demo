<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>角色管理</title>
    <#include "../../header.ftl" />
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center',border:false">
        <!-- 工具栏↓ -->
        <div id="toolbar">
            <div class="toolbar-button">
                <a href="#" class="easyui-linkbutton" id="save" data-options="iconCls:'icon-ok', plain:true"  onclick="userImg()" >修改头像</a>
            </div>
        </div>
        <!-- 工具栏↑ -->
        <table id="datagrid" class="easyui-datagrid"
               data-options="toolbar:'#toolbar'
				        	 ,rownumbers:false
				        	 ,url:'/system/user/getPage'
				        	 ,method:'get'
				        	 ,pageSize:20
				        	 ,pagination:true
				        	 ,emptyMsg:'<span>没有数据!</span>'
				        	 ,fit:true
				        	 ,fitColumns:false
				        	 ,singleSelect:true">
            <thead>
				<tr>
					<th data-options="field:'loginName', width:100, align:'center', halign:'center'">登录账号</th>
					<th data-options="field:'username', width:150, align:'center', halign:'center'">昵称</th>
					<th data-options="field:'status', width:150, align:'center', halign:'center',formatter:status">状态</th>
					<th data-options="field:'role.roleName', width:150, align:'center', halign:'center',formatter:roleName">角色</th>
					<th data-options="field:'img', width:150, align:'center', halign:'center',formatter:img">用户头像</th>
				</tr>
            </thead>
        </table>
        <div id="dlg" class="easyui-dialog" style="width:800px;height:520px;padding:10px 20px"
             data-options="closed:true, buttons:'#dlg-buttons'">
            <form id="fm" method="post" style="position: relative; left:20px;">
                <div class="fitem">
                    <label>角色名称：</label>
                    <input name="roleName" class="easyui-textbox" data-options="readonly:true" />
                </div><br>
                <div class="fitem">
                    <label>排序：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <input name="roleSort" class="easyui-textbox" data-options="readonly:true" />
                </div><br>
            </form>
        </div>
        <div id="dlg-buttons">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="save1()">保存</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#dlg').dialog('close')">取消</a>
        </div>
    </div>
</div>
<script type="text/javascript">
    function save() {
        $('#dlg').dialog('open').dialog('setTitle','添加');
    }

    function roleName(value, row, index) {
        return row.role.roleName;
    }

    function img(value, row, index) {
        return '<img src="/imgPath/'+row.img+'" width="20" height="20" />';
    }
    function status(value, row, index) {
        var s = row.status;
        if (s == 1){
            return '正常';
        } else{
            return '锁定';
        }
    }
    function save1(){
        $.ajax({
            type: "POST",
            dataType: "text",
            url: "/shop/peisong/insert",
            data:$("form").serialize(),
            success: function (data) {
                if(data == "true"){
                    $.messager.alert('信息', '配送成功', 'info', function() {
                        $('#dlg').dialog('close');
                        $('#fm').form('clear');
                        $('#datagrid').datagrid('reload');
                    });
                }else{
                    $.messager.alert('错误', data,'error');
                }
            }
        });
    }
function userImg(){
    location.href="/system/user/img";
}
</script>
</body>
</html>