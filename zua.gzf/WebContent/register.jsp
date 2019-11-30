<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台登录-X-admin2.1</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./resources/css/font.css">
	<link rel="stylesheet" href="./resources/css/xadmin.css">
	<style>
		.register{
			    display: inline-block;
			    vertical-align: middle;
			    padding: 12px 24px;
			    margin: 0px;
			    font-size: 14px;
			    line-height: 24px;
			    text-align: center;
			    white-space: nowrap;
			    vertical-align: middle;
			    cursor: pointer;
			    color: #ffffff;
			    background-color: #189F92;
			    border-radius: 3px;
			    border: none;
			    -webkit-appearance: none;
			    outline: none;
			    width: 86%;
		}
		#add{
		width: 100%;
		height:50px;
		font-size: 14px;
		}
	</style>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./resources/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./resources/js/xadmin.js"></script>
    <script type="text/javascript" src="./resources/js/cookie.js"></script>
	<script type="text/javascript">
		
		function code(){

	        var email = document.getElementById("email").value;
	        layer.alert("正在发送验证码，请稍后");
			
			$.ajax({
			url:"CodeServlet",
			data:"email="+email,
			type:"post",
			success:function(data){
				layer.alert("验证码已发送至您的邮箱，请注意查收");
			}
		});
		}
		
	</script>
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">宿舍管理系统</div>
        <div id="darkbannerwrap"></div>
        <form method="post" class="layui-form" action="RegisterServlet">
            <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" id="username"  autocomplete="off">

            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input" id="password">
            <hr class="hr15">
            <input name="email" lay-verify="email" placeholder="邮箱"  type="text" class="layui-input" id="email">
            <hr class="hr15">
            <a onclick="code()" class="register">发送验证码到邮箱</a>
            <hr class="hr15">
            <input name="code" lay-verify="required" placeholder="验证码"  type="text" class="layui-input" id="code">
            <hr class="hr15">
            
            <input value="注册" lay-submit lay-filter="add" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>
     <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var email = document.getElementById("email").value;
            var code = document.getElementById("code").value;
			$.ajax({
			url:"RegisterServlet",
			data:"username="+username+"&password="+password+"&email="+email+"&code="+code,
			type:"post",
			success:function(data){
				if(data=="注册成功"){
					layer.alert("注册成功", {icon: 6},function () {
						location.href='login.html';
		            });
				}
				else{
					layer.alert(data, {icon: 6},function () {
						location.href='register.jsp';
		            });
				}
			}
		});
            
            
            return false;
          });
          
          
        });
    </script>
</body>
</html>