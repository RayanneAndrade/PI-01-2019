<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/navbar.css" rel="stylesheet">
</head>
<nav class="navbar navbar-light" style="background-color: #87CEEB;">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div id="navbar navbar-light" style="background-color: #87CEEB;">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="index.jsp"><img src="img/homer.png" /></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-center">

				<li><a style="color: #333"
					href="ManterTurmaController.do?acao=reiniciar"><img
						src="img/turmas.png" /> Turmas</a>
				<li><a name="acao" value="buscar "style="color: #333"
					href="ListarTurma.jsp"><img src="img/pesq.png" />
						Buscar Turma</a></li>
				<li><a style="color: #333"
					href="ManterTemaController.do?acao=reiniciar"><img
						src="img/tema.png" /> Temas</a></li>
				<li><a style="color: #333" href="listarTemas.do?acao=reiniciar"><img
						src="img/pesq.png" /> Buscar Tema</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a style="color: #333">
						<form name="periodoMenu" class="form-periodo float-left col-lg-6"
							method=post action=ManterMenu?acao=buscar>
							<select name="periodo" class="custom-select"
								onchange="javascript:document.periodoMenu.submit();">

								<option value="" selected disabled>Semestre / Ano</option>

								<c:forEach var="periodo" items="${lstPeriodo}">
									<c:set var="item"
										value="${periodo.anoLetivo}-${periodo.semestreLetivo}" />

									<c:if test="${periodoSelected == item}">
										<option selected value="${item}">
											0${periodo.semestreLetivo}º / ${periodo.anoLetivo}</option>
									</c:if>
									<c:if test="${periodoSelected != item}">

										<option value="${item}">0${periodo.semestreLetivo}º/
											${periodo.anoLetivo}</option>
									</c:if>
								</c:forEach>
							</select>
						</form>
				</a></li>
				<li><a style="color: #333" class="nav-link dropdown-toggle"
					data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
					aria-expanded="false"><img src="img/usuario.png">
						${usuario.nome }</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="SairController?acao=sair">Sair</a>
					</div></li>
			</ul>
		</div>
	</div>
</nav>