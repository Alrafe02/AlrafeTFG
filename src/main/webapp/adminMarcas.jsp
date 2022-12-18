<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestor de marcas</title>
<%@ page import="java.util.ArrayList" %>
 <%@page import="javax.servlet.http.HttpSession"%>
 <%@page import="models.marcasVO"%>
 <%@page import="models.marcasDAO"%>
 <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
 <script src="https://kit.fontawesome.com/d68ea4c36b.js" crossorigin="anonymous"></script>
<style type="text/css">
html,
body,
.intro {
  height: 100%;
}

table td,
table th {
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}

.card {
  border-radius: .5rem;
}

.table-scroll {
  border-radius: .5rem;
}

thead {
  top: 0;
  position: sticky;
}
</style>
</head>
<body>
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
          <a class="nav-link active" aria-current="page">Marcas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminEventos.jsp">Eventos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminCategorias.jsp">Categorias</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminProductos.jsp">Productos</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
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
	<% 
		HttpSession sesion = request.getSession();

			ArrayList<marcasVO> marcas = new ArrayList<marcasVO>();
			marcas = marcasDAO.listaMarcas();
			marcasVO marca = null;
	%>
	
	
	<div style="width:100%; padding:200px;">
	<form action="ServletAddMarca" method="post" style="background-color:whitesmoke; padding:10px; display: flex; align-items: center; justify-content: center; border: 2px solid black; border-radius:10px">
	<input type="text" name="nombre" placeholder="nombre" style="margin:10px;">
	<input type="text" name="descripcion" placeholder="descripcion" style="margin:10px;">
	<input type="text" name="imagenString" placeholder="imagen" style="margin:10px;">
	<button type="submit" style="margin:10px;" >A�adir</button>
	</form>
	<div style="">
	<table id="eventos" class="table table-striped" class="table" style="width:100%;">
        <thead>
            <tr>
				<th>ID</th>	
				<th>Nombre</th>	
				<th>Descripcion</th>	
				<th>Imagen</th>	
				<th>Editar</th>	
				<th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
        <%
	for(int i = 0; i < marcas.size();i++){
		marca = marcas.get(i);
		%>
		<tr>
		<form action="ServletEditMarca" method="post">
		
			<td><input type="text" value="<%=marca.getIdMarcas()%>" disabled><p hidden="true"><%=marca.getIdMarcas()%></td>
			<td><input type="text" name="nombre" value="<%=marca.getNombre()%>"><p hidden="true"><%=marca.getNombre()%></td>
			<td><input type="text" name="descripcion" value="<%=marca.getDescripcion()%>"></td>
			<td><input type="text" name="imagenString" value="<%=marca.getImagenString()%>"></td>
			<input type="hidden" name="idMarcas" value="<%=marca.getIdMarcas()%>">
					<td><button type="submit" style="border:none; background-color:transparent; padding:3px; color:green"><i class="fa-regular fa-pen-to-square"></i></button></td>

		</form>
		<form action="ServletDeleteMarca" method="post">
			<input type="hidden" name="idMarcas" value="<%=marca.getIdMarcas()%>">
					<td><button type="submit" style="border:none; background-color:transparent; padding:3px; color:red"><i class="fa-regular fa-trash-can"></i></button></td>

		</form>
		</tr>
		<%
		
	}
	%>
    </tbody>
        <tfoot>
            <tr>
                <th>ID</th>	
				<th>Nombre</th>	
				<th>Descripcion</th>	
				<th>Imagen</th>	
				<th>Editar</th>	
				<th>Eliminar</th>
            </tr>
        </tfoot>
    </table>   
    </div> 
        </div>
        <script>

$(document).ready(function () {
    $('#eventos').DataTable({
        "language": {
            "lengthMenu":    "Mostrar _MENU_ registros por p�gina",
            "zeroRecords":    "No se encuentran registros",
            "info":            "Mostrando la p�gina _PAGE_ de _PAGES_",
            "infoEmpty":    "No existen registros",
            "infoFiltered":    "(Filtrado de _MAX_ registros totales)",
            "emptyTable":    "No existen registros en la base de datos",
            "search":        "Buscar:",
            "paginate": {
                "first":      "Primero",
                "last":       "�ltimo",
                "next":       "Siguiente",
                "previous":   "Anterior"
            },
        }
    });
});
</script>
	
</body>
</html>