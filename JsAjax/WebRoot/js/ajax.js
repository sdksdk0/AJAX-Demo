//创建AJAX异步对象，即XMLHttpRequest
function createAJAX(){
	var ajax = null;
	try{
		ajax = new ActiveXObject("microsoft.xmlhttp");
	}catch(e1){
		try{
			ajax = new XMLHttpRequest();
		}catch(e2){
			alert("你的浏览器不支持ajax，请更换浏览器");
		}
	}
	return ajax;
}