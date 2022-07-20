<%@page import="br.com.renato.costa.Categoria"%>
<%@page import="br.com.renato.costa.CategoriaDAO"%>
<%@page import="br.com.renato.costa.Cliente"%>
<%@page import="br.com.renato.costa.ClienteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Editar</title>
</head>
<body>

<% 
		Cliente cliente= null;
		if(request.getParameter("id")!= null) {
		ClienteDAO dao = new ClienteDAO();
		 cliente = dao.getById(Integer.parseInt(request.getParameter("id")));
		
	} else {
		
			response.sendRedirect("index.jsp");
		}
%>
	 <form action="http://localhost:8080/projetoWebHibernate/Cliente?update=<%=cliente.getId() %>" method="POST">
	 
	 	Nome: <br> 
	 	<input type="text" name="txtNome" value="<%=cliente.getNome() %>">
	 	<br> Sobrenome: <br> 
	 	<input type="text" name="txtSobrenome" value="<%cliente.getSobrenome();%>">
	 	<br> Categoria: <br>
	 	<select name="cbCat">
	 	<option value="0"> -- Selecione --</option>
	 	<br>
	 	<%
	 		CategoriaDAO dao = new CategoriaDAO();
	 		for(Categoria cat : dao.exibir()){
	 	%>
	 	
	 		<option<% if(cliente.getCat().getId() == cat.getId()){out.println("selected == selected");}%> value="<%=cat.getId() %>"><%=cat.getNome() %></option>
	 	
	 	
	 	<%
	 		}
	 	
	 	%>
	 	
	 	
	 	</select>
	 	<br><br>
	 	<input type="submit" value="Atualizar">
	 	
	 	
	 	
	 	
	 	
	 	
	 	
	 	
	 	
	 	
	 	