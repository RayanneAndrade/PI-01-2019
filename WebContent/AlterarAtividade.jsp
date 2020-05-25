<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sistema Escolar - Alterar Atividade</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Barra superior com os menus de navegação -->
	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Alterar Atividade #${atividade.id }</h3>
		<!-- Formulario para alteração de atividade -->
		<form action="ManterAtividadeController.do" method="post">
			<!-- area de campos do form -->
			<input type="hidden" name="id" value="${atividade.id }" />

			<div class="row">
				<div class="form-group col-md-2">
					<label for="numero">Numero</label> <input type="numero"
						class="form-control" name="numero" id="numero" required
						maxlength="4" placeholder="numero obrigatoria"
						value="${atividade.numero }">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="descricao">Descrição</label> <input type="descricao"
						class="form-control" name="descricao" id="descricao" required
						maxlength="60" placeholder="descrição obrigatoria"
						value="${atividade.descricao }">
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="formatoEntrega">Formato de Entrega</label> <input
							type="formatoEntrega" class="form-control" name="formatoEntrega"
							id="formatoEntrega" required maxlength="60"
							placeholder="Formato de entrega obrigatoria"
							value="${atividade.formatoEntrega }">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="dataInicial">Data Inicio</label> <input
						type="dataInicial" class="form-control" name="dataInicial"
						id="dataInicial" required maxlength="10"
						placeholder="data inicio obrigatoria"
						value="${atividade.dataInicial}">
				</div>
				<div class="row">
					<div class="form-group col-md-4">
						<label for="dataFinal">Data Final</label> <input type="dataFinal"
							class="form-control" name="dataFinal" id="dataFinal" required
							maxlength="10" placeholder="data final obrigatoria"
							value="${atividade.dataFinal}">
					</div>
				</div>
			</div>
			<hr />

			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-success" name="acao"
						value="Alterar">Salvar</button>
					<a href="ListarTema.jsp" class="btn btn-default">Cancelar</a>
				</div>
			</div>
		</form>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>