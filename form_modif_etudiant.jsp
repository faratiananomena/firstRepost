<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
<script language="javascript">
function miseajourClient(){
		document.location = "liste_maj_etudiant.jsp" ;
	}
</script>
</head>

<jsp:useBean id="get" class ="isr3.etudiant.GestionEtudiant"/>

<%
	String id = request.getParameter("code");
	ResultSet res = get.getByNumero(id) ;
	res.next() ;
%>
<body>
<form id="form1" name="form1" method="post" action="modifier_etudiant.jsp?code=<%=id%>">
  <table width="41%" align="center">
    <tr>
      <td colspan="2"><div align="center"><strong>AJOUT NOUVEAU ETUDIANT </strong></div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Numero</td>
      <td><label>
        <input type="text" name="numero" value="<%=res.getString("numero")%>"/>
      </label></td>
    </tr>
    <tr>
      <td>Nom</td>
      <td><input type="text" name="nom" value="<%=res.getString("nom")%>"/></td>
    </tr>
    <tr>
      <td>Prenom</td>
      <td><input type="text" name="prenom" value="<%=res.getString("prenom")%>"/></td>
    </tr>
    <tr>
      <td>Sexe</td>
	  <%
	  	String selectFeminin = "" ;
		String selectMasculin = "" ;
		if(res.getString("sexe").equals("Masculin"))
			selectMasculin = "selected" ;
		else
			selectFeminin = "selected" ;
	  %>
      <td><label>
        <select name="sexe" id="sexe">
          <option <%=selectMasculin%>>Masculin</option>
          <option <%=selectFeminin%>>Feminin</option>
        </select>
      </label></td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="Modifier" value="Modifier" />        
        &nbsp;&nbsp;
        <input name="Mise &agrave; jour" type="button" id="button" value="Mise &agrave; jour" onclick="javascript:miseajourClient()" />
      </div>
        <label>
        <div align="center"></div>
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
