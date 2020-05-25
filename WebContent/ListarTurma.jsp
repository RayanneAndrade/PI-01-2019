<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Buscar Turmas</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>
	<!-- Barra superior com os menus de navegação -->
	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<form action="ManterMenu?acao=buscar" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h2>Turmas</h2>
				</div>
				
				<div class="col-md-9 offset-md-3 text-right">
					<a href="ManterTurmaController.do?acao=reiniciar" class="btn btn-danger pull-right h2">Nova
						Turma</a>
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
								<th>Semestre Letivo</th>
								<th>Ano Letivo</th>
								<th>Sigla</th>
								<th>Tema associado</th>
								<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="turma" items="${lstTurmas}">
								<tr>
									<td>${turma.id }</td>
									<td>0${turma.semestreLetivo }</td>
									<td>${turma.anoLetivo }</td>
									<td>${turma.sigla }</td>
									<td>${turma.tema.titulo }</td>
									<td class="actions"><a class="btn btn-success btn-xs"
										href="ManterTurmaController.do?acao=Visualizar&id=${turma.id }" style="padding: 2%">Detalhes</a>
										<a class="btn btn-danger btn-xs"
										href="ManterTurmaController.do?acao=Editar&id=${turma.id }" style="padding: 2%">Editar</a>
										
									</td>
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
			var recipient = button.data('turma');
			$("#id_excluir").val(recipient);
		});
	</script>
</body>

</html>