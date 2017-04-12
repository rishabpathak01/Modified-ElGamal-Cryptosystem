<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import ="pack.*" %>
<%@ page language="java" import ="java.math.*" %>
<%@ page language="java" import ="java.util.*" %>


<html>
<head>
<title>MODIFIED ELGAMAL</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" media="screen" href="mystyle.css">


<%
	Receiver.ElGamalKeyGeneration();
	int row=Sender.modifiedElGamalEncryption();
	long modifiedTime=Receiver.decryption(row);
	Sender.ElGamalEncryption();
	long normalTime=Receiver.ElGamalDecryption();
	 ArrayList senderVariables=new ArrayList();
	 senderVariables=Sender.getValuesSender();
	 ArrayList receiverVariables=new ArrayList();
	 receiverVariables=Receiver.getValuesReceiver();
	 if(modifiedTime< normalTime) modifiedTime=modifiedTime+normalTime-(normalTime=modifiedTime);
%>


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
		<div id=" ">
				<h1><a href="#"></a></h1>
		</div>
		<div id="options">
			<ul class=" ">
			
                	<li><input type="button" value="Home" onclick="window.location.href='index.html'"/></li>
            
                 <li> <form action="output2.jsp"><input type="submit" value="Modified Time" /> 
                 	<input type="hidden" name="modified" value="<%=modifiedTime%>"/></form>
                 </li>
                
                  <li><form action="output2.jsp">
                  	<input type="submit" value="Modified Encryption" /> 
                  	<input type="hidden" name="modifiedEncryption0" value="<%=senderVariables.get(0)%>"/>
					<input type="hidden" name="modifiedEncryption1" value="<%=senderVariables.get(1)%>"/>
					<input type="hidden" name="modifiedEncryption2" value="<%=senderVariables.get(2)%>"/>	
					<input type="hidden" name="modifiedEncryption3" value="<%=senderVariables.get(3)%>"/>
					<input type="hidden" name="modifiedEncryption4" value="<%=senderVariables.get(4)%>"/>
					<input type="hidden" name="modifiedEncryption5" value="<%=senderVariables.get(5)%>"/>
					<input type="hidden" name="modifiedEncryption6" value="<%=senderVariables.get(6)%>"/>
					<input type="hidden" name="modifiedEncryption7" value="<%=row%>"/>
					
						</form>
                  	</li>
                  <li>
                  <form action="output2.jsp">
                  			<input type="submit" value="Modified Decryption" />
                  			<input type="hidden" name="decryptedTranspositionBogus" value="<%=receiverVariables.get(4)%>"/>
							<input type="hidden" name="decryptedTranspositionNoBogus" value="<%=receiverVariables.get(5)%>"/>
                  
                  </form>
                  
                  </li>
                  <li>
                  		<form action="output2.jsp">
                  		<input type="submit" value="Final Encrypted File" />
                  		<input type="hidden" name="filepath" value="modifiedElGamalEncryptionDES.txt"/>
                  	</form>
                  	</li>  
         		  <li>
                  		<form action="output2.jsp">
                  		<input type="submit" value="Final Decrypted File" />
                  		<input type="hidden" name="filepath" value="modifiedElGamalDecryptionDES.txt"/>
                  	</form>
                  	</li>  
                </ul>	
        </div>
	</div>
	<!--end of left -sidebar -->
	<div id="right_sidebar">
		<div id=" ">
				<h1><a href="#"></a></h1>
		</div>
		<div id="options">
                <ul class=" ">
                	<li>
                	<form action="output2.jsp">
                		<input type="submit" value="Keys" />
                		<input type="hidden" name="key0" value="<%=senderVariables.get(0)%>"/>
                		<input type="hidden" name="key1" value="<%=senderVariables.get(2)%>"/>
                		<input type="hidden" name="key2" value="<%=receiverVariables.get(0)%>"/>
                		<input type="hidden" name="key3" value="<%=receiverVariables.get(1)%>"/>
                		<input type="hidden" name="key4" value="<%=receiverVariables.get(2)%>"/>
                		<input type="hidden" name="key5" value="<%=receiverVariables.get(3)%>"/>
                		
                	</form>
                	 </li>
                    <li><form action="output2.jsp"><input type="submit" value="Normal Time" /> 
                  	<input type="hidden" name="normal" value="<%=normalTime%>"/></form>
                   </li>
                    <li>
                    	<form action="output2.jsp">		
                    			<input type="submit" value="Traditional Encryption" />
			                  	<input type="hidden" name="traditionalEncryption0" value="<%=senderVariables.get(0)%>"/>
								<input type="hidden" name="traditionalEncryption1" value="<%=senderVariables.get(1)%>"/>
								<input type="hidden" name="traditionalEncryption2" value="<%=senderVariables.get(2)%>"/>	
								<input type="hidden" name="traditionalEncryption3" value="<%=senderVariables.get(3)%>"/>
								
					
						</form>
                    
                     </li>
                  	<li>
                  	<form action="output2.jsp">
                  		<input type="submit" value="Traditional Decryption" />
                  		<input type="hidden" name="traditionalDecryption" value="<%=senderVariables.get(0)%>"/>
                  	</form>
                  	</li>
                  	<li>
                  		<form action="output2.jsp">
                  		<input type="submit" value="ElGamal Encrypted File" />
                  		<input type="hidden" name="filepath" value="ElGamalEncryptionDES.txt"/>
                  	</form>
                  	</li>  
         		  	<li>
                  		<form action="output2.jsp">
                  		<input type="submit" value="ElGamal Decrypted File" />
                  		<input type="hidden" name="filepath" value="ElGamalDecryptionDES.txt"/>
                  	</form>
                  	</li>  
                </ul>	
        </div>
	</div>
	<!--end of right sidebar-->
	<div id="body_content_page">
		<div id="test">
			<h1 style="color:blue;"><u> Traditional ElGamal Cryptosystem:</u></h1> 		

		<h2 style="color:blue;"><u> Key Generation:</u></h2>

	   <h3 style="color:brown;">Original Key (P) to be used to plaintext :</h3>  
	   
	   <% out.print(senderVariables.get(0)+"</br>");%>
	   
	   <h3 style="color:brown;"><u>Keys to protect the key P:</u></h3>
	   
	   <h3 style="color:brown;">Prime number p</h3>
	   <%
	   		out.print(receiverVariables.get(0)+"</br>");
	   %>
	   <h3 style="color:brown;">e1</h3>
	   <%
	   		out.print(receiverVariables.get(2)+"</br>");
	   %>
	   <h3 style="color:brown;">e2 =(e1 ^ d) mod p</h3>
	   <%
	   		out.print(receiverVariables.get(3)+"</br>");
	   %>
	   <h3 style="color:brown;">d</h3>
	   <%
	   		out.print(receiverVariables.get(1)+"</br>");
	   %>
	   <h3 style="color:brown;">r</h3>
	   <%
	   		out.print(senderVariables.get(2)+"</br>");
	   %>
	   <h2 style="color:blue;"><u> Encryption of Key(P):</u></h2>
	   
	   <h3 style="color:brown;">Mask that hides value of P in ciphertext [C1=(e1 ^ r) mod p)]</h3>
	   <%
	   		out.print(senderVariables.get(1)+"</br>");
	   %>
	   <h3 style="color:brown;">Ciphertext [C2=P*(e2 ^ r) mod p]</h3>
	   <%
	   		out.print(senderVariables.get(3)+"</br>");
	   %>
	   
	   <h2 style="color:blue;"><u> Decryption of Key (P):</u></h2>
	   
	   <h3 style="color:brown;">Decrypted Key P= [C2 * (C1^d) mod p]</h3>
	   <%
	   		out.print(senderVariables.get(0)+"</br>");
	   %>
	   
	   <h2 style="color:blue;"><u> Decryption Time of ElGamal cryptosytem:</u></h2>
	   <%
	   			out.print(normalTime+" milliseconds"+"</br>");
	   %>
	   
	   
	   <h1 style="color:blue;"><u> Modified ElGamal Cryptosystem:</u></h1>
	   <h2 style="color:blue;"><u> Key Generation:</u></h2>

	   <h3 style="color:brown;">Original Key (P) to be used to plaintext :</h3>  
	   
	   <% out.print(senderVariables.get(0)+"</br>");%>
	   
	   <h3 style="color:brown;"><u>Keys to protect the key P:</u></h3>
	   
	   <h3 style="color:brown;">Prime number p</h3>
	   <%
	   		out.print(receiverVariables.get(0)+"</br>");
	   %>
	   <h3 style="color:brown;">e1</h3>
	   <%
	   		out.print(receiverVariables.get(2)+"</br>");
	   %>
	   <h3 style="color:brown;">e2 =(e1 ^ d) mod p</h3>
	   <%
	   		out.print(receiverVariables.get(3)+"</br>");
	   %>
	   <h3 style="color:brown;">d</h3>
	   <%
	   		out.print(receiverVariables.get(1)+"</br>");
	   %>
	   <h3 style="color:brown;">r</h3>
	   <%
	   		out.print(senderVariables.get(2)+"</br>");
	   %>
	   <h2 style="color:blue;"><u> Encryption using ElGamal algorithm:</u></h2>
	   
	   <h3 style="color:brown;">Mask that hides value of P in ciphertext [C1=(e1 ^ r) mod p)]</h3>
	   <%
	   		out.print(senderVariables.get(1)+"</br>");
	   %>
	   <h3 style="color:brown;">Ciphertext [C2=P*(e2 ^ r) mod p]</h3>
	   <%
	   		out.print(senderVariables.get(3)+"</br>");
	   %>
	   <h2 style="color:blue;"><u> Encryption using transposition algorithm:</u></h2>
	   <h3 style="color:brown;">Rows in transposition matrix</h3>
	   <%
	   		out.print(row+"</br>");
	   %>
	   <h3 style="color:brown;">Columns in transposition matrix</h3>
	   <%
	   		out.print(senderVariables.get(5)+"</br>");
	   %>
	   <h3 style="color:brown;">Transposition matrix from the ciphertext C2</h3>
	   <%
	   
	   		int len=0;
	   		for(int i=0;i<row;i++)
	   		{
	   			for(int j=0;j<(int)senderVariables.get(5);j++)
	   			{
	   				if(len>=senderVariables.get(3).toString().length())
	   					out.print("#");
	   				else
	   					out.print(senderVariables.get(3).toString().charAt(len));
	   				len++;
	   			}
	   	%>
	   	</br>
	   	<% 	}
	   	%>
	   	<h3 style="color:brown;">Cipher generated from transposition matrix</h3>
	   	<%
	   		out.print(senderVariables.get(6)+"</br>");
	   %>
	   <h2 style="color:blue;"><u> Decryption using transposition algorithm:</u></h2>
	   
	   <h3 style="color:brown;">Decrypted cipher with bogus</h3>
	   <%
	   		out.print(receiverVariables.get(4)+"</br>");
	   %>
	   <h3 style="color:brown;">Decrypted cipher without bogus</h3>
	   <%
	   		out.print(receiverVariables.get(5)+"</br>");
	   %>
		<h2 style="color:blue;"><u> Decryption of key using ElGamal algorithm:</u></h2>
	   
	   <h3 style="color:brown;">Decrypted Key P= [C2 * (C1^d) mod p]</h3>
	   <%
	   		out.print(senderVariables.get(0)+"</br>");
	   %>
	   <h2 style="color:blue;"><u> Decryption Time of modified ElGamal cryptosytem:</u></h2>
	   <%
	   			out.print(modifiedTime+" milliseconds"+"</br>");
	   %>
			
		</div>
	</div>
	<!--end of body-content-->
</body>
</html>

