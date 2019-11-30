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
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>宿舍编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="id" name="id" required="" lay-verify="id" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.dormbean.id }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>不可修改
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>楼号
              </label>
              <div class="layui-input-inline">
                   <input type="text" id="house" name="house" required="" lay-verify="house"
                  autocomplete="off" class="layui-input" readonly="readonly" value="${sessionScope.dormbean.house }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>不可修改
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>栋号
              </label>
              <div class="layui-input-inline">
              
              
               <input type="text" id="build" name="build" required="" lay-verify="build"
                  autocomplete="off" class="layui-input" readonly="readonly" value="${sessionScope.dormbean.build }">              
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>不可修改
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>宿舍门牌号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="number" name="number" required="" lay-verify="number" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.dormbean.number }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>不可修改
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>宿舍人数
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="quantity" name="quantity" required="" lay-verify="quantity" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.dormbean.quantity }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>不可修改
              </div>
          </div>
          
          
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>房屋状态
              </label>
              <div class="layui-input-inline">
              		<c:choose>
              			<c:when test="${sessionScope.dormbean.status==1 }">
              		
		              		 <select name="status" id="status">
				            	 <option type="checkbox" id="L_email"  value="1" required="" 
				                autocomplete="off" class="layui-input">可住</option>
				           	</select>
                 		</c:when>
                 		<c:when test="${sessionScope.dormbean.status==0 }">
              				 <select name="status" id="status">
			              		 <option type="checkbox" id="L_email" value="0" required="" 
					                autocomplete="off" class="layui-input">不可住</option> 
				             </select>
                 		</c:when>
              		</c:choose>
                  
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>男女宿舍
              </label>
              <div class="layui-input-inline">
              
                  <select name="attribute" id="attribute">
	            	 
	            	 <option type="checkbox" value="男" required="" 
	                autocomplete="off" class="layui-input">男</option>
	                <option type="checkbox" value="女" required="" 
	                autocomplete="off" class="layui-input">女</option> 
	           	
	           	</select>
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>唯一可修改项
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  更改宿舍信息
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;

          //监听提交
          form.on('submit(add)', function(data){
        	  var $id = $("#id").val();
        	  var $house = $("#house").val();
              var $build = $("#build option:selected").val();
              var $number = $("#number").val();
              var $attribute = $("#attribute option:selected").val();
              var $status = $("#status option:selected").val();
             
             
  		         $.ajax({
  		              url:"DormUpdateStatusServlet",
  		              type:"post",
  		              data:"house="+$house+"&id="+$id+"&build="+$build+"&number="+$number+"&attribute="+$attribute+"&status="+$status,
  		              dataType:"json",
  		              success:function(data){
  		            	  if(data){
  		            		  layer.alert("更改成功", {icon: 6},function () {
  			                      //关闭当前frame
  			                      x_admin_close();

  			                      // 可以对父窗口进行刷新 
  			                      x_admin_father_reload();
  			                  });
  		            	  }
  		            	  else{
  		            		  layer.alert("更改失败，此宿舍还有学生");
  		            	  }
  		              }
  		         });
           
            return false;
          });
          
          
        });
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>