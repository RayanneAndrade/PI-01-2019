<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastro de Atividades</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Barra superior com os menus de navegacao -->
	<c:import url="Menu.jsp" />
	<!-- Container Principal -->
	<div id="main" class="container">
		<h3 class="page-header">Cadastrar Atividade</h3>
		<!-- Formulario para inclusao de clientes -->
		<form action="ManterAtividadeController.do" method="post" onsubmit="return validaDatas()" onblur="fctValidaData(this);">
			<!-- area de campos do form -->
			<input name="temaId" value="${tema.id}" type="hidden" />
			<div class="row">
				<div class="form-group col-md-2">
					<label for="numero">Numero</label> <input type="text"
						class="form-control" name="numero" id="numero" required
						maxlength="4" placeholder="">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="descricao">Descrição</label>
					<textarea rows="3" class="form-control" name="descricao" required
						id="descricao"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="formatoEntrega">Formato de Entrega</label> <input
						type="text" class="form-control" name="formatoEntrega"
						id="formatoEntrega" maxlength="60" placeholder="">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label for="dataInicial">Data Início</label> <input type="text"
						name="dataInicial" placeholder="DD/MM/YYYY" pattern="\d{2}/\d{2}/\d{4}"
						title="Digite a data no formato: xx/xx/xxxx" required="required">
				</div>
				<div class="row">
					<div class="form-group col-md-4">
						<label for="dataFinal">Data Final</label> <input type="text"
							name="dataFinal" placeholder="DD/MM/YYYY" pattern="\d{2}/\d{2}/\d{4}"
							title="Digite a data no formato: xx/xx/xxxx" required="required">
					</div>
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-success" name="acao"
						value="Criar">Salvar</button>
					<a href="index.jsp" class="btn btn-default">Cancelar</a>
				</div>
			</div>
		</form>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function validaDatas(){
	    var dataInicial = new String($("input[name='dataInicial']").val());
	    var dataFinal = new String($("input[name='dataFinal']").val());
	    if (!dataInicial || !dataFinal) return false;
	    if (dataInicial > dataFinal) {
	        alert("Data inicio maior que data final");
	        return false;
	    } else {
	        return true
	    }
	}
	
	function fctValidaData(obj)
	{
	    var data = obj.value;
	    var dia = data.substring(0,2)
	    var mes = data.substring(3,5)
	    var ano = data.substring(6,10)
	 
	    //Criando um objeto Date usando os valores ano, mes e dia.
	    var novaData = new Date(ano,(mes-1),dia);
	 
	    var mesmoDia = parseInt(dia,10) == parseInt(novaData.getDate());
	    var mesmoMes = parseInt(mes,10) == parseInt(novaData.getMonth())+1;
	    var mesmoAno = parseInt(ano) == parseInt(novaData.getFullYear());
	 
	    if (!((mesmoDia) && (mesmoMes) && (mesmoAno)))
	    {
	        alert('Data informada é inválida!');   
	        obj.focus();    
	        return false;
	    }  
	    return true;
	}
	</script>
</body>

</html>