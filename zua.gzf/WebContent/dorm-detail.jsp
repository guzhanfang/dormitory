<%@page import="com.gzf.util.PageUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
      <table class="layui-table x-admin">
        <thead>
          <tr>
            <th>学号</th>
            <th>学生姓名</th>
            <th>性别</th>
            <th>出生日期</th>
            <th>专业</th>
            <th>所在学院</th>
            <th>联系方式</th>
            <th>入学时间</th>
            <th>操作</th></tr>
        </thead>
        <tbody>
        
        <!-- 循环开始 -->
        <c:forEach var="studentbean" items="${studentBeans }">
          <tr>
            <td>${studentbean.sid }</td>
            <td>${studentbean.sname }</td>
            <td>${studentbean.ssex }</td>
            <td>${studentbean.sbirthday }</td>
            <td>${studentbean.smajor }</td>
            <td>${studentbean.scollege }</td>
            <td>${studentbean.stelephone }</td>
            <td>${studentbean.sentranceT }</td>
         <td class="td-manage">
              <a title="编辑"  onclick="student_update(this,${studentbean.id })" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a onclick="student_detail(this,${studentbean.id })" title="详细信息" href="javascript:;">
                <i class="layui-icon">&#xe631;</i>
              </a>
            </td>
          </tr>
          </c:forEach>
			<!-- 循环结束 -->
        </tbody>
      </table>
    <script>
    function student_detail(obj,id){
    	$.ajax({
            url:"StudentDetailServlet",
            type:"post",
            data:"id="+id,
            dataType:"json",
            success:function(data){
            	
            	if(data){
            		 x_admin_show('学生详细信息','student-detail.jsp');
            	}
          	  
            }
       });
       }
    function student_update(obj,id){
    	$.ajax({
            url:"StudentDetailServlet",
            type:"post",
            data:"id="+id,
            dataType:"json",
            success:function(data){
            	if(data){
            		 x_admin_show('更改学生信息','student-update.jsp');
            	}
            }
       });
       }
    function student_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            
              $.ajax({
		              url:"StudentDelServlet",
		              type:"post",
		              data:"id="+id,
		              dataType:"json",
		              success:function(data){
		            	  if(data){
		            	  $(obj).parents("tr").remove();
		                  layer.msg('已删除!',{icon:1,time:1000});
		            	  }
		            	  else{
		            		  layer.msg('此宿舍还有学生，不可删除!',{icon:1,time:1000});  
		            	  }
		              }
		         });
      	  
        });
    }
    function delAll (argument) {

    	var data = tableCheck.getData();
    	  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
		              url:"StudentUpdateAllServlet",
		              type:"post",
		              data:"data="+data,
		              dataType:"json",
		              success:function(data){
		            	  layer.msg('删除成功', {icon: 1});
		                  $(".layui-form-checked").not('.header').parents('tr').remove();
		              }
		         });
           
        });
      }
    
    
    </script>
   
  </body>

</html>