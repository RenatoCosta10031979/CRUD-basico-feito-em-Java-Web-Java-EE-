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
<script type="text/javascript">

	function apagar(id) {
		if(window.confirm("Deseja realmente apagar este cliente?")){
			window.location = "http://localhost:8080/projetoWebHibernate/Cliente?delete="+ id;
		}
	}

</script>

</head>
<body>

	<table width="100%">

		<tr bgcolor="00 FF 7F">
			<td>ID</td>
			<td>Nome</td>
			<td>Categoria</td>
			<td>Apagar</td>
			<td>Editar</td>
		</tr>
		<%
		ClienteDAO dao = new ClienteDAO();
		for (Cliente c : dao.exibir()) {
		%>

		<tr>
			<td><%=c.getId() %></td>
			<td><%=c.getNome() %></td>
			<td><%= c.getCat().getNome()%></td>
			<td><a href="#" onclick= "apagar('<%=c.getId() %>');">[APAGAR]</a></td>
			<td><a href="editar.jsp?id=<%=c.getId()%>">[EDITAR]</a></td>
		</tr>
		<%
		}
		%>
	</table>
	<a href="novo.jsp">Novo Cliente</a>
	<br>
	<%
		/*
		Cliente c = new Cliente();
		c.setNome("Batman");
		c.setSobrenome("gotcity");
		
		
		ClienteDAO dao = new ClienteDAO();
		
		dao.salvar(c);
		*/
		out.println("status 200 ok");
	
	%>
</body>
</html>