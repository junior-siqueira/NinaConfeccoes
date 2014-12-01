<jsp:include page="../index/menu.jsp">
	<jsp:param value="Adicione produtos a venda" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<form class="form-horizontal" role="form"
					action="${linkTo[CarrinhoController].adicionar()}2">
					<legend>Venda</legend>
					<div class="form-group">
						<input type="text" name="nome_produto" id="nome_produto"
							placeholder="Pesquisar..." class="col-lg-12 col-md-12">
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div id="panelProdutos"></div>
			</div>
		</div>

		<div class="row">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Listagem</div>
				<table class="table">
					<thead>
						<tr>
							<th>Item</th>
							<th>Marca</th>
							<th class="text-right">Valor</th>
							<th class="text-center">Quantidade</th>
							<th></th>
							<th class="text-right">Subtotal</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sessionCart.carrinho.itens}" var="elemento">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${elemento.produto.nome}</td>
								<td>${elemento.produto.marca}</td>
								<td class="text-right"><fmt:formatNumber type="number"
										minFractionDigits="2">${elemento.produto.valor}
								</fmt:formatNumber></td>
								<td class="text-center">${elemento.quantidade}</td>
								<td class="text-center"><a
									href="${linkTo[CarrinhoController].remover()}${incremento-1}"><span
										class="glyphicon glyphicon-trash"></span></a></td>
								<td class="text-right"><fmt:formatNumber type="number"
										minFractionDigits="2">${elemento.produto.valor * elemento.quantidade}</fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row text-right">
			<strong>TOTAL: <fmt:formatNumber type="number"
					minFractionDigits="2">${sessionCart.carrinho.total}</fmt:formatNumber>
			</strong>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajax-formulario-venda.js"></script>
</body>
</html>