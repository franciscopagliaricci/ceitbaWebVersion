		<%@ include file="../template/loginBar.jsp"%>
		<div class="masthead">
			<h3 class="muted">SiBaDaC</h3>
			<div class="navbar">
				<div class="navbar-inner">
					<div class="container">
						<ul class="nav">
							<c:if test="${!basicUser}">
								<li><a href="../person/listAll">Usuarios</a></li>
								<li><a href="../service/listAll">Servicios</a></li>
							</c:if>
							<c:if test="${!basicUser}">
								<li class="active"><a href="listAll">Pagos</a></li>
								<li><a href="../billing/listNewEnrollments">Facturacion</a></li>
								<li><a href="../user/update">Perfil</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
