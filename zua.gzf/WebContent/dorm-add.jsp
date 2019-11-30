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
        layui.use(['form','layer'], function(){
           $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
          //自定义验证规则
          form.verify({
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
                 		  return '请输入三位房间号哇！';  
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
            
            var $house = $("#house option:selected").val();
            var $build = $("#build option:selected").val();
            
            var $number = $("#number").val();
            var $status = $("#status option:selected").val();
           
           
		         $.ajax({
		              url:"DormAddServlet",
		              type:"post",
		              data:"house="+$house+"&build="+$build+"&number="+$number+"&status="+$status,
		              dataType:"json",
		              success:function(data){
		            	  if(data){
		            		  layer.alert("增加成功", {icon: 6},function () {
			                      //关闭当前frame
			                      x_admin_close();

			                      // 可以对父窗口进行刷新 
			                      x_admin_father_reload();
			                  });
		            	  }
		            	  else{
		            		  layer.alert("增加失败，此宿舍已存在");
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