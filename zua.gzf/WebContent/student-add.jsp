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
                 
                   <input type="text" id="sid" name="sid" required="" lay-verify="sid"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>必填
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="sname" name="sname" required="" lay-verify="sname"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>必填
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>性别
              </label>
              <div class="layui-input-inline">
                  <select name="attribute" id="attribute">
	            	 <option type="checkbox" value="男" required="" 
	                autocomplete="off" class="layui-input">男</option>
	                <option type="checkbox" value="女" required="" 
	                autocomplete="off" class="layui-input">女</option> 
	           	</select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>专业
              </label>
              <div class="layui-input-inline">
                 
                   <input type="text" id="smajor" name="smajor" required="" lay-verify="smajor"
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
                 
                   <input type="text" id="scollege" name="scollege" required="" lay-verify="scollege"
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
                 <input class="layui-input"  autocomplete="off" name="sbirthday" id="sbirthday">
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
                 	<input class="layui-input"  autocomplete="off" name="sentranceT" id="sentranceT">
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
                  autocomplete="off" class="layui-input">
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
                  <select name="house" id="house">
	            	 <option type="checkbox"   value="01" required="" 
	                autocomplete="off" class="layui-input">01</option>
	                <option type="checkbox"   value="02" required="" 
	                autocomplete="off" class="layui-input">02</option>
	                <option type="checkbox"   value="03" required="" 
	                autocomplete="off" class="layui-input">03</option>
	                <option type="checkbox"   value="04" required="" 
	                autocomplete="off" class="layui-input">04</option>
	                <option type="checkbox"   value="05" required="" 
	                autocomplete="off" class="layui-input">05</option>
	                <option type="checkbox"   value="06" required="" 
	                autocomplete="off" class="layui-input">06</option>
	                <option type="checkbox"   value="07" required="" 
	                autocomplete="off" class="layui-input">07</option>
	                <option type="checkbox"   value="08" required="" 
	                autocomplete="off" class="layui-input">08</option>
	                <option type="checkbox"   value="09" required="" 
	                autocomplete="off" class="layui-input">09</option>
	                <option type="checkbox"   value="10" required="" 
	                autocomplete="off" class="layui-input">10</option>
	           	</select>
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>01-10
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>栋号
              </label>
              <div class="layui-input-inline">
	           	<select name="build" id="build">
	            	 <option type="checkbox"   value="A" required="" 
	                autocomplete="off" class="layui-input">A</option>
	                <option type="checkbox"   value="B" required="" 
	                autocomplete="off" class="layui-input">B</option>
	                <option type="checkbox"   value="C" required="" 
	                autocomplete="off" class="layui-input">C</option>
	           	</select>
                 
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>ABC
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>宿舍门牌号
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="number" name="number" required="" lay-verify="number"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>最高6层，最多30间
              </div>
          </div>
          <div class="layui-form-item" style="display:none">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>房屋状态
              </label>
              <div class="layui-input-inline">
                   <select name="status" id="status">
	            	 <option type="checkbox" id="L_email"  value="1" required="" 
	                autocomplete="off" class="layui-input">可住</option>
	                <option type="checkbox" id="L_email" value="0" required="" 
	                autocomplete="off" class="layui-input">不可住</option> 
	           	</select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  增加
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
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            
            
            var $sid = $("#sid").val();
            var $sname = $("#sname").val();
            var $smajor = $("#smajor").val();
            var $scollege = $("#scollege").val();
            var $sbirthday = $("#sbirthday").val();
            var $sentranceT = $("#sentranceT").val();
            var $stelephone = $("#stelephone").val();
            
            var $house = $("#house option:selected").val();
            var $build = $("#build option:selected").val();
            
            var $number = $("#number").val();
            var $status = $("#status option:selected").val();
           
            var $attribute = $("#attribute option:selected").val();
           
		         $.ajax({
		              url:"StudentAddServlet",
		              type:"post",
		              data:"house="+$house+"&build="+$build+"&number="+$number+"&attribute="+$attribute+"&status="+$status+
		              "&sid="+$sid+"&sname="+$sname+"&smajor="+$smajor+"&scollege="+$scollege+"&sbirthday="+$sbirthday+
		              "&sentranceT="+$sentranceT+"&stelephone="+$stelephone,
		              
		              success:function(data){
		            	  if(data=="已为您创建此学生信息，并入住宿舍"||data=="已为您创建此宿舍，并入住此学生"){
		            		  layer.alert(data, {icon: 6},function () {
			                      //关闭当前frame
			                      x_admin_close();
			                      // 可以对父窗口进行刷新 
			                      x_admin_father_reload();
			                  });
		            	  }
		            	  else{
		            		  layer.alert(data);
		            	  }
		              }
		         });
		         return false; 
		         
          });
          
          
        });
    </script>
  </body>

</html>