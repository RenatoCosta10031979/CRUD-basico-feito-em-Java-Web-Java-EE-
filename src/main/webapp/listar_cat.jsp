<%@page import="br.com.renato.costa.Categoria"%>
<%@page import="br.com.renato.costa.CategoriaDAO"%>
<%@page import="br.com.renato.costa.ClienteDAO"%>
<%@page import="br.com.renato.costa.Cliente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>CRUD</title>

</head>
<body>

	<table width="100%">

		<tr bgcolor="00 FF 7F">
			<td>ID</td>
			<td>Nome</td>
			<td>Ordem</td>
		</tr>
		<%
		CategoriaDAO dao = new CategoriaDAO();
		Categoria cat = new Categoria();
		cat.setNome("Comum");
		cat.setOrdem(1);
		//dao.salvar(cat);
		
		for (Categoria c : dao.exibir()) {
		%>

		<tr>
			<td><%=c.getId()%></td>
			<td><%=c.getNome()%></td>
				<td><%=c.getOrdem()%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>