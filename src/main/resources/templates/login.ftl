<!DOCTYPE html>
<html lang="en">
<head>
    <title>登录页</title>
    <link rel="stylesheet" href="http://localhost:8080/css/login.css">
    <link rel="stylesheet" href="http://localhost:8080/ui/layui/css/layui.css">
    <script src="http://localhost:8080/js/jquery-3.3.1.min.js"></script>
    <script src="http://localhost:8080/ui/layui/layui.all.js"></script>
    <script src="http://localhost:8080/js/common.js"></script>
    <script src="http://localhost:8080/ui/layui/layui.js"></script>
    <script>
        layui.use(['layer', 'form', 'element'], function(){
            var layer = layui.layer
                ,form = layui.form
                ,element = layui.element
        });

        //解决iframe问题
        function loadTopWindow(){
            if (window.top!=null && window.top.document.URL!=document.URL){
                window.top.location= document.URL;}
        }
    </script>
</head>
<body onload="loadTopWindow()">

<div class="login-main">
    <header class="layui-elip">登录</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="loginName" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-block" style="float: right">
            <input type="checkbox" name="rememberMe" title="记住我" lay-skin="primary">
        </div>

        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">登录</button>
        </div>
        <hr/>
    </form>
</div>

<script type="text/javascript">

        var href=location.href;
        if(href.indexOf("kickout") > 0){
            layer.msg('您的账号在另一台设备上登录,如非本人操作，请立即修改密码！')
        }

    formSubmit("/system/user/toLogin", "submit(login)", "text", function(data) {
        if (data == 'index') {
            location.href = "/index";
        } else {
            layer.msg(data, {icon: 2});
        }
    });
</script>
</body>
</html>