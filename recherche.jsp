<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
</head>
<jsp:useBean id="et" class ="isr3.etudiant.Etudiant"/>
<jsp:useBean id="get" class ="isr3.etudiant.GestionEtudiant"/>
<jsp:setProperty name="et" property ="*"/>

<%
	String id = request.getParameter("num");
	ResultSet res = get.getByNumero(id) ;
	res.next() ;
%>
<body>
<form id="form1" name="form1" method="post" action="listerecherche.php">
  <label>
  <input type="text" name="recherche" />
  </label>
  <label>
  <input type="submit" name="Submit" value="Chercher" />
  </label>
</form>
</body>
</html>
