<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   
   <form >
   	用户名:<input id="usernameID" type="text"  name="username"  maxlength="4" /> <span   id="resID"></span>
   </form>
  
   <script>
   	function createAJAX(){
   		var ajax=null;
   		try{
   			ajax=new ActiveXObject("microsoft.xmlhttp");
   		
   		}catch(e1){
   			try{
   				ajax=new XMLHttpRequest();
   			}catch(e2){
   				alert("您的浏览器不支持ajax，请更换浏览器试试！");
   			}
   		}
   		return ajax;
   	}
   
   
   //定位文本框，同时提供焦点事件
   document.getElementById("usernameID").onblur=function(){
   		//获取文本框中输入的值
   		var username=this.value.trim();
   		
   		//如果内容为空
   		if(username.length==0){
   			document.getElementById("resID").innerHTML="用户名不能为空";
   		}else{
   			//对汉字进行utf-8编码
   			username=encodeURI(username);
   			var ajax=createAJAX();
   			
   			var method="GET";
   			var url="${pageContext.request.contextPath}/servlet/UserServlet?time="+new Date().getTime()+"&username="+username;
   			ajax.open(method,url);
   			
   			ajax.send(null);
   			
   			ajax.onreadystatechange=function(){
   				if(ajax.readyState==4){
   					if(ajax.status==200){
   						var tip=ajax.responseText;
   						
   						document.getElementById("resID").innerHTML=tip;
   					
   					}
   				}
   			
   			
   			}
   			
   		}
   		
   		
   }
   
   
   
   </script>

  </body>
</html>
