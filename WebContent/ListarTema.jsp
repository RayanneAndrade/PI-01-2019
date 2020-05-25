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
<title>Buscar Temas</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>
	<!-- Barra superior com os menus de navegação -->
	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<form action="listarTemas.do" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h2>Temas</h2>
				</div>

				<div class="col-md-6">
					<div class="input-group h2">
						<input name="data[search]" class="form-control" id="search"
							type="text"
							placeholder="Pesquisar Temas (deixe vazio para trazer todos)">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="submit" name="acao"
								value="buscar">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>

				<div class="col-md-3 offset-md-3 text-right">
					<a href="CadastroTema.jsp" class="btn btn-danger pull-right h2">Novo
						Tema</a>
				</div>
			</div>
			<!-- /#top -->
		</form>
		<hr />
		<c:if test="${not empty lista}">
			<div id="list" class="row">

				<div class="table-responsive col-md-12">
					<table class="table table-striped" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th>Id</th>
								<th>Data de Cadastro</th>
								<th>Titulo</th>
								<th>Introdução</th>
								<th>Requisitos</th>
								<th class="actions">Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tema" items="${lista}">
								<tr>
									<td>${tema.id }</td>
									<td><c:if test="${not empty tema.dtCadastro}">
											<fmt:formatDate value="${tema.dtCadastro}" type="date"
												pattern="dd-MM-yyyy" />
										</c:if></td>
									<td>${tema.titulo }</td>
									<td>${tema.introducao }</td>
									<td>${tema.requisitos }</td>
									<td class="actions"><a class="btn btn-success btn-xs"
										href="ManterTemaController.do?acao=Visualizar&id=${tema.id }" style="padding: 2%">Detalhes</a>
										<a class="btn btn-danger btn-xs"
										href="ManterTemaController.do?acao=Editar&id=${tema.id }" style="padding: 2%">Editar</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
			</div>
			<!-- /#list -->

			<div id="bottom" class="row">
				<div class="col-md-12">
					<!-- paginação ainda não foi implementada -->
					<ul class="pagination">
						<li class="disabled"><a>&lt; Anterior</a></li>
						<li class="disabled"><a>1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li class="next"><a href="#" rel="next">Próximo &gt;</a></li>
					</ul>
					<!-- /.pagination -->
				</div>
			</div>
		</c:if>
		<!-- /#bottom -->
	</div>
	<!-- /#main -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#delete-modal").on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget); //botao que disparou a modal
			var recipient = button.data('tema');
			$("#id_excluir").val(recipient);
		});
	</script>
</body>

</html>