<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion Eventos</title>
<%@ page import="java.util.ArrayList" %>
 <%@page import="javax.servlet.http.HttpSession"%>
 <%@page import="models.eventosVO"%>
 <%@page import="models.eventosDAO"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
 <script src="https://kit.fontawesome.com/d68ea4c36b.js" crossorigin="anonymous"></script>
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
          <a class="nav-link active" aria-current="page">Eventos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminMarcas.jsp">Marcas</a>
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
		/*
			String sesionIniciadaAdmins = null;
			if(sesion.getAttribute("sesionIniciadaAdmins") != null){
				sesion.setAttribute("sesionIniciadaAdmins", "1");
			}
			if(!sesionIniciadaAdmins.equals("1")){
				response.sendRedirect("loginAdmin.jsp");
			}
		*/
		ArrayList<eventosVO> eventos = new ArrayList<eventosVO>();
		eventos = eventosDAO.listaEventos();
		eventosVO evento = null;
%>






<div style="width:100%; padding-top:100px;">

<form action="ServletAddEvento" method="post" style="background-color:whitesmoke; display: flex; padding:10px align-items: center; justify-content: center; border: 2px solid black; border-radius:10px">
<input type="text" name="nombre" placeholder="nombre" style="margin:10px;">
<input type="text" name="descripcion" placeholder="descripcion" style="margin:10px;">
<input type="time" name="horaInicio" style="margin:10px;">
<input type="time" name="horaFinal" style="margin:10px;">
<input type="date" name="fecha" style="margin:10px;">
<input type="text" name="categoria" placeholder="categoria" style="margin:10px;">
<input type="text" name="image" placeholder="image" style="margin:10px;">
<button type="submit" style="margin:10px;">Añadir</button>
</form>
<table id="eventos" class="table table-striped" class="table" style="width:100%">
        <thead>
            <tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Descripcion</th>
				<th>HoraInicio</th>				
				<th>HoraFinal</th>				
				<th>Fecha</th>				
				<th>Categoria</th>				
				<th>Imagen</th>				
				<th>Editar</th>				
				<th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
         <%
for(int i = 0; i < eventos.size();i++){
	evento = eventos.get(i);
	%>
	<tr>
	<form action="ServletEditEvento" method="post">
		<td><input type="text" value="<%=evento.getIdEvento()%>" disabled><p hidden="true"><%=evento.getIdEvento()%></td>
		<td><input type="text" name="nombre" value="<%=evento.getNombre()%>"><p hidden="true"><%=evento.getNombre()%></p></td>
		<td><input type="text" name="descripcion" value="<%=evento.getDescripcion()%>"></td>
		<td><input type="time" name="horaInicio" value="<%=evento.getHoraInicio()%>"></td>
		<td><input type="time" name="horaFinal" value="<%=evento.getHoraFinal()%>"></td>
		<td><input type="date" name="fecha" value="<%=evento.getFecha()%>"></td>
		<td><input type="text" name="categoria" value="<%=evento.getCategoria()%>"><p hidden="true"><%=evento.getCategoria()%></td>
		<td><input type="text" name="image" value="<%=evento.getImage()%>"></td>
		<input type="hidden" name="idEvento" value="<%=evento.getIdEvento()%>">
				<td><button type="submit" style="border:none; background-color:transparent; padding:3px; color:green"><i class="fa-regular fa-pen-to-square"></i></button></td>

	</form>
	<form action="ServletDeleteEvento" method="post">
		<input type="hidden" name="idEvento" value="<%=evento.getIdEvento()%>">
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
				<th>HoraInicio</th>				
				<th>HoraFinal</th>				
				<th>Fecha</th>				
				<th>Categoria</th>				
				<th>Imagen</th>				
				<th>Editar</th>				
				<th>Eliminar</th>
            </tr>
        </tfoot>
    </table>
    </div>
    <script>

$(document).ready(function () {
    $('#eventos').DataTable({
        "language": {
            "lengthMenu":    "Mostrar _MENU_ registros por página",
            "zeroRecords":    "No se encuentran registros",
            "info":            "Mostrando la página _PAGE_ de _PAGES_",
            "infoEmpty":    "No existen registros",
            "infoFiltered":    "(Filtrado de _MAX_ registros totales)",
            "emptyTable":    "No existen registros en la base de datos",
            "search":        "Buscar:",
            "paginate": {
                "first":      "Primero",
                "last":       "Último",
                "next":       "Siguiente",
                "previous":   "Anterior"
            },
        }
    });
});
</script>
</body>
</html>