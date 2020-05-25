<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Login do Sistema</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/nprogress.css" rel="stylesheet">
<link href="css/nprogress.css" rel="stylesheet">
<link href="css/custom.min.css" rel="stylesheet">
</head>
<%
	try {
		String user = (String) session.getAttribute("email");
	} catch (NullPointerException e) {
		session.setAttribute("usuario", "");
	}
%>
<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">

					<div class="login_box">
						<form action="ManterLogin" method="post">
							<h1>Login do Sistema</h1>
							<div>
								<input type="text" name="email" id="email"
									class="form-control login-control" placeholder="Usuário"
									required autofocus />
							</div>
							<div>
								<input type="password" name="senha" id="senha"
									class="form-control login-control" placeholder="Senha" required />
							</div>
							<div>
								<input type="submit" class="btn btn-primary btn-logar"
									value="Logar" />
							</div>
							
					</div>

					<div class="clearfix"></div>
					<div class="separator">
						<div class="clearfix"></div>
						<br />
						<div>
							<h1>
								<i class="fa fa-paw"></i> Sistema JSP!
							</h1>
							<p>Universidade: São Judas Tadeu<br></p>
							<p>
							</p>
						</div>
					</div>
					</form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>