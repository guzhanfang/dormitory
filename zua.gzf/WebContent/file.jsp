<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./resources/css/font.css">
    <link rel="stylesheet" href="./resources/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./resources/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./resources/js/xadmin.js"></script>
    <script type="text/javascript" src="./resources/js/cookie.js"></script>
  </head>
  
  <body>
    <div class="x-body">
        <form id="tf">
            <input type="file" name="img"/>
            <input type="text" name="username"/>
            <input type="button" value="提交" onclick="test();"/>
           
 </form>
    </div>
    <script>
    function test(){
        var form = new FormData(document.getElementById("tf"));
//         var req = new XMLHttpRequest();
//         req.open("post", "${pageContext.request.contextPath}/public/testupload", false);
//         req.send(form);
        $.ajax({
            url:"FileServlet",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                alert("成功");
            },
            error:function(e){
                alert("错误！！");
               
            }
        });        
       
    }
    </script>
  </body>

</html>