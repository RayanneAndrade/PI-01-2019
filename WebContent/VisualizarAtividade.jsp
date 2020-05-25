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
<title>Sistema Escolar - Visualizar Atividade</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Modal -->
	<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Fechar">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalLabel">Excluir Atividade</h4>
				</div>
				<div class="modal-body">Deseja realmente excluir esta
					atividade?</div>
				<div class="modal-footer">
					<form action="ManterAtividadeController.do" method="post">
						<input type="hidden" name="id" value="${atividade.id }" />
						<button type="submit" class="btn btn-primary" name="acao"
							value="Excluir">Sim</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->
	<!-- Barra superior com os menus de navegação -->
	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Visualizar Atividade #${atividade.id }</h3>
		<div class="row">
			<div class="col-md-12">
				<p>
					<strong>Numero</strong>
				</p>
				<p>${atividade.numero }</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<p>
					<strong>Descrição</strong>
				</p>
				<p>${atividade.descricao }</p>
			</div>
			<div class="col-md-6">
				<p>
					<strong>Formato de Entrega</strong>
				</p>
				<p>${atividade.formatoEntrega }</p>
			</div>
			<div class="col-md-6">
				<p>
					<strong>Data Inicio</strong>
				</p>
				<td><c:if test="${not empty atividade.dataInicial}">
						<fmt:formatDate value="${atividade.dataInicial}" type="date"
							pattern="dd-MM-yyyy" />
					</c:if></td>
			</div>
			<div class="col-md-6">
				<p>
					<strong>Data Final</strong>
				</p>
				<td><c:if test="${not empty atividade.dataFinal}">
						<fmt:formatDate value="${atividade.dataFinal}" type="date"
							pattern="dd-MM-yyyy" />
					</c:if></td>
			</div>
		</div>
		<hr />
		<div id="actions" class="row">
			<div class="col-md-12">
				<a
					href="ManterAtividadeController.do?acao=Editar&id=${atividade.id }"
					class="btn btn-primary">Editar</a> <a href="#"
					class="btn btn-danger" data-toggle="modal"
					data-target="#delete-modal">Excluir</a> <a href="ListarTema.jsp"
					class="btn btn-default">Voltar</a>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>