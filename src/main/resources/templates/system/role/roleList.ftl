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
                <a href="#" class="easyui-linkbutton" id="save" data-options="iconCls:'icon-ok', plain:true"  onclick="add()" >添加</a>
                <a href="#" class="easyui-linkbutton" id="save" data-options="iconCls:'icon-ok', plain:true"  onclick="permission()" >分配权限</a>
            </div>
        </div>
        <!-- 工具栏↑ -->
        <table id="datagrid" class="easyui-datagrid"
               data-options="toolbar:'#toolbar'
				        	 ,rownumbers:false
				        	 ,url:'/system/role/getPage'
				        	 ,method:'post'
				        	 ,pageSize:20
				        	 ,pagination:true
				        	 ,emptyMsg:'<span>没有数据!</span>'
				        	 ,fit:true
				        	 ,fitColumns:false
				        	 ,singleSelect:true">
            <thead>
                <tr>
                    <th data-options="field:'roleName', width:150, align:'center', halign:'center'">角色名称</th>
                    <th data-options="field:'roleSort', width:100, align:'center', halign:'center'">排序</th>
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

        <div id="dlgs" class="easyui-dialog" style="width:800px;height:520px;padding:10px 20px"
             data-options="closed:true, buttons:'#dlg-buttons'">
            <ul id="treeDemo" class="ztree"></ul>
        </div>
        <div id="dlgs-buttons">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="permission1()">保存</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#dlgs').dialog('close')">取消</a>
        </div>
    </div>
</div>
<script type="text/javascript">
    function save() {
        $('#dlg').dialog('open').dialog('setTitle','添加');
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

    function permission() {
        $('#dlgs').dialog('open').dialog('setTitle','分配权限');
        var setting = {
            view: {
                selectedMulti: false
            },
            async: {
                enable: true,
                url:"/system/menu/getMenu",
                autoParam:["id=parentId"],
                type: "post",
                dataFilter: filter //异步获取的数据filter 里面可以进行处理  filter 在下面
            },
            data: {
                key: {
                    name: "menuName"
                }
            },
            callback: {
                onClick: function(treeId, treeNode) {
                    var treeObj = $.fn.zTree.getZTreeObj(treeNode);
                    var selectedNode = treeObj.getSelectedNodes()[0];
                    $("#txtId").val(selectedNode.id);
                    $("#txtAddress").val(selectedNode.menuName);
                }
            }
        };

        function filter(treeId, parentNode, childNodes) {
            if (!childNodes) return null;
            for (var i=0, l=childNodes.length; i<l; i++) {
                childNodes[i].menuName = childNodes[i].menuName.replace(/\.n/g, '.');
            }
            return childNodes;
        }

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting);
        });
    }

    function permission1() {

    }
</script>
</body>
</html>