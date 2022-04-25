<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="jsp.*" import= "javax.swing.JOptionPane" errorPage="" %>
<%@page  import="isr3.etudiant.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
<script language="javascript">
	function ajout_etudiant(){
		document.location = "form_etudiant.jsp" ;
	}
	
	function supprimer_etudiant(nbmax){
			exist=0;
			ident="";
			for(i=0;i<nbmax;i++){
				if (document.forms[0].elements['checkbox'+i].checked){
					ident+="&code"+exist+"="+document.forms[0].elements['id'+i].value;
					exist+=1;
				}
			}
			if(exist==0)alert ('Veuillez selectionner au moins un enregistrement');
			else if(exist>=1)
						if(confirm('Etes_vous sure de vouloir supprimer ces enregistrements?'))
							document.location="supprimer_etudiant.jsp?nbsuppr="+exist+ident;
		}
		
function modif_etudiant(nbmax){
			exist=0;
			for(i=0;i<nbmax;i++){
				if(document.forms[0].elements['checkbox'+i].checked==true){
					exist+=1;
					ident=document.forms[0].elements['id'+i].value;
				}
			}
			if (exist==0)alert('Veuillez selectionner un enregistrement');
			else 
				if (exist>1) alert('Veuillez selectionner un seul enregistrement');
				else if (exist==1){
					document.location="form_modif_etudiant.jsp?code="+ident;
				}
		}
</script>
</head>
<jsp:useBean  id="ge" class="isr3.etudiant.GestionEtudiant" />
<body>
        <%
           ResultSet res=ge.getAll();
           int i = 0 ;
         %>
<form id="form1" name="form1" method="post" action="">
  <p align="center">Liste de tous les ETUDIANTS </p>
  <table width="61%" border="1" align="center">
    <tr>
      <td><div align="center">Num&eacute;ro </div></td>
      <td><div align="center">Nom</div></td>
      <td><div align="center">Pr&eacute;nom</div></td>
      <td><div align="center">Sexe</div></td>
      <td><div align="center">Selection</div></td>
    </tr>
 <% while (res.next()){ %>
    <tr>
      <td><%= res.getString("numero") %><input type="hidden" name="id<%=i%>" value="<%=res.getString("numero")%>"/></td>
      <td><%= res.getString("nom") %></td>
      <td><%= res.getString("prenom") %></td>
      <td><%= res.getString("sexe") %></td>
      <td><label>
      <input type="checkbox" name="checkbox<%=i%>" />
      </label></td>
    </tr>
<% i++; %>
<% } %>
  </table>
  <table width="28%" align="center">
    <tr>
      <td><label>
        <input name="Ajouter" type="button" id="Ajouter" value="Ajouter" onclick="javascript:ajout_etudiant()" />
      </label></td>
      <td><label>
        <input type="button" name="Modifier" id="Modifier" value="Modifier" onclick="javascript:modif_etudiant(<%=i%>)" />
      </label></td>
      <td><label>
              <input name="Supprimer" type="button" id="Supprimer" value="Supprimer" onclick="supprimer_etudiant(<%=i%>)"  />
      </label></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
</form>
</body>
</html>
