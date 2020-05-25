<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="Model.Turma"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastro de Turmas</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Barra superior com os menus de navegacao -->
	<c:import url="Menu.jsp" />
	<div class="alert alert-danger" role="alert">
  		Já possui uma turma cadastrada com essas informações!
	</div>
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Cadastrar Turma</h3>
		<!-- Formulario para inclusao de clientes -->
		<form action="ManterTurmaController.do" method="post">

			<!-- area de campos do form -->
			<div class="row">
				<div class="form-group col-md-2">
					<label for="semestreLetivo">Semestre Letivo</label> <input
						type="text" class="form-control" name="semestreLetivo"
						id="semestreLetivo" required maxlength="2" placeholder="">
				</div>
				<div class="form-group col-md-2">
					<label for="anoLetivo">Ano Letivo</label> <input type="text"
						class="form-control" name="anoLetivo" id="anoLetivo" required
						maxlength="7" placeholder="YYYY">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="sigla">Sigla</label> <input type="text"
						class="form-control" name="sigla" id="sigla" maxlength="10"
						placeholder="XXXX-XXX">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="sigla">Tema</label> <select name="TemaId" id="tema.id"
						class="form-control mobileSelect">
						<c:forEach items="${lista}" var="tema">
							<option value="${tema.id}" id="${tema.id}">${tema.titulo}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-success" name="acao"
						value="Criar">Salvar</button>
					<a href="index.jsp" class="btn btn-default">Cancelar</a>
				</div>
			</div>
		</form>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
</body>

</html>