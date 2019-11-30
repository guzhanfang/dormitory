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
                 
                   <input type="text" id="sid" name="sid" required="" lay-verify="sid"  value="${sessionScope.studentBean.sid }"
                  autocomplete="off" class="layui-input" readonly="readonly">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>不可修改
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="sname" name="sname" required="" lay-verify="sname" value="${sessionScope.studentBean.sname }"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>必填
              </div>
          </div>
         
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>专业
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="smajor" name="smajor" required="" lay-verify="smajor" value="${sessionScope.studentBean.smajor }"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>必填
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>学院
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="scollege" name="scollege" required="" lay-verify="scollege" value="${sessionScope.studentBean.scollege }"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>必填
              </div>
          </div>
          
          
           <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>出生日期
              </label>
              <div class="layui-input-inline">
              
              
                 <input class="layui-input"  autocomplete="off" name="sbirthday" id="sbirthday" value="${sessionScope.studentBean.sbirthday }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>必填
              </div>
          </div>
          
          
          
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>入学年份
              </label>
              <div class="layui-input-inline">
                 	<input class="layui-input"  autocomplete="off" name="sentranceT" id="sentranceT" value="${sessionScope.studentBean.sentranceT }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>格式：xxxx
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>联系电话
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="stelephone" name="stelephone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input"  value="${sessionScope.studentBean.stelephone }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>必填
              </div>
          </div>
          <span class = "title">学生宿舍信息</span>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>楼号
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="house" name="house" required="" lay-verify="house" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.dormbean.house }">
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
	           	<input type="text" id="build" name="build" required="" lay-verify="build" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.dormbean.build }">
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
                  <span class="x-red">*</span>性别
              </label>
              <div class="layui-input-inline">
	           	<input type="text" id="ssex" name="ssex" required="" lay-verify="ssex" readonly="readonly"
                  autocomplete="off" class="layui-input" value="${sessionScope.studentBean.ssex }">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>不可修改
              </div>
          </div>
         
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="update" lay-submit="">
                  更改学生信息
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer','laydate'], function(){
        	$ = layui.jquery;
            var form = layui.form
            ,layer = layui.layer
            ,laydate = layui.laydate;
          
          //执行一个laydate实例
           laydate.render({
            elem: '#sbirthday' //指定元素
            ,trigger : 'click'
          });
          laydate.render({ 
        	   elem: '#sentranceT'
        	  ,type: 'year'
        	  ,trigger : 'click'
        	});
          //自定义验证规则
          form.verify({
        	  sid: function(value){
                  if(isNaN(value)){
                    return '你不按照格式输，不开心！';
                  }
                  else{
                	  if(value.length < 5){
                		  return '学号长度至少为5位哦！';  
                	  }
                	  else{
                		  if(value.length > 12 ){
                			  return '学号没有这么长的啊';
                		  }
                	  }
                  }
                }
                ,
                sname: function(value){
                	 if(value.length < 2){
                 		  return '名字长度至少为2位哦！';  
                 	  }
                 	  else{
                 		  if(value.length > 12 ){
                 			  return '名字没有这么长的啊';
                 		  }
                 		  else{
                 			  if(!isNaN(value)){
                 				 return '名字怎么可能是数字呢'; 
                 			  }
                 			  
                 		  }
                 		}
                 	  }
                  ,
                  smajor: function(value){
                 	 if(value.length < 2){
                  		  return '专业名长度至少为2位哦！';  
                  	  }
                  	  else{
                  		  if(value.length > 15 ){
                  			  return '专业名长度没有这么长的啊';
                  		  }
                  		 
                  		}
                  	  }
                   ,
                   scollege: function(value){
                   	 if(value.length < 2){
                    		  return '学院名长度至少为2位哦！';  
                    	  }
                    	  else{
                    		  if(value.length > 15 ){
                    			  return '学院名长度没有这么长的啊';
                    		  }
                    		 
                    		}
                    	  }
                     ,
        	  house: function(value){
              if(isNaN(value)){
                return '你不按照格式输，不开心！';
              }
              else{
            	  if(value.length != 2){
            		  return '你不按照格式输，不开心！';  
            	  }
            	  else{
            		  if(value>10||value<1){
            			  return '楼号为01到10哦！';
            		  }
            	  }
              }
            }
            ,number:function(value){
            	 if(isNaN(value)){
                     return '你不按照格式输，不开心！';
                   }
                   else{
                 	  if(value.length != 3){
                 		  return '没有那么多房间哇！';  
                 	  }
                 	  else{
                 		  if(value/100<1||value/100>=7){
                 			  return '宿舍楼只有6层啊！';
                 		  }
                 		  else{
                 			  if(value%100==0||value%100>30){
                 				 return '每层宿舍楼只有30个房间啊！';
                 			  }
                 		  }
                 	  }
                   }
            }
           
          });

          //监听提交
          form.on('submit(update)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            var $sid = $("#sid").val();
            var $sname = $("#sname").val();
            var $smajor = $("#smajor").val();
            var $scollege = $("#scollege").val();
            var $sbirthday = $("#sbirthday").val();
            var $sentranceT = $("#sentranceT").val();
            var $stelephone = $("#stelephone").val();
            $.ajax({
		              url:"StudentUpdateServlet",
		              type:"post",
		              data:"&sid="+$sid+"&sname="+$sname+"&smajor="+$smajor+"&scollege="+$scollege+"&sbirthday="+$sbirthday+
		              "&sentranceT="+$sentranceT+"&stelephone="+$stelephone,
		              
		              success:function(data){
		            	  
		            	  if(data){
		            	  layer.alert("更新成功", {icon: 6},function () {
		                      //关闭当前frame
		                      x_admin_close();
		                      // 可以对父窗口进行刷新 
		                      x_admin_father_reload();
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