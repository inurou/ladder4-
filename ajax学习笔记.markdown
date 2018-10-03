##ajax学习

1、XMLHttpRequest
 
- 异步，用于后台和服务器之间交换数据，并对网页进行部分更新
##概念介绍

- 运用HTML和CSS来实现页面，表达信息；
- 运用XMLHttpRequest和web服务器进行数据的异步交换；
- 运用JavaScript操作DOM，实现动态局部刷新；

##创建XMLHttpRequest对象

	var request;

	if(window.XMLHttpRequest){

		//IE7,Firefox,Chrome,Opera,Safari...

		Request = new XMLHttpRequest();

	}else{

		//IE6，IE5

		Request = new ActiveXObject("Microsoft.XMLHTTP");

	}


- Http 是一种无状态协议，即每次的访问没有关系，没有记忆
- 一个完整的HTTP请求，通常有下面7个步骤：

1、建立TCP连接

2、web浏览器向web服务器发送请求命令

3、web浏览器发送请求头信息

4、web服务器应答

5、web服务器发送应答头信息

6、web服务器向浏览器发送数据

7、web服务器关闭TCP连接

- Get:
- 一般用于信息获取
- 使用URL传递参数
- 对所发送信息的数量也有限制，一般在2000个字符

- Post：
- 一般用于修改服务器上的资源
- 对所发送的数量无限制


##Http状态码

![](https://i.imgur.com/XGOL6qY.png)


##XMLHttpRequest发送请求

- open(method,url,async)
- send(string)

##XMLHttpRequest发送实例

![](https://i.imgur.com/aP7Opmz.png)


##XMLHttpRequest取得响应

- responseText：获取字符串形式的响应数据
- responseXML：获得XML形式的响应数据
- status和statusText:以数字和文本形式返回HTTP状态码
- getAllResponseHeader():获取所有的响应报头
- getResponseHeader():查询响应中的某个字段的值


## readyState属性

 --> 0:请求未初始化，open还没有调用

 --> 1:服务器连接已建立，open已经调用了

 --> 2:请求已经接收，也就是接收到头信息了

 --> 3:请求处理中，也就是接收到响应主体了

 --> 4:请求已完成，且响应已就绪，也就是响应完成了 

##XMLHttpRequest请求实例

![](https://i.imgur.com/hGvuuPm.png) 



##ajax例子简介

- 1、查询员工信息，可以通过输入员工编号查询员工基本信息
- 2、新建员工信息，包含员工姓名，员工编号，员工性别，员工职位


- 纯html页面，用来实现员工查询和新建的页面
- php页面，用来实现查询员工和新建员工的后台接口 

###PHP介绍

- PHP是一种创建动态交互性站点的服务器端脚本语言
- PHP能够生成动态页面内容
- PHP能够创建、打开、读取、写入、删除以及关闭服务器上的文件
- PHP能够接受表单数据
- PHP能够发送并取回cookies
- PHP能够添加，删除、修改数据库中的数据
- PHP能够限制用户访问网站中的某些页面
- ...

![](https://i.imgur.com/fe0VkwG.png)


##实例代码：

	<script>
		//Get请求实例
		document.getElementById("search").onclick = function(){
			//发送ajax查询请求并处理
			var request = new XMLHttpRequest();
			request.open("GET","service.php?number=" + document.getElementById("keyword").value);
			request.send();
			request.onreadystatechange = function(){
				if(request.readyState === 4){
					if(request.status === 200){
						document.getElementById("searchResult").innerHTML = request.responseText;
					}else{
						alert("发生错误：" + request.status);					
					}
				}
			}
		}

	</script>





	<script>
		//Post请求实例
		document.getElementById("search").onclick = function(){
			//发送ajax查询请求并处理
			var request = new XMLHttpRequest();
			request.open("POST","service.php");
			
			var data = "name=" + document.getElementById("staffName").value + 
				"&number=" + document.getElementById("staffNumber").value + 
				"&sex=" + document.getElementById("staffSex").value + 
				"&job=" + document.getElementById("staffJob").value;

			request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

			request.send(data);
			request.onreadystatechange = function(){
				if(request.readyState === 4){
					if(request.status === 200){
						document.getElementById("searchResult").innerHTML = request.responseText;
					}else{
						alert("发生错误：" + request.status);					
					}
				}
			}
		}
	</script>



##JSON基本概念

 - JSOn：JavaScript对象表示法（JavaScript Object Notation）
 - JSON是存储和交换文本信息的语法，类似XML。它采用键值对的方式组织，易于人们阅读和编写，同时也易于机器解析和生成
 - JSON是独立于语言的，也就是说不管什么语言，都可以解析JSON,只需要按照JSON的规则来就行

##JSON和XML比较

- json的长度和xml格式比起来很短小
- json读写的速度更快
- json可以使用JavaScript内建的方法直接进行解析，转换成JavaScript对象，非常方便

##JSON语法规则

![](https://i.imgur.com/qpkYmzP.png)

![](https://i.imgur.com/FwYOcad.png)

##JSON解析和校验
- 校验URL：jsonlint.com
- 解析：

![](https://i.imgur.com/YNMGhHy.png)

![](https://i.imgur.com/sNJBBOW.png)


##用jQuery实现Ajax

- jQuery.ajax([settings])


- type:类型，"POST"或"GET",默认为"GET"
- url:发送请求的地址
- data：是一个对象，连同请求发送到服务器的数据
- dataType:预期服务器返回的数据类型。如果不指定，jQuery将自动根据HTTP包MIME信息来智能判断，一般我们采用json格式，可以设置为"json"
- success:是一个方法，请求成功后的回调函数。传入返回后的数据，以及包含成功代码的字符串
- error：是一个方法，请求失败时调用次函数。传入XMLHttpRequest对象


##代码示例
	//引入资源 （百度的一个静态资源库）
	<script src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.js"></script>

	//编写函数 Get请求
	<script>
	$(document).ready(function(){
		$("#search").click(function(){
			$.ajax({
				type:"GET",
				url:"service.php?number=" + $("#keyword").val(),
				dataType:"json",
				success:function(data){
					if(data.success){
						$("#searchResult").html(data.msg);
					}else{
						$("#searchResult").html("出现错误：" + data.msg);
					}
				},
				error:function(jqXHR){
					alert("发生错误：" + jqXHR.status);
				}
			});
		});
	});



	//编写函数 POST请求
	<script>
	$(document).ready(function(){
		$("#save").click(function(){
			$.ajax({
				type:"POST",
				url:"service.php",
				dataType:"json",
				data:{
					name:$("#searchName").val(),
					number:$("#searchNumber").val(),
					sex:$("#searchSex").val(),
					job:$("#searchJob").val(),
				},
				success:function(data){
					if(data.success){
						$("#searchResult").html(data.msg);
					}else{
						$("#searchResult").html("出现错误：" + data.msg);
					}
				},
				error:function(jqXHR){
					alert("发生错误：" + jqXHR.status);
				}
			});
		});
	});
	</script>


##跨域

![](https://i.imgur.com/yjBBq7O.png)

![](https://i.imgur.com/BNwjvFb.png)

![](https://i.imgur.com/WgQontC.png)

![](https://i.imgur.com/8AJqRTV.png)

![](https://i.imgur.com/m7G3mOU.png)

## - JSONP只支持GET请求方式，不支持POST请求方式