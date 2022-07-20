<%@page import="br.com.renato.costa.Categoria"%>
<%@page import="br.com.renato.costa.CategoriaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cliente</title>
</head>
<body>
	<form action="http://localhost:8080/projetoWebHibernate/Cliente" method="POST">
		Nome: <br>
		<input type="text" name="txtNome"> 
		<br> 
		Sobrenome: <br> <input type="text" name="txtSobrenome"> 
		<br> 
		Categoria: <br>
		<select name="cbCat">
		
		<option value="0">-- Selecione -- </option>
		<%
		 CategoriaDAO dao = new CategoriaDAO();
		for(Categoria cat : dao.exibir()){
		
		%>
			<option value="<%=cat.getId() %>"><%=cat.getNome() %></option>
		
		<%
		}
		%>
		
		</select>
		<br><br>
		<input type="submit" value="Cadastrar">
	</form>


</body>
</html>