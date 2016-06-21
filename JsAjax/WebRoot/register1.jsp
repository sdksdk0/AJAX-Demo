<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script  type="text/javascript"   src="js/ajax.js"></script>
  </head>
  
  <body>
   
   
   	用户名[post]:<input id="usernameID" type="text"   maxlength="4" />
   <span   id="resID"></span>
  
   <hr />
   
   <script  type="text/javascript">
   	
   
   
   //定位文本框，同时提供焦点事件
   document.getElementById("usernameID").onblur=function(){
   		//获取文本框中输入的值
   		var username=this.value.trim();
   		
   		//如果内容为空
   		if(username.length==0){
   			document.getElementById("resID").innerHTML="用户名不能为空";
   		}else{
   	
   			var ajax=createAJAX();
   			
   			var method="POST";
   			var url="${pageContext.request.contextPath}/servlet/UserServlet?time="+new Date().getTime();
   			ajax.open(method,url);
   			
   			//设置ajax请求头为post，它会将请求体重的汉子自动进行utf-8的编码
   			ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
		
   			
   			var content="username="+username;
   			ajax.send(content);
   			
   			ajax.onreadystatechange=function(){
   				if(ajax.readyState==4){
   					if(ajax.status==200){
   						var tip=ajax.responseText;
   						
   						var imgElement = document.createElement("img");
						//设置img标签的src/width/height的属性值
						imgElement.src = tip;
						imgElement.style.width = "15px";
						imgElement.style.height = "15px";
						//定位span标签
						var spanElement = document.getElementById("resID");
						//清空span标签中的内容
						spanElement.innerHTML = "";
						//将img标签加入到span标签中
						spanElement.appendChild(imgElement);
   						
   					}
   				}
   			
   			}
   			
   		}
   		
   		
   }
   
   
   
   </script>

  </body>
</html>
