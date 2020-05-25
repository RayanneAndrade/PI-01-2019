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
<title>Sistema Escolar - Visualizar Tema</title>

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
					<h4 class="modal-title" id="modalLabel">Excluir Tema</h4>
				</div>
				<div class="modal-body">Deseja realmente excluir este tema?</div>
				<div class="modal-footer">
					<form action="ManterTemaController.do" method="post">
						<input type="hidden" name="id" value="${tema.id }" />
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
		<h3 class="page-header">Visualizar Tema #${tema.id }</h3>
		<div class="row">
			<div class="col-md-12">
				<p>
					<strong>Data de Cadastro</strong>
				</p>
				<td><c:if test="${not empty tema.dtCadastro}">
						<fmt:formatDate value="${tema.dtCadastro}" type="date"
							pattern="dd-MM-yyyy" />
					</c:if></td>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<p>
					<strong>Titulo</strong>
				</p>
				<p>${tema.titulo}</p>
			</div>
			<div class="col-md-6">
				<p>
					<strong>Introducao</strong>
				</p>
				<p>${tema.introducao}</p>
			</div>
			<div class="col-md-6">
				<p>
					<strong>Requisitos</strong>
				</p>
				<p>${tema.requisitos}</p>
			</div>
		</div>
		<hr />
		<c:if test="${not empty listaAtividade}">
				<div id="list" class="row">

					<div class="table-responsive col-md-12">
						<table class="table table-striped" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th>Id</th>
									<th>Numero</th>
									<th>Descrição</th>
									<th>Formato de Entrega</th>
									<th>Data Inicio</th>
									<th>Data Final</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="atividade" items="${listaAtividade }">
									<tr>
										<td>${atividade.id }</td>
										<td>${atividade.numero }</td>
										<td>${atividade.descricao }</td>
										<td>${atividade.formatoEntrega }</td>
										<td><c:if test="${not empty atividade.dataInicial}">
												<fmt:formatDate value="${atividade.dataInicial}" type="date"
													pattern="dd-MM-yyyy" />
											</c:if></td>
										<td><c:if test="${not empty atividade.dataFinal}">
												<fmt:formatDate value="${atividade.dataFinal}" type="date"
													pattern="dd-MM-yyyy" />
											</c:if></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>

					</div>
				</div>
				<!-- /#list -->
			</c:if>
		<div id="actions" class="row">
			<div class="col-md-12">
				<a href="ManterTemaController.do?acao=Editar&id=${tema.id }"
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