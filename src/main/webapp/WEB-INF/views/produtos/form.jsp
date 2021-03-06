<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
		padding: 60px 0;
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
				<a class="navbar-brand" href="${s:mvcUrl('HC#index').build() }/">Casa do Código</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="${s:mvcUrl('PC#listar').build() }">Produtos</a></li>
					<li><a href="${s:mvcUrl('PC#form').build() }">Cadastro de Produtos</a></li>
				</ul>
				<ul class="nav nav-bar navbar-right">
				<li><a href="/logout">
					<security:authentication property="principal" var="usuario" />
						Usuario: ${usuario.username }
				</a></li>			
			</ul>
			</div>
		</div>
	</nav>

<div class="container">

	<h1>Cadastro de Produto</h1>

	<form:form action="${s:mvcUrl('PC#gravar').build() }" method="POST" 
		commandName="produto" enctype="multipart/form-data">
		<div class="form-group">
			<label>Nome:</label>
			<form:input path="titulo" cssClass="form-control" />
			<form:errors path="titulo" />
		</div>
		<div class="form-group">
			<label>Descrição:</label>
			<form:textarea path="descricao" cssClass="form-control" />
			<form:errors path="descricao" />
		</div>
		<div class="form-group">
			<label>Paginas:</label>
			<form:input path="paginas" cssClass="form-control"/>
			<form:errors path="paginas" />
		</div>
		<div class="form-group">
			<label>Data de Lançamento:</label>
			<form:input path="dataLancamento" cssClass="form-control"/>
			<form:errors path="dataLancamento" />
		</div>
		<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
			<div class="form-group">
				<label>${tipoPreco}</label>
				<form:input path="precos[${status.index}].valor" cssClass="form-control"/>
				<form:hidden path="precos[${status.index }].tipo" value="${tipoPreco}" />
				<br />
			</div>
		</c:forEach>
		<div class="form-group">
			<label>Sumario:</label>
			<input type="file" name="sumario" class="form-control"/>
		</div>
		<button type="submit" class="btn btn-primary">Cadastrar</button>
	</form:form>
</div>
</body>
</html>