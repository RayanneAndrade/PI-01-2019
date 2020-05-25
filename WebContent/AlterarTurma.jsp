<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sistema Escolar - Alterar Turma</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Barra superior com os menus de navegação -->
	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Alterar Turma #${turma.id }</h3>
		<!-- Formulario para alteração de turma -->
		<form action="ManterTurmaController.do" method="post">
			<!-- area de campos do form -->
			<input type="hidden" name="id" value="${turma.id }" />
			<div class="row">
				<div class="form-group col-md-6">
					<label for="semestreLetivo">Semestre Letivo</label> <input type="semestreLetivo"
						class="form-control" name="semestreLetivo" id="semestreLetivo" required
						maxlength="100" placeholder="semestre letivo obrigatorio"
						value="${turma.semestreLetivo }">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="anoLetivo">Ano Letivo</label> <input type="anoLetivo"
						class="form-control" name="anoLetivo" id="anoLetivo" required
						maxlength="60" placeholder="ano letivo obrigatório"
						value="${turma.anoLetivo }">
				</div>

				<div class="form-group col-md-4">
					<label for="sigla">Sigla</label> <input type="sigla"
						class="form-control" name="sigla" id="sigla" required
						maxlength="60" placeholder="sigla obrigatório"
						value="${turma.sigla }">
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-success" name="acao"
						value="Alterar">Salvar</button>
					<a href="ListarTurma.jsp" class="btn btn-default">Cancelar</a>
				</div>
			</div>
		</form>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>