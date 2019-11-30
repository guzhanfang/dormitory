<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    	.title{
    		font-size:25px;
    		
    	}
    </style>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form">
        <span class = "title">学生基本信息</span>
        <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>学号
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="sid" name="sid" required="" lay-verify="sid" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.studentBean.sid }">
              </div>
              
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="sname" name="sname" required="" lay-verify="sname" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.studentBean.sname }">
              </div>
              
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>性别
              </label>
              <div class="layui-input-inline">
                  <select name="attribute" id="attribute">
                  <c:choose>
                  	<c:when test="${sessionScope.studentBean.ssex=='男' }">
	            	 <option type="checkbox" value="男" required="" 
	                autocomplete="off" class="layui-input">男</option>
	                </c:when>
	                <c:when test="${sessionScope.studentBean.ssex=='女' }">
	                <option type="checkbox" value="女" required="" 
	                autocomplete="off" class="layui-input">女</option> 
	                </c:when>
	              </c:choose>
	           	</select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>专业
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="smajor" name="smajor" required="" lay-verify="smajor" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.studentBean.smajor }">
              </div>
              
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>学院
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="scollege" name="scollege" required="" lay-verify="scollege" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.studentBean.scollege }">
              </div>
             
          </div>
           <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>出生日期
              </label>
              <div class="layui-input-inline">
                 <input class="layui-input"  autocomplete="off" name="sbirthday" id="sbirthday"
                   readonly="readonly" value="${sessionScope.studentBean.sbirthday }">
              </div>
              
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>入学年份
              </label>
              <div class="layui-input-inline">
                 	<input class="layui-input"  autocomplete="off" name="sentranceT" id="sentranceT"  
                 	readonly="readonly"  value="${sessionScope.studentBean.sentranceT }">
              </div>
              
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>联系电话
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="stelephone" name="stelephone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input"  readonly="readonly" value="${sessionScope.studentBean.stelephone }">
              </div>
              
          </div>
          <span class = "title">学生宿舍信息</span>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>楼号
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="house" name="house" required="" lay-verify="house"
                  autocomplete="off" class="layui-input" readonly="readonly" value="${sessionScope.dormbean.house }">
              </div>
              
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>栋号
              </label>
              <div class="layui-input-inline">
	           	<select name="build" id="build">
	           	<c:choose>
		           	<c:when test="${sessionScope.dormbean.build=='A' }">
		            	 <option type="checkbox"   value="A" required="" 
		                autocomplete="off" class="layui-input">A</option>
		            </c:when>
		            <c:when test="${sessionScope.dormbean.build=='B' }">
		            
		                <option type="checkbox"   value="B" required="" 
		                autocomplete="off" class="layui-input">B</option>
	                </c:when>
	                <c:when test="${sessionScope.dormbean.build=='C' }">
		                <option type="checkbox"   value="C" required="" 
		                autocomplete="off" class="layui-input">C</option>
	                </c:when>
	             </c:choose>
	           	</select>
                 
              </div>
              
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>宿舍门牌号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="number" name="number" required="" lay-verify="number"
                  autocomplete="off" class="layui-input" readonly="readonly" value="${sessionScope.dormbean.number }">
              </div>
             
          </div>
          
          <div class="layui-form-item" style="display:none">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>房屋状态
              </label>
              <div class="layui-input-inline">
                   <select name="status" id="status">
                   <c:choose>
                   		<c:when test="${sessionScope.dormbean.status==1 }">
			            	 <option type="checkbox" id="L_email"  value="1" required="" 
			                autocomplete="off" class="layui-input">可住</option>
		                </c:when>
		                <c:when test="${sessionScope.dormbean.status==0 }">
			                <option type="checkbox" id="L_email" value="0" required="" 
			                autocomplete="off" class="layui-input">不可住</option> 
		                </c:when>
	                </c:choose>
	           	</select>
              </div>
          </div>
          
      </form>
    </div>
    <script>
    </script>
  </body>

</html>