<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sistema Escolar</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.min.css">
</head>

<body>
	<!-- Barra superior com os menus de navegaÃ§Ã£o -->
	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<section class="foo how_it_works">
		<div class="container">
			<div class="wrapper-flex how_it_works">
				<h3 class="title_default clearflex">Como funciona?</h3>
				<h4 class="subtitle_default clearflex">É mais fácil do que você
					imagina</h4>
				<div class="flexchild calendar">
					<h5 class="title">Qualidade</h5>
					<p class="description">Entre as 3 melhores universidades
						privadas do estado de São Paulo</p>
				</div>
				<div class="flexchild location">
					<h5 class="title">Professores qualificados</h5>
					<p class="description">Mais de 97% dos professores com mestrado
						e doutorado</p>
				</div>
				<div class="flexchild professional">
					<h5 class="title">Estrutura</h5>
					<p class="description">Mais de 150 laboratórios e estrutura
						diferenciada</p>
				</div>
				<div class="flexchild price">
					<h5 class="title">A Universidade</h5>
					<p class="description">Mais de 26 mil alunos, 700 professores e
						510 funcionários</p>
				</div>
			</div>
		</div>
	</section>
	<div class="modal-overlay"></div>
	<div class="modal"></div>
	<footer class="foo footer">
		<div class="container">
			<div class="brand">
			</div>
			<div class="social">
				<p class="description_mini">Conheça nossa plataforma e aproveite
					as vantagens de utilizar</p>
				<span>Scholl.me - Todos os direitos reservados 2019</span>
			</div>
		</div>
	</footer>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>