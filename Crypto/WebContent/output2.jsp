<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import ="java.util.*" %>
    <%@ page language="java" import="java.io.*" %>
<%@ page language="java" import="java.net.URL" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" media="screen" href="mystyle.css">
<title>Requested Values</title>
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
	<div id="body_content_page">
			<div id="test">
					
                <%
	//String test=request.getParameter("P");
//	String a=request.getParameterNames();
	if(request.getParameter("modified")!=null)
	{
		out.print("<h3><u>Modified ElGamal Cryptosystem took </u></h3>"+request.getParameter("modified")+" milliseconds");	
	}
	else if(request.getParameter("normal")!=null)
	{
		
		out.print("<h3><u>Traditional ElGamal Cryptosystem took </u></h3>"+request.getParameter("normal")+" milliseconds");
	}
	else if(request.getParameter("modifiedEncryption0")!=null)
	{
		
			out.print("<h3><u>P </br></u></h3>"+request.getParameter("modifiedEncryption0")+"</br></br>");
			out.print("<h3><u>C1 </br></u></h3>"+request.getParameter("modifiedEncryption1")+"</br></br>");
			out.print("<h3><u>r </br></u></h3>"+request.getParameter("modifiedEncryption2")+"</br></br>");
			out.print("<h3><u>C2 </br></u></h3>"+request.getParameter("modifiedEncryption3")+"</br></br>");
			out.print("<h3><u>c2 </br></u></h3>"+request.getParameter("modifiedEncryption4")+"</br></br>");
			out.print("<h3><u>column </br></u></h3>"+request.getParameter("modifiedEncryption5")+"</br></br>");
			out.print("<h3><u>transposition cipher </br></u></h3>"+request.getParameter("modifiedEncryption6")+"</br></br>");
			out.print("<h3><u>row </br></u></h3>"+request.getParameter("modifiedEncryption7")+"</br></br>");
		
	}
	else if(request.getParameter("decryptedTranspositionBogus")!=null)
	{
		out.print("<h3><u>Decrypted Transposition with bogus </br></u></h3>"+request.getParameter("decryptedTranspositionBogus")+"</br></br>");
		out.print("<h3><u>Decrypted Transposition without bogus </br></u></h3>"+request.getParameter("decryptedTranspositionNoBogus")+"</br></br>");
	}
	else if(request.getParameter("traditionalEncryption0")!=null)
	{
		out.print("<h3><u>P </br></u></h3>"+request.getParameter("traditionalEncryption0")+"</br></br>");
		out.print("<h3><u>C1 </br></u></h3>"+request.getParameter("traditionalEncryption1")+"</br></br>");
		out.print("<h3><u>r </br></u></h3>"+request.getParameter("traditionalEncryption2")+"</br></br>");
		out.print("<h3><u>C2 </br></u></h3>"+request.getParameter("traditionalEncryption3")+"</br></br>");
	}
	else if(request.getParameter("traditionalDecryption")!=null)	
	{
		//same as P
		out.print("<h3><u>Decryption from ElGamal</br></u></h3>"+request.getParameter("traditionalDecryption")+"</br></br>");
	}
	else if(request.getParameter("key0")!=null)
	{
		out.print("<h3><u>P </br></u></h3>"+request.getParameter("key0")+"</br></br>");
		out.print("<h3><u>r </br></u></h3>"+request.getParameter("key1")+"</br></br>");
		out.print("<h3><u>Prime p </br></u></h3>"+request.getParameter("key2")+"</br></br>");
		out.print("<h3><u>C1 </br></u></h3>"+request.getParameter("key3")+"</br></br>");
		out.print("<h3><u>e1 </br></u></h3>"+request.getParameter("key4")+"</br></br>");
		out.print("<h3><u>e2 </br></u></h3>"+request.getParameter("key5")+"</br></br>");
	}
	else if(request.getParameter("filepath")!=null)
	{
		
		String path="C:\\Rishab\\testing\\Crypto\\src\\pack\\";
		String filePath=request.getParameter("filepath");
		String completePath= path+filePath;
		BufferedReader reader=new BufferedReader(new FileReader(completePath));
		StringBuilder sb=new StringBuilder();
		String line;
		while((line=reader.readLine())!=null)
		{
			sb.append(line+"\n");
		}
		out.print("<h3><u>Contents of the file </u></h3>"+filePath+"</br>"+sb.toString());

	
	}
	//test=request.getParameter("modified");
//	out.print(test);
	
%>
		<form >
				<input type="submit" value="Back" onclick="history.go(-1)"/>
		</form>
			
		</div>
	</div>
	<!--end of body-content-->


</body>
</html>