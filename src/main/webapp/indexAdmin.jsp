<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio Admin</title>
 <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
</head>
<body>
<%Cookie[] cookies=request.getCookies();
String name="",pass="";
if (cookies != null) {
     for (Cookie cookie : cookies) {
       if (cookie.getName().equals("cookieLoginUser")) {
           name=cookie.getValue();
       }
       if(cookie.getName().equals("cookieLoginPassword")){
           pass=cookie.getValue();
       }
    }
} 
	if(name.equals(""))response.sendRedirect("loginAdmin.jsp");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="indexAdmin.jsp">Inicio</a>
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarNav"
      aria-controls="navbarNav"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="adminCategorias.jsp">Categorias</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminEventos.jsp">Eventos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminMarcas.jsp">Marcas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminProductos.jsp">Productos</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div style="text-align:center; margin-top:200px">
<h1>¡Bienvenid@ a la parte de Administracion!</h1>
<br>
<a href="index.jsp" style="text-decoration:none; color:black">Volver a la página Web</a>
</div>


</body>
</html>