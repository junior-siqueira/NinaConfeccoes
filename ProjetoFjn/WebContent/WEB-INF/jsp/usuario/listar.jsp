<jsp:include page="../index/menu.jsp">
	<jsp:param value="Lista de Usu�rios" name="title" />
</jsp:include>
</head>
<body>
	<div class="container">
		<legend>Lista de Usu�rios Cadastrados</legend>
		<div class="row">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Listagem</div>
				<!-- Table -->
				<table class="table">
					<tr>
						<td>${incremento}</td>
						<td>${usuario.nome}</td>
						<td>${usuario.pass}</td>
						<td><span class="glyphicon glyphicon-pencil"></span></td>
						<td><span class="glyphicon glyphicon-trash"></span></td>
					</tr>
					<tbody>

						<c:forEach items="${listarUsuarios}" var="usuario">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${usuario.nome}</td>
								<td>${usuario.pass}</td>
								<td><span class="glyphicon glyphicon-pencil"></span></td>
								<td><a
									href="${linkTo[usuarioController].deletar(usuario.id)}"><span
										class="glyphicon glyphicon-trash"></span></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<%@include file="../index/footer.jsp"%>
</body>
</html>