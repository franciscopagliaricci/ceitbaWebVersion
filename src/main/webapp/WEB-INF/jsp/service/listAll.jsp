<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<!--  TODO: fix relative paths problem in header!!! -->
<%@ include file="../template/headGeneral.jsp"%>
</head>

<body>

	<div class="container">
		<%@ include file="upperMenu.jsp"%>

		<!-- Jumbotron -->
		<div class="jumbotron">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span2">
						<%@ include file="sideMenu.jsp"%>
					</div>
					<div class="span10">
						<form class="form-search" action="listAll" method="get" name="search">
							<input type="text" class="input-medium search-query" placeholder="Filtrar resultados" name="search"/>
							<button type="submit">
								<i class="icon-search"></i>
							</button>
						</form>
						<table class="table table-striped pull-right">
							<thead>
								<tr>
									<th>Nombre</th>
									<th>Precio</th>
									<th>Estado</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="service" items="${services.elements}"
									varStatus="rowCounter">
									<tr>
										<td>${service.name}</td>
										<td>${service.value}</td>
										<td>${service.status}</td>
										<td><a href="update?id=${service.id}"><i class="icon-edit"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="row-fluid">
							<div class="span4">
								<c:if test="${services.actualPage > 1}">
									<a href="listAll?page=${services.actualPage-1}&search=${searchParam}&list=${list}"> 
										<button class="btn-large">Anterior</button> 
									</a>
								</c:if>
							</div>
							<div class="span4">
								<h3> Pagina ${services.actualPage} de ${services.totalPage} </h3>
							</div>
							<div class="span4">
								<c:if test="${services.actualPage < services.totalPage}">
									<a href="listAll?page=${services.actualPage+1}&search=${searchParam}&list=${list}"> 
										<button class="btn-large">Siguiente</button> 
									</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer">
			<p>CEITBA 2014</p>
		</div>

	</div>

</body>
</html>

