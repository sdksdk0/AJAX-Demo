<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ajax</title>
  </head>
  <body>
	
	当前时间：<span id="time"></span><br/>
	<input id="buttonID" type="button" value="获取当前时间"/><p/>
	
	<script type="text/javascript">
		//创建AJAX异步对象
		function createAJAX(){
			var ajax = null;
			try{
				//如果IE5=IE12的话
				ajax = new ActiveXObject("microsoft.xmlhttp");
			}catch(e1){
				try{
					//如果是非IE的话
					ajax = new XMLHttpRequest();
				}catch(e2){
					alert("你的浏览器中不支持异步对象，请换浏览器");
				}
			}
			return ajax;
		}
	
	
	
		//定位按钮，同时添加单击事件
		document.getElementById("buttonID").onclick = function(){
			//NO1)创建AJAX异步对象
			var ajax = createAJAX();
			//NO2)准备发送请求
			var method = "GET";
			var url = "${pageContext.request.contextPath}/servlet/AjaxTimeServlet?time=" + new Date().getTime();
			ajax.open(method,url);
			//NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
			ajax.send(null);
			
			//-------------------------------------------------------------等待
		
			//NO4)AJAX异步对象不断监听服务器响应的状态0-1-2-3-【4】
			//一定要状态变化后，才可触发function(){}函数
			//如果状态永远是4-4-4-4-4，是不会触发function(){}函数的
			ajax.onreadystatechange = function(){
				//如果状态码为4的话
				if(ajax.readyState == 4){
					//如果响应码为200的话
					if(ajax.status == 200){
						//NO5)从AJAX异步对象中获取服务器响应的HTML数据
						var nowStr = ajax.responseText;
						
						//NO6)将结果按照DOM规则，动态添加到web页面指定的标签中
						var spanElement = document.getElementById("time");
						spanElement.innerHTML = nowStr;
					}
				}
			} 
			
		}
	</script>
	
	
	
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
	静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本静态文本<br/>
  </body>
</html>
