<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Cliente</title>

<style>
    body { background: #f5f6fa; font-family: 'Segoe UI', sans-serif; }
    .card-product {
        border: none;
        border-radius: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        transition: 0.3s;
    }
    .card-product:hover { transform: scale(1.02); }
    .product-img {
        border-radius: 20px 20px 0 0;
        height: 200px;
        object-fit: cover;
        width: 100%;
    }
</style>

</head>

<body>

    <nav class="navbar navbar-light bg-white shadow-sm mb-4 p-3">
        <div class="container-fluid">
        <img src="imagenes/recyclon.png" 
                 alt="Logo" 
                 style="height: 50px;" 
                 class="me-3">
            <h3 class="fw-bold">Hola, ${usuario.nombre } ${usuario.apellidos}</h3>
            <a href="login" class="btn btn-outline-primary">Volver</a>
        </div>
    </nav>

    <div class="container">

        <!-- Categorías -->
        <div class="card shadow-sm p-4 mb-4">
            <h4 class="mb-3 text-primary">Categorías</h4>
            <form action="ControladorRecyclon" method="get">
                <input type="hidden" name="accion" value="filtrar">
                <select class="form-select" name="cat" id="cat" onchange="this.form.submit()">
                    <option value="">Seleccione...</option>
                    <c:forEach var="c" items="${categorias}">
                        <option value="${c.id}"
                          <c:if test="${param.cat == c.id}">selected="selected"</c:if>>
                          ${c.nombre}
                        </option>
                    </c:forEach>
                </select>
                
            </form>
        </div>
        <!-- Lista Pedidos -->
        <div class="accordion mb-3" id="accordionExample">
                    <div class="accordion-item ">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button gap-2" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapseOne">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5zM3 3H2v1h1z"/>
								  <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1z"/>
								  <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5zM2 7h1v1H2zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm1 .5H2v1h1z"/>
								</svg> Lista Pedidos
                            </button>
                        </h2>
                        <div id="collapse1" class="accordion-collapse collapse show" aria-labelledby="heading1"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                             <table class="table table-hover">
				                <thead class="table-light">
				                    <tr>
				                        <th>#</th>
				                        <th>Fecha</th>
				                        <th>Estado</th>
				                    </tr>
				                </thead>
				                <tbody>
				                    <c:forEach var="p" items="${usuario.pedidos}">
				                    <tr>
				                        <td>${p.id}</td>
				                        <td><fmt:formatDate value="${p.fechaPedido }"/> </td>
				                        <td>${p.estado}</td>
				                    </tr>
				                    </c:forEach>
		                		</tbody>
		           			 </table>
                            </div>
                        </div>
                    </div>
               </div>
      				

        <!-- Catálogo -->
        <c:if test="${empty productoscat}">
            <div class="alert alert-info text-center">No hay productos de esta categoría</div>
        </c:if>
        
        <c:if test="${not empty productoscat}">
        	<h4 class="text-primary mb-3">Catálogo</h4>
		</c:if>
        

        <div class="row g-4">
        <c:forEach var="p" items="${productoscat}">
            <div class="col-md-4">
                <div class="card card-product">

<%--                     <img src="<c:out value='${p.foto}'/>" --%>
<!--                          onerror="this.src='https://via.placeholder.com/300x200?text=Sin+Foto'" -->
<!--                          class="product-img" alt="img/productos/"> -->

                    <div class="card-body">
                        <h5 class="fw-bold">${p.nombre}</h5>
                        <p class="text-muted">${p.descripcion}</p>
                        <p class="fw-semibold">Categoría: ${p.categoria.nombre}</p>
                        <p class="text-success fw-bold gap-3">
                            <fmt:formatNumber value="${p.precioUnitario}" type="currency" currencySymbol="€"/>
                           
                            <select value="stock" name="stock">  <!-- ??????????????????? no se como leches pasarle esto al controller -->
		                        <c:forEach var="i" begin="1" end="10">
		                        <option value="${i}">${i}</option>
		                    	</c:forEach>
                    		</select>
                        </p>
                        
                        <a href="ControladorRecyclon?accion=comprar&id=${p.id}" class="btn btn-primary w-100">
                            Comprar
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
