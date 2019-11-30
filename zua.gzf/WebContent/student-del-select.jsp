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
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="StudentSelectDelListServlet" method="post">
        
        <c:choose>
			  <c:when test="${sessionScope.studentBean.sid==0 }">
				<input type="text" name="sid"  id = "sid" placeholder="请输入学生学号" autocomplete="off" class="layui-input">
			  </c:when>
			  <c:otherwise>
			  	<input type="text" name="sid"  id = "sid" placeholder="请输入学生学号" autocomplete="off" class="layui-input" value="${sessionScope.studentBean.sid }">
			  </c:otherwise>          	
          </c:choose>
        
        
          <input type="text" name="sname"  id = "sname" placeholder="请输入学生姓名" autocomplete="off" class="layui-input" value="${sessionScope.studentBean.sname }">
          <div class="layui-input-inline">
                   <select name="ssex" id="ssex">
                   <option type="checkbox" id="L_email"  value="" required="" 
	                autocomplete="off" class="layui-input">学生性别</option>
	            	 <option type="checkbox" id="L_email"  value="男" required="" 
	                autocomplete="off" class="layui-input">男</option>
	                <option type="checkbox" id="L_email" value="女" required="" 
	                autocomplete="off" class="layui-input">女</option> 
	           	</select>
              </div>
          <input type="text" name="smajor"  id = "smajor" placeholder="请输入学生专业" autocomplete="off" class="layui-input" value="${sessionScope.studentBean.smajor }">
          <input type="text" name="scollege"  id = "scollege" placeholder="请输入学生学院" autocomplete="off" class="layui-input" value="${sessionScope.studentBean.scollege }">
          <c:choose>
			  <c:when test="${sessionScope.studentBean.sentranceT==0 }">
			  	<input type="text" name="sentranceT"  id = "sentranceT" placeholder="请输入学生入学年份" autocomplete="off" class="layui-input">
			  </c:when>
			  <c:otherwise>
			  	<input type="text" name="sentranceT"  id = "sentranceT" placeholder="请输入学生入学年份" autocomplete="off" class="layui-input" value="${sessionScope.studentBean.sentranceT }">
			  </c:otherwise>          	
          </c:choose>
          
          <input class="layui-btn"  lay-submit="" lay-filter="sreach" type="submit" value="查询">
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <span class="x-right" style="line-height:40px">共有数据：${requestScope.pageUtil.totalCount } 条;页数：${requestScope.pageUtil.totalPage} 页</span>
      </xblock>
      <table class="layui-table x-admin">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
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
        <c:forEach var="studentbean" items="${requestScope.pageUtil.list }">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${studentbean.id }'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${studentbean.sid }</td>
            <td>${studentbean.sname }</td>
            <td>${studentbean.ssex }</td>
            <td>${studentbean.sbirthday }</td>
            <td>${studentbean.smajor }</td>
            <td>${studentbean.scollege }</td>
            <td>${studentbean.stelephone }</td>
            <td>${studentbean.sentranceT }</td>
			<td class="td-manage">
              <a onclick="student_detail(this,${studentbean.id })" title="详细信息" href="javascript:;">
                <i class="layui-icon">&#xe631;</i>
              </a>
              <a onclick="student_back(this,${studentbean.id })" title="恢复此数据" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="彻底删除" onclick="student_del(this,${studentbean.id })" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
          </c:forEach>
			<!-- 循环结束 -->
			
        </tbody>
      </table>
      <div class="page">
      <div>
      	<a  class="prev" href="StudentSelectDelListServlet?nowPage=1">首页</a>
      	
      	<c:choose>
	        <c:when test="${requestScope.pageUtil.nowPage - 1 > 0 }">
	        	<a  class="prev" href="StudentSelectDelListServlet?nowPage=${requestScope.pageUtil.nowPage-1 }">上一页</a>
	        </c:when>
	    </c:choose>
	    <c:choose>
	        <c:when test="${requestScope.pageUtil.nowPage - 2 > 0 }">
	        	<a  class="prev" href="StudentSelectDelListServlet?nowPage=${requestScope.pageUtil.nowPage-2 }">${requestScope.pageUtil.nowPage - 2}</a>
	        </c:when>
	    </c:choose>
        <c:choose>
	        <c:when test="${requestScope.pageUtil.nowPage - 1 > 0 }">
	        	<a  class="prev" href="StudentSelectDelListServlet?nowPage=${requestScope.pageUtil.nowPage-1 }">${requestScope.pageUtil.nowPage - 1}</a>
	        </c:when>
	    </c:choose>
	    	<span class="current">${requestScope.pageUtil.nowPage}</span>   
	    <c:choose>
	      	<c:when test="${requestScope.pageUtil.nowPage+1<=requestScope.pageUtil.totalPage }">
	         	<a class="num" href="StudentSelectDelListServlet?nowPage=${requestScope.pageUtil.nowPage+1 }">${requestScope.pageUtil.nowPage+1 }</a>
	        </c:when>
	    </c:choose>
	    <c:choose>
	      	<c:when test="${requestScope.pageUtil.nowPage+2<=requestScope.pageUtil.totalPage }">
	         	<a class="num" href="StudentSelectDelListServlet?nowPage=${requestScope.pageUtil.nowPage+2 }">${requestScope.pageUtil.nowPage+2 }</a>
	        </c:when>
	    </c:choose>
         <c:choose>
	      	<c:when test="${requestScope.pageUtil.nowPage!=requestScope.pageUtil.totalPage }">
	         	<a class="num" href="StudentSelectDelListServlet?nowPage=${requestScope.pageUtil.nowPage+1 }">下一页</a>
	        </c:when>
	    </c:choose>
	    <a  class="prev"  href="StudentSelectDelListServlet?nowPage=${requestScope.pageUtil.totalPage }">尾页</a>
        </div>
      </div>
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
    function student_back(obj,id){
    	
    	 layer.confirm('确认要恢复此数据吗？',function(index){
             //发异步删除数据
             
               $.ajax({
 		              url:"StudentBackServlet",
 		              type:"post",
 		              data:"id="+id,
 		              dataType:"json",
 		              success:function(data){
 		            	  if(data){
 		            	  $(obj).parents("tr").remove();
 		                  layer.msg('已恢复!',{icon:1,time:1000});
 		            	  }
 		            	  
 		              }
 		         });
       	  
         });
       }
    function student_del(obj,id){
        layer.confirm('删除后记录将无法恢复，确认要删除吗？',function(index){
            //发异步删除数据
            
              $.ajax({
		              url:"StudentDeleteServlet",
		              type:"post",
		              data:"id="+id,
		              dataType:"json",
		              success:function(data){
		            	  if(data){
		            	  $(obj).parents("tr").remove();
		                  layer.msg('已彻底删除此数据!',{icon:1,time:1000});
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
		              url:"StudentDeleteAllServlet",
		              type:"post",
		              data:"data="+data,
		              dataType:"json",
		              success:function(data){
		            	  layer.msg('删除成功', {icon: 1});
		                  $(".layui-form-checked").not('.header').parents('tr').remove();
		                  location.reload();
		              }
		         });
           
        });
      }
    
    
    </script>
   
  </body>

</html>