<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'provincecity.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script  type="text/javascript"  src="js/ajax.js"></script>
  </head>
  
  <body>
    <select id="provinceID"  style="width:120px">
    	<option>选择省份</option>
    	<option>湖南省</option>
    	<option>广东省</option>
    </select>
    
    <select  id="cityID">
    	<option>选择城市</option>
 
    </select>
    
    <script>
    
    	//定位省份下拉框，同时添加内容改变事件
    	document.getElementById("provinceID").onchange=function(){
    		//清空
    		var cityElement=document.getElementById("cityID");
	   		cityElement.options.length=1; //只保留第一个					
    		
    		//获取选中省份的名字
    		var index=this.selectedIndex;
    		var optionElement=this[index];
    		//获取选中的option标签中的内容
    		var province=optionElement.innerHTML;
    		
    		if("选择省份"!=province){
    		
    		
	    		var ajax=createAJAX();
	    		
	    		var method="POST";
	    		var url="${pageContext.request.contextPath}/servlet/Province?time="+new Date().getTime();
	   			ajax.open(method,url);
	   			
	   				//设置ajax请求头为post，它会将请求体重的汉子自动进行utf-8的编码
	   			ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
	   			
	   			var content="province="+province;
	   			ajax.send(content);
	   			
	   			ajax.onreadystatechange=function(){
	   			
	   				if(ajax.readyState==4){
	   					if(ajax.status==200){
	   						var xmlDocument=ajax.responseXML;
	   						
	   						
	   						//按照dom去解析xml文档
	   						var cityElementArray=xmlDocument.getElementsByTagName("city");
	   						var size=cityElementArray.length;
	   						for(var i=0;i<size;i++){
	   						//innerHTML只能在html/jsp中使用，不能再xml中使用
	   							var city=cityElementArray[i].firstChild.nodeValue;
	   							var optionElement=document.createElement("option");
	   							
	   							optionElement.innerHTML=city;
	   							
	   							cityElement.appendChild(optionElement);
	   						
	   						}
	   						
	   					}
	   				}
	   			
	   			}
   			
   			}
    	
    	}
    
    
    </script>
    
  </body>
</html>
