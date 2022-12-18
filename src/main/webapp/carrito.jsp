<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.util.ArrayList" %>
 <%@page import="javax.servlet.http.HttpSession"%>
 <%@page import="models.productosVO"%>
 <%@page import="models.carritosDAO"%>
  <%@page import="models.marcasDAO"%>
   <%@page import="models.usersDAO"%>
  <%@page import="models.usersVO"%>
<meta charset="ISO-8859-1">
<title>carrito</title>
<link
      href="./css/style-PagPrincipal.css"
      type="text/css"
      rel="stylesheet"
    />
    <script src="https://kit.fontawesome.com/d68ea4c36b.js" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="./css/navbar.css" />
    <link rel="stylesheet" href="./css/header.css" />
    <link rel="stylesheet" href="./css/divs.css" />
    <link rel="stylesheet" href="./css/animaciones.css" />
    <link rel="stylesheet" href="./css/register.css" />
    <link rel="stylesheet" href="./css/carrito.css" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>

    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"

    />
<script src="https://kit.fontawesome.com/f029291172.js" crossorigin="anonymous"></script>
    <link rel="icon" href="Resources/LogoTfg.png" />
    
</head>
<body>
  <%Cookie[] cookies=request.getCookies();
String email="",pass="";
if (cookies != null) {
     for (Cookie cookie : cookies) {
       if (cookie.getName().equals("cookieLoginEmail")) {
           email=cookie.getValue();
       }
       if(cookie.getName().equals("cookieLoginPasswd")){
           pass=cookie.getValue();
       }
    }
} 
Boolean iniciadoSesion = false;
	if(email.equals("")){response.sendRedirect("login.jsp");}else {iniciadoSesion = true;};




usersVO user = null;
user = usersDAO.buscarUsuarioPorEmail(email);



String idCarrito;
idCarrito = carritosDAO.buscarCarritoPorEmail(email);
ArrayList<productosVO> productos = new ArrayList<productosVO>();
productos = carritosDAO.listaProductosPorIdCarrito(idCarrito);
productosVO producto;
float precioTotal = 0;

%>
    <!-- Barra lateral-->
    <div>
      <div class="sidebar close">
        <ul class="nav-links">
          <li>
            <div class="home-content">
              <div class="botonMenu">
                <i class="bx bx-menu"></i>
              </div>
            </div>
          </li>

          <li class="iconico">
            <a
              href="index.jsp"
            >
              <img
                src="Resources/LogoTfg.png"
                class="iconosNav"
                alt="LogoTFG"
              />
              <span class="link_name">Inicio</span>
            </a>
            <ul class="sub-menu blank">
              <li>
                <a
                  class="link_name"
                  href="https://educacionadistancia.juntadeandalucia.es/centros/cadiz/"
                  >Inicio</a
                >
              </li>
            </ul>
          </li>
          
		<li class="iconico">
            <a href="ServletBuscarPorCategoria?categoria=8">
              <img
                src="Resources/ofertas.png"
                class="iconosNav"
                alt="IconoRRSS"
              />
              <span class="link_name">Ofertas</span>
            </a>
            <ul class="sub-menu blank">
              <li><a class="link_name" href="ServletBuscarPorCategoria?categoria=8">Ofertas</a></li>
            </ul>
          </li>
          <li class="iconico">
            <div class="iocn-link">
              <a href="buscador.jsp">
                <img
                  src="Resources/lupa.png"
                  class="iconosNav"
                  alt="IconoBuscador"
                />
                <span class="link_name">Buscador</span>
              </a>
            </div>
            <ul class="sub-menu">
              <li><a class="link_name" href="buscador.jsp">Buscador</a></li>
            </ul>
          </li>

          <li class="iconico">
            <div class="iocn-link">
              <a href="sobreNosotros.jsp">
                <img
                  src="https://i.ibb.co/vB1NQ0N/AMPA.png"
                  class="iconosNav"
                  alt="IconoSobreNosotros"
                />
                <span class="link_name">Sobre Nosotros</span>
              </a>
            </div>
            <ul class="sub-menu">
              <li><a class="link_name" href="sobreNosotros.jsp">Sobre Nosotros</a></li>
            </ul>
          </li>

          

          <li class="iconico">
            <a href="carrito.jsp">
              <img
                src="Resources/carrito.png"
                class="iconosNav"
                alt="IconoContacto"
              />
              <span class="link_name">Carrito</span>
            </a>
            <ul class="sub-menu blank">
              <li><a class="link_name" href="carrito.jsp">Carrito</a></li>
            </ul>
          </li>

           <li class="iconico">
            <div class="iocn-link">
              <a href="login.jsp">
                <img
                <%if(iniciadoSesion){
                %>
                src="<%if(usersDAO.getImgBlobPorEmail(email) != "nofoto"){
                    	out.print("data:image/png;base64," + usersDAO.getImgBlobPorEmail(email));
                    }else{
                    	out.print(user.getFoto());
                    }
                    %>"
                <%	
                }else{
                %>src="Resources/login.png"
                <%
                }%>
                  
                  class="iconosNav"
                  alt="IconoLogin"
                />
                <span class="link_name"><%if(iniciadoSesion){
                %>
                Perfil
                <%}else{
                %>
                Iniciar sesión / Registrarse
                <%} %>
                </span>
              </a>
            </div>
            <ul class="sub-menu">
              <li><a class="link_name" href="login.jsp"><%if(iniciadoSesion){
                %>
                Perfil
                <%}else{
                %>
                Iniciar sesión / Registrarse
                <%} %></a></li>
            </ul>
          </li>

          <li class="iconico">
            <a>
              <img
                src="Resources/traduccion.png"
                class="iconosNav"
                alt="IconoAdmin"
              />
              <span class="link_name"><div class="link_name" id="google_translate_element" style=""></div></span>
            </a>
            <ul class="sub-menu blank">
              <li><span class="link_name" style="color:white">Traductor</span></li>
            </ul>
          </li>
        </ul>
      </div>
      <script>
        let arrow = document.querySelectorAll(".arrow");
        for (var i = 0; i < arrow.length; i++) {
          arrow[i].addEventListener("click", (e) => {
            let arrowParent = e.target.parentElement.parentElement; //selecting main parent of arrow
            arrowParent.classList.toggle("showMenu");
          });
        }
        let sidebar = document.querySelector(".sidebar");
        let sidebarBtn = document.querySelector(".bx-menu");
        console.log(sidebarBtn);
        sidebarBtn.addEventListener("click", () => {
          sidebar.classList.toggle("close");
        });
      </script>
    </div>

