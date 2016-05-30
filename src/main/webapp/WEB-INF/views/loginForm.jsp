<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
 
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
	

<div class="container">

	<h1>Login da Casa do Codigo</h1>

	<form:form servletRelativeAction="/login" method="POST" >
		<div class="form-group">
			<label>Email:</label>
			<input name="username" type="text" class="form-control" />
		</div>
		<div class="form-group">
			<label>Senha:</label>
			<input name="password" type="password" class="form-control" />
		</div>
		
		<button type="submit" class="btn btn-primary">Logar</button>
	</form:form>
</div>
</body>
</html>