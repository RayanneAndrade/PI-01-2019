<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="Model.Tema"%>
<%@page import="Model.Atividade"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sistema Escolar - Alterar Tema</title>

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
	<div class="alert alert-danger" role="alert">
		Não é possivel excluir atividades com entregas já associadas!
	</div>
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Alterar Tema #${tema.id }</h3>
		<!-- Formulario para alteração de tema -->
		<form action="ManterTemaController.do" method="post">
			<!-- area de campos do form -->
			<input type="hidden" name="id" value="${tema.id }" />
			<div class="row">
				<div class="form-group col-md-4">
					<label for="dtCadastro">Data de cadastro</label> <input
						type="dtCadastro" class="form-control" name="dtCadastro"
						id="dtCadastro" required maxlength="10"
						placeholder="data de cadastro obrigatoria"
						value="${tema.dtCadastro }">
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-6">
					<label for="titulo">Título</label> <input type="titulo"
						class="form-control" name="titulo" id="titulo" required
						maxlength="60" placeholder="titulo obrigatorio"
						value="${tema.titulo }">
				</div>
				<div class="form-group col-md-6">
					<label for="introducao">Introdução</label> <input type="introducao"
						class="form-control" name="introducao" id="introducao" required
						maxlength="60" placeholder="introducao obrigatorio"
						value="${tema.introducao }">
				</div>
				<div class="form-group col-md-6">
					<label for="requisitos">Requisitos</label> <input type="requisitos"
						class="form-control" name="requisitos" id="requisitos" required
						maxlength="60" placeholder="requisitos obrigatorio"
						value="${tema.requisitos }">
				</div>
			</div>

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
									<th class="actions">Ações</th>
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
										<td class="actions"><a class="btn btn-success btn-xs"
											href="ManterAtividadeController.do?acao=Visualizar&id=${atividade.id }" style="padding:
												2%">Detalhes</a> <a class="btn btn-danger btn-xs"
											href="ManterAtividadeController.do?acao=Editar&id=${atividade.id }" style="padding: 2%">Editar</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>

					</div>
				</div>
				<!-- /#list -->
			</c:if>

			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-success" name="acao"
						value="Alterar">Salvar</button>
					<a href="ListarTema.jsp" class="btn btn-default">Cancelar</a> <a
						href="ManterAtividadeController.do?acao=pegarID&temaId=${tema.id }"
						class="btn btn-danger"> + Atividades</a>
				</div>
			</div>
		</form>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>