<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Livros de Java, Android e muito mais..</title>

<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" type="text/css" media="all" />
<script src="${cssPath}bootstrap.min.js" ></script>

<style type="text/css">
	body{
		padding-top: 60px;
	}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" >
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${s:mvcUrl('HC#index').build() }">Casa do Código</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${s:mvcUrl('PC#listar').build() }">Produtos</a></li>
				<li><a href="${s:mvcUrl('PC#form').build() }">Cadastro de Produtos</a></li>
			</ul>
			<ul class="nav nav-bar navbar-right">
				<li><a href="/casadocodigo/logout">
					<security:authentication property="principal" var="usuario" />
						Usuario: ${usuario.username }
				</a></li>			
			</ul>
		</div>
	</div>
</nav>

<div class="container">
	<h1>Lista de Produtos</h1>
	
	<div><h1>${sucesso }</h1></div>
	<div><h1>${falha }</h1></div>
	
	<table class="table table-bordered table-hover table-striped">
		<tr>
			<th>Titulo</th>
			<th>Descrição</th>
			<th>Paginas</th>
		</tr>
		<c:forEach items="${produtos }" var="produto">
			<tbody>
			<tr>
				<td>
					<a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build() }">${produto.titulo }</a>
				</td>
				<td>${produto.descricao }</td>
				<td>${produto.paginas }</td>
			<tr>
			</tbody>
		</c:forEach>
	</table>

</div>
</body>
</html>