<section class=" h-custom" style="background-color: #d2c9ff;margin-left:78px; padding-bottom:200px; height:100%;padding:-15px;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
          <div class="card-body p-0">
            <div class="row g-0">
              <div class="col-lg-8">
                <div class="p-5">
                  <div class="d-flex justify-content-between align-items-center mb-5">
                    <h1 class="fw-bold mb-0 text-black">Carrito de la compra</h1>
                    <h6 class="mb-0 text-muted"><%=email %></h6>
                  </div>
                  
                  <%for(int i = 0; i<productos.size();i++){
                	  producto = productos.get(i);
                	  precioTotal = precioTotal + (producto.getPrecio()*producto.getCantidad());
                	  
                	  %>
                  
                  
                  <hr class="my-4">

                  <div class="row mb-4 d-flex justify-content-between align-items-center">
                    <div class="col-md-2 col-lg-2 col-xl-2">
                      <img
                        src="<%=producto.getImagenString() %>"
                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h6 class="text-muted"><%=marcasDAO.buscarMarcaPorId(producto.getMarcas_idMarcas()) %></h6>
                      <h6 class="text-black mb-0"><a style="text-decoration:none; color:black;"href="producto.jsp?id=<%=producto.getIdProductos()%>"><%=producto.getNombre() %></a></h6>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                      
						<h6 class="mb-0">Cantidad: <%=producto.getCantidad()%></h6>
                      
                    </div>
                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                      <h6 class="mb-0"><%=producto.getPrecio() * producto.getCantidad()%>$</h6>
                    </div>
                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                    <form action="ServletDeleteFromCarrito" method="POST">
                      <button type="submit" style="border:none; background-color:white; padding:3px; color:red"><i class="fa-regular fa-trash-can"></i></button>
                      
                      <input type="hidden" name="idProducto" value="<%=producto.getIdProductos()%>">
                      <input type="hidden" name="email" value="<%=email%>">
                      </form>
                    </div>
                  </div>
<%} %>

                 <!-- ---------------------------------------------------------------------------------------------- -->

                  <hr class="my-4">

                  <div class="pt-5">
                    <h6 class="mb-0"><a href="buscador.jsp" class="text-body"><i
                          class="fas fa-long-arrow-alt-left me-2"></i>Volver a la tienda</a></h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 bg-grey">
                <div class="p-5">
                  <h3 class="fw-bold mb-5 mt-2 pt-1">Resumen</h3>
                  <hr class="my-4">

                  <div class="d-flex justify-content-between mb-4">
                    <h5 class="text-uppercase"><%=productos.size() %> productos: </h5>
                    <h5><%=precioTotal %>$</h5>
                  </div>

                	<h5 class="text-uppercase mb-3">Código promocional</h5>

                  <div class="mb-5">
                    <div class="form-outline">
                      <input type="text" id="form3Examplea2" class="form-control form-control-lg" placeholder="Introduce el código"/>
                    </div>
                  </div>

                  <hr class="my-4">
                  <div class="d-flex justify-content-between mb-5">
                    <h5 class="text-uppercase">Precio total</h5>
                    <h5><%=precioTotal %>$</h5>
                  </div>
					<form action="CCheckout" method="POST" > 
						<button type="submit" class="btn btn-dark btn-block btn-lg" data-mdb-ripple-color="dark">Terminar Compra</button>
					</form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="footer">
      <div class="footer-banner">
        <img
          src="Resources/yo.jpg"
          style="   width: 140px;
				    height: 100px;
				    margin-left: 0px;
				    margin-right: 20px;
				    border-radius:60%;"
          alt="Banner Yo"
        />
        Página Web realizada por Alberto Ramírez como proyecto final del Grado Superior DAW cursado en:
      </div>
      <div class="footer-contenido">
        <span class="textoFooter"
          >IES Mar de Cádiz. Avenida de Rafael Alberti s/n. El Puerto de Santa
          María. Tfn:657526022<br />
          <a href="https://seneca.juntadeandalucia.es/seneca/jsp/portal/"
            >Seneca</a
          >|
          <a href="https://www.juntadeandalucia.es/educacion/pasen/">Pasen</a> |
          <a href="http://www.juntadeandalucia.es/">Junta de Andalucia</a> |
          <a href="http://www.juntadeandalucia.es/educacion/"
            >Consejería de Educación</a
          >
          
		</span>
      </div>
      <div class="footer-logo">
        <img
          src="https://i.ibb.co/SdKpjFc/junta-andalucia-logo.png"
          class="logoJunta"
          alt="Logo Junta de Andalucia"
        />
      </div>
    </div>
</body>
</html>