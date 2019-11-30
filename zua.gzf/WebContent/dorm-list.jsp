<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
      <div class="layui-row" >
        <form class="layui-form layui-col-md12 x-so" action="DormSelectServlet" method="post" >
          <table class="layui-table x-admin" >
        <thead>
          <tr align="center">
            <th>
              楼号
            </th>
            <th>栋号</th>
            <th>门牌号</th>
            <th>男女宿舍</th>
            <th>宿舍人数</th>
            <th></th>
          </tr>
            </thead>
            <tbody>
            <tr>
            <td>
             <div class="layui-input-inline">
                  <select name="house" id="house">
                  <option type="checkbox"   value="" required="" 
	                autocomplete="off" class="layui-input">全部</option>
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
              </td>
              <td><div class="layui-input-inline">
	           	<select name="build" id="build">
	           	<option type="checkbox"   value="" required="" 
	                autocomplete="off" class="layui-input">全部</option>
	            	 <option type="checkbox"   value="A" required="" 
	                autocomplete="off" class="layui-input">A</option>
	                <option type="checkbox"   value="B" required="" 
	                autocomplete="off" class="layui-input">B</option>
	                <option type="checkbox"   value="C" required="" 
	                autocomplete="off" class="layui-input">C</option>
	           	</select>
                 
              </div></td>
              <td><input type="text" name="number"  placeholder="请输入宿舍门牌号" autocomplete="off" class="layui-input"></td>
              <td> <div class="layui-input-inline">
	           	<select name="attribute" id="attribute">
	           	<option type="checkbox"   value="" required="" 
	                autocomplete="off" class="layui-input">全部</option>
	            	 <option type="checkbox"   value="男" required="" 
	                autocomplete="off" class="layui-input">男</option>
	                <option type="checkbox"   value="女" required="" 
	                autocomplete="off" class="layui-input">女</option>
	           	</select>
                 
              </div></td>
              <td><input type="text" name="quantity"  placeholder="宿舍人数" autocomplete="off" class="layui-input"></td>
              <td>
              <input class="layui-btn"  lay-submit="" lay-filter="sreach" type="submit" value="查询"><i class="layui-icon">&#xe615;</i></td>
            </tr>
        </tbody>
         </table>
          
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加宿舍','./dorm-add.jsp',600,400)"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${requestScope.dormTotalCount } 条</span>
      </xblock>
      <table class="layui-table x-admin">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>楼号</th>
            <th>栋号</th>
            <th>门牌号</th>
            <th>男女宿舍</th>
            <th>当前人数</th>
            <th>状态</th>
            <th>操作</th></tr>
        </thead>
        <tbody>
        
        
        <!-- 循环开始 -->
        <c:forEach var="dormbean" items="${requestScope.dormbeans }">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td id = "house">${dormbean.house }</td>
            <td id = "build">${dormbean.build }</td>
            <td id = "number">${dormbean.number }</td>
            <td id = "attribute">${dormbean.attribute }</td>
            <td id = "quantity">${dormbean.quantity }</td>
            <c:choose>
             <c:when test="${dormbean.status==1 }">
            	<td class="td-status">
	              	<span class="layui-btn layui-btn-normal layui-btn-mini" >
	              	已启用
	              	</span></td>
	          <td class="td-manage">
              <a onclick="member_stop(this,${dormbean.id })" href="javascript:;"  title="启用">
                <i class="layui-icon">&#xe601;</i>
              </a>
              </c:when>
              <c:when test="${dormbean.status==0 }">
              <td class="td-status" >
	              	<span class="layui-btn layui-btn-normal layui-btn-mini" >
	              	已停用
	              	</span></td>
	              	<td class="td-manage">
              	<a onclick="member_stop(this,${dormbean.id })" href="javascript:;"  title="禁用">
                <i class="layui-icon">&#xe601;</i>
              </a>
              </c:when>
             </c:choose>
             <a title="编辑"  onclick="dorm_update(this,${dormbean.id })" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a  title="入住学生" href="DormDetailServlet?dormID=${dormbean.id }">
                <i class="layui-icon">&#xe631;</i>
              </a>
              <a title="删除" onclick="member_del(this,${dormbean.id })" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
          </c:forEach>
			<!-- 循环结束 -->

        </tbody>
      </table>
      
    </div>
    <script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });
    //展示用户详细信息
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
       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要更改吗？',function(index){
              if($(obj).attr('title')=='启用'){
				
                //发异步把用户状态进行更改
               $.ajax({
		              url:"DormUpdateStatusServlet",
		              type:"post",
		              data:"id="+id+"&status="+0,
		              dataType:"json",
		              success:function(data){
		            	  if(data){
		            	  $(obj).attr('title','停用')
		                  $(obj).find('i').html('&#xe62f;');

		                  $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
		                  layer.msg('已停用!',{icon: 5,time:1000});
		                  x_admin_reload();
		            	  }
		            	  else{
		            		  layer.msg('当前宿舍还有学生，无法停用!',{icon: 5,time:1000});
		            	  }
		              }
		         });
              }else{
            	  $.ajax({
		              url:"DormUpdateStatusServlet",
		              type:"post",
		              data:"id="+id+"&status="+1,
		              dataType:"json",
		              success:function(data){
		            	  $(obj).attr('title','启用')
		                  $(obj).find('i').html('&#xe601;');

		                  $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
		                  layer.msg('已启用!',{icon: 5,time:1000});
		                  x_admin_reload();
		              }
		         });
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              
                $.ajax({
		              url:"DormDelServlet",
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
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
     
      
      /*宿舍-修改*/
      function  dorm_update(obj,id){
          layer.confirm('确认要更改吗？',function(index){
              //发异步删除数据
                $.ajax({
		              url:"DormUpdateByIdServlet",
		              type:"post",
		              data:"id="+id,
		              dataType:"json",
		              success:function(data){
		            	  layer.msg('获取宿舍信息中，请稍候!',{icon: 5,time:1000});
		            	   x_admin_show('更新宿舍信息','dorm-update.jsp');
		              }
		         });
        	  
          });
      }
		

    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>