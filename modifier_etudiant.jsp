<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
</head>

<body>

<jsp:useBean id="get" class ="isr3.etudiant.GestionEtudiant"/>
<jsp:useBean id="et" class ="isr3.etudiant.Etudiant"/>
<jsp:setProperty name="et" property ="*"/>
<%
	try {
			String id = request.getParameter("code");
			get.update(id, et);
	}catch(Exception e){
		System.out.print(e);
	}
%>
<jsp:forward page="liste_maj_etudiant.jsp" />
</body>
</html>
