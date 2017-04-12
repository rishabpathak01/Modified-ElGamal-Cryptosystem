<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" media="screen" href="mystyle.css"/>
<title>Welcome</title>
</head>
<body>
		<div class="header">
		<div class="logo">
			<img src="images/nistlogo.jpg"/>
		</div>
		<div class="title">
		Modified ElGamal Cryptosystem</br>
	<!---	<div class="address">Palur Hills, Berhampur, Odisha-761008</div> -->	
		</div>
	</div>
	<!--end of header -->
	<div id="left_sidebar">
		<div id="menu_header">
				<h1><a href="#"></a></h1>
		</div>
		<div id="menu_body">
                <ul class="navigation">
                	<li><a href="index.html" class="selected">Home</a></li>
                    <li><a href=""></a></li>
                    <li><a href=""></a></li>
                    <li><a href=""></a></li>
                    <li><a href="" class="last"></a></li>
                </ul>	
        </div>
	</div>
	<!--end of left -sidebar -->
	<div id="right_sidebar">
		<div id="menu_header">
				<h1><a href="#"></a></h1>
		</div>
		<div id="menu_body">
                <ul class="navigation">
                	<li><a href=""><!--Log In--></a></li>
                    <li><a href="">	</a></li>
                    <li><a href=""> 	</a></li>
					<li><a href="">	</a></li>
                    <li><a href="" class="last"> </a></li>	
                </ul>	
        </div>
	</div>
	<!--end of right sidebar-->
	<div id="body_content_page">
		<div id="test" style="margin-top:-40px;">
		<h2>
			<%
					String data=request.getParameter("input");
			  	//out.print(data);
					try
					{
						File f=new File("C:\\Rishab\\testing\\Crypto\\src\\pack\\textfile.txt");
						FileWriter w=new FileWriter(f);
						w.write(data);
						
						w.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					} 
					out.print("Entered Text</br>"+data);
					%>
				</h2>	
					
				<form action="output.jsp">
				
					<input type="submit" value="Execute"/>
				</form>
		</div>
		
			
			
	</div>
	<!--end of body-content-->
</body>
</html>