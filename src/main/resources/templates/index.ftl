<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<#include "./header.ftl">
	<style>
        body { font:12px/1.2em Microsoft YaHei;}

        a,
        a:link { color:#000; text-decoration:none; outline:none;}
        a:hover,
        a:focus { text-decoration:none; color:#39f;}


        label,
        button,
        input,
        select,
        textarea { font-size:12px; vertical-align: middle;}

        input,
        button,
        select,
        textarea { font:12px/1.2em Microsoft YaHei;}

        select,
        button,
        input[type="button"],
        input[type="reset"],
        input[type="submit"],
        input[type="radio"],
        input[type="checkbox"] { cursor: pointer;}

        .header { height:55px; position:relative; z-index:0; overflow:hidden; border-bottom:1px #95b8e7 solid; background:url(../images/bg_header.jpg) bottom repeat-x;}
        .header-left { position:absolute; z-index:1; left:15px; top:0;}
        .header-left h1 { font:20px/20px Verdana; color:#fff;}
        .header-right { position:absolute; z-index:1; right:5px; top:0; color:#fff; text-align:right;}
        .header-right p { line-height:0.7em;}
        .header-right a { color:#fff; margin:0 5px;}

        .sidebar { width:160px;height: 25px}
        .side-tree a { display:block;}

	</style>
</head>
<body class="easyui-layout">
	<!-- 顶部信息↓ -->
	<div class="header" data-options="region:'north', border:false, split:true " >
    	<div class="header-left">
        </div>
        <div class="header-right">
            <p><img src="/imgPath/<@shiro.principal property="img"/>" width="20" height="20" />
        	<strong class="easyui-tooltip" title=""><@shiro.principal property="username"/></strong>，欢迎您！
            <a href="#" onclick="logout()">安全退出</a></p>
        </div>
    </div>
    <!-- 顶部信息↑-->

    <!-- 左侧导航菜单↓ -->
	<div class="sidebar" data-options="region:'west', split:true, border:true, title:'导航菜单'"> 
    	<div class="easyui-accordion" data-options="border:false, fit:true ">
			<#list menus as ms>
				<#--shiro权限控制, 如果有权限就显示，没有则隐藏-->
				<@shiro.hasPermission name="${ms.permission}">
					 <div title="${ms.menuName}" iconCls="" style="padding:5px;">
						 <ul class="easyui-tree cc">
							 <#list menu as m>
								 <#if ms.id = m.parentId>
									<@shiro.hasPermission name="${m.permission}">
										<li><i class="${m.menuIcon}"></i>&nbsp;<a href="javascript:void(0)" data-link="${m.menuUrl}" iframe="0">${m.menuName}</a></li>
									</@shiro.hasPermission>
								 </#if>
							 </#list>
						 </ul>
					 </div>
				</@shiro.hasPermission>
			</#list>
        </div>
    </div>
    <!-- 左侧导航菜单↑ -->   
     
    <!-- 首页↓ -->
    <div class="main" data-options="region:'center'">
        <div id="tabs" class="easyui-tabs" data-options="border:false, fit:true ">  
            <div title="首页" data-options="closable:false, iconCls:'icon-tip', cls:'pd3' ">
            	<#--<span class="home">欢迎使用</span>-->
                    <div style="position: absolute;right: 14px;top:42px;">
                        <div class="easyui-panel" style="padding:5px;font-size: 20px;font-weight: 900;">
                            <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'icon-ok'">更换皮肤</a>
                        </div>
                    </div>
                    <div id="layout_north_pfMenu" style=" display: none;">
                        <div onclick="changeTheme('default');">default</div>
                        <div onclick="changeTheme('black');">black</div>
                        <div onclick="changeTheme('bootstrap');">bootstrap</div>
                        <div onclick="changeTheme('gray');">gray</div>
                        <div onclick="changeTheme('material');">material</div>
                        <div onclick="changeTheme('material-teal');">material-teal</div>
                        <div onclick="changeTheme('metro');">metro</div>
                    </div>
            </div>
        </div>
    </div>
    <!-- 首页↑ --> 
	<input type="hidden" id="theme" value="<@shiro.principal property="theme"/>" />
    <script type="text/javascript">
		$(function(){
            $(".tree-icon,.tree-file").removeClass("tree-icon tree-file");
            // $(".tree-indent").removeClass("tree-indent");
			$('.cc a').bind("click",function(){
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe');
				addTab(title,url,iconCls,iframe);
			});
		})
		
		/**
		* 添加菜单选项
		*/	
		function addTab(title, url, iconCls, iframe){
			var tabPanel = $('#tabs');
			if(!tabPanel.tabs('exists',title)){
				var content = '<iframe  scrolling="auto" frameborder="0"  src="'+ url +'" style="width:100%;height:99%;"></iframe>';
				if(iframe){
					tabPanel.tabs('add',{
						title:title,
						content:content,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}else{
					tabPanel.tabs('add',{
						title:title,
						href:href,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
			}else{
				if($('.tabs-selected').text() == title){
					var tab = $('#tabs').tabs('getSelected');  
					$('#tabs').tabs('update', {
						tab: tab,
						options: {
							title: title,
							href: url 
						}
					});
				}else{
					tabPanel.tabs('select',title);
				}
			}
		}

		/**
		* 移除菜单选项
		*/
		function removeTab(){
			var tabPanel = $('#tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab){
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
		}
		
		/**
		*注销
		*/
		function logout() {
			$.messager.confirm('注销', '你确定要注销吗?', function(r){
				if (r){
					location.href = '/logout';
				}
			});
		}


        /**
		 * 更改主题
         * @param themeName
         */
         function changeTheme(themeName) {
             var $easyuiTheme = $('#eayuiThemes');
             var url = $easyuiTheme.attr('href');
             var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
             $easyuiTheme.attr('href', href);
             var $iframe = $('iframe');
             if ($iframe.length > 0) {
                 for ( var i = 0; i < $iframe.length; i++) {
                     var ifr = $iframe[i];
                     $(ifr).contents().find('#eayuiThemes').attr('href', href);
                 }
             }
             $.cookie('easyuiThemeName', themeName, {
                 expires : 7
             });

             $.ajax('/system/user/theme', {
                 method: "POST",
                 data: {theme:themeName},
				 dataType: 'text',
                 success: function (data) {
                 },
                 error: function () {
                     console.log('Upload error');
                 }
             });
        }
	</script>
</body>
</html>