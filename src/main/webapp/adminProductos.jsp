<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestor de Productos</title>
<%@ page import="java.util.ArrayList" %>
 <%@page import="javax.servlet.http.HttpSession"%>
 <%@page import="models.productosVO"%>
 <%@page import="models.productosDAO"%>
 <%@page import="models.categoriasVO"%>
 <%@page import="models.categoriasDAO"%>
 <%@page import="models.marcasVO"%>
 <%@page import="models.marcasDAO"%>
 <script src="https://kit.fontawesome.com/d68ea4c36b.js" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
 
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
          <a class="nav-link active" aria-current="page">Productos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminEventos.jsp">Eventos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminCategorias.jsp">Categorias</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminMarcas.jsp">Marcas</a>
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

		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		productos = productosDAO.listaProductos();
		productosVO producto = null;
		ArrayList<marcasVO> marcas = new ArrayList<marcasVO>();
		marcas = marcasDAO.listaMarcas();
		marcasVO marca = null;
		ArrayList<categoriasVO> categorias = new ArrayList<categoriasVO>();
		categorias = categoriasDAO.listaCategorias();
		categoriasVO categoria = null;
%>

<%
if(sesion.getAttribute("editado") != null) if(sesion.getAttribute("editado").equals("si")){
			sesion.setAttribute("editado", "no");
			%>
			<br><span style="color:green">Producto editado correctamente</span>
			<%
		}
	%>
<%		if(sesion.getAttribute("eliminado") != null) if(sesion.getAttribute("eliminado").equals("si")){
			sesion.setAttribute("eliminado", "no");
			%>
			<br><span style="color:red">Producto eliminado correctamente</span>
			<%
		}
	%>
<div style="width:100%; padding-top:100px;">

<form action="ServletAddProducto" method="post" style="background-color:whitesmoke; display: flex; align-items: center; justify-content: center; border: 2px solid black; border-radius:10px; padding:10px">
<input type="text" name="nombre" placeholder="nombre" style="margin:10px;">
<input type="text" name="descripcion" placeholder="descripcion" style="margin:10px;">
<input type="number" name="precio" step="0.01"  style="margin:10px;">
<input type="text" name="imagenString" placeholder="imagen" style="margin:10px;">
<select name="marca" style="margin:10px;">
<option value="0" selected> </option>
<%
for(int m = 0; m < marcas.size();m++){
	marca = marcas.get(m);
%>
<option value="<%=marca.getIdMarcas()%>"><%=marca.getNombre()%></option>
<% 
}
%>
</select>
<select name="categoria" style="margin:10px;">
<option value="0" selected> </option>
<%
for(int c = 0; c < categorias.size();c++){
	categoria = categorias.get(c);
%>
<option value="<%=categoria.getIdCategorias()%>"><%=categoria.getNombre()%></option>
<% 
}
%>
</select>
<input type="checkbox" name="destacado" style="margin:10px;">
<button type="submit" style="margin:10px;">Añadir</button>
</form>
	<div style="">
	<table id="eventos" class="table table-striped" class="table" style="width:100%;">
        <thead>
            <tr>
<th>ID</th>

<th>Nombre</th>

<th>Descripcion</th>

<th>Precio</th>

<th>Imagen</th>

<th>Marca</th>

<th>Categoria</th>

<th>Destacado</th>

<th>Editar</th>

<th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
        <%
for(int i = 0; i < productos.size();i++){
	producto = productos.get(i);
	%>
	<tr>
	<form action="ServletEditProductos" method="post">
		<td><input type="text" value="<%=producto.getIdProductos()%>" disabled></td>
		<td><input type="text" name="nombre" value="<%=producto.getNombre()%>"></td>
		<td><input type="text" name="descripcion" value="<%=producto.getDescripcion()%>"></td>
		<td><input type="number" step="0.01" name="precio" value="<%=producto.getPrecio()%>"></td>
		<td><input type="text" name="imagenString" value="<%=producto.getImagenString()%>"></td>
<td><select name="marca">
<%

for(int m = 0; m < marcas.size();m++){
	marca = marcas.get(m);
%>
<option value="<%=marca.getIdMarcas()%>"<%if(marca.getIdMarcas() == producto.getMarcas_idMarcas())out.print("selected");%>><%=marca.getNombre()%></option>
<% 
}
%>
</select></td>
<td><select name="categoria">
	<%

for(int c = 0; c < categorias.size();c++){
	categoria = categorias.get(c);
%>
<option value="<%=categoria.getIdCategorias()%>"<%if(categoria.getIdCategorias() == producto.getCategorias_idCategorias())out.print("selected");%>><%=categoria.getNombre()%></option>
<% 
}
%>
</select></td>
		<td><input type="checkbox" name="destacado"<%if(producto.isDestacado()) out.print("checked");%>></td>
		<input type="hidden" name="idProductos" value="<%=producto.getIdProductos()%>">
		<td><button type="submit" style="border:none; background-color:transparent; padding:3px; color:green"><i class="fa-regular fa-pen-to-square"></i></button></td>
	</form>
	<form action="ServletDeleteProducto" method="post">
		<input type="hidden" name="idProductos" value="<%=producto.getIdProductos()%>">
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

<th>Precio</th>

<th>Imagen</th>

<th>Marca</th>

<th>Categoria</th>

<th>Destacado</th>

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