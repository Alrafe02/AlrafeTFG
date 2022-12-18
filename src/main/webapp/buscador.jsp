<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 <head>
<%@ page import="java.util.ArrayList" %>
 <%@page import="javax.servlet.http.HttpSession"%>
 <%@page import="models.productosVO"%>
 <%@page import="models.productosDAO"%>
 <%@page import="models.categoriasVO"%>
 <%@page import="models.categoriasDAO"%>
 <%@page import="models.marcasVO"%>
 <%@page import="models.marcasDAO"%>
  <%@page import="models.usersVO"%>
    <%@page import="models.usersDAO"%>
    <title>Buscador</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Links -->
    <link
      href="./css/style-PagPrincipal.css"
      type="text/css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./css/navbar.css" />
    <link rel="stylesheet" href="./css/productos.css" />
    <link rel="stylesheet" href="./css/header.css" />
    <link rel="stylesheet" href="./css/eventos.css" />
    <link rel="stylesheet" href="./css/divs.css" />
    <link rel="stylesheet" href="./css/animaciones.css" />
    <link rel="stylesheet" href="./css/productos2.css" />
    <!-- Libreria animaciones-->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>

    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="icon" href="Resources/LogoTfg.png" />

    <!--SEO-->
    <meta
      name="description"
      content="Página prinicipal del TFG de Alberto Ramírez donde se simula una tienda online"
    />
    <meta
      name="keywords"
      content="Tienda, TFG, JS, CSS, HTML, JSP"
    />
    <meta
      name="author"
      content="Alberto Ramírez Fernández"
    />
    <meta name="robots" content="index" />

    <!-- Verificacion por Google -->
    <meta
      name="google-site-verification"
      content="z1nc-gpMVsrnaEV0XmShLRBagzF795Z8VlzYGwCfiTk"
    />
    <style>
    .hide{
    display:none;
    }
    .show {
    display:block;
    }
    #hideText_btns {
    background-color: #a6d3a0;
    border: black 2px solid;
    border-radius:40px;
    color:black;
    padding: 10px 20px;
    font-size: 1.2em;
    box-shadow: 0px 0px 10px 0px #a6d3a0;
    cursor: pointer;
    width: 200px;
    text-align: center;
    margin-top: 20px;
    margin-bottom: 30px;
    float:right;
    }
    #hideText_btns:hover{
    box-shadow: none;
    background-color: #808782;
    color:whitesmoke;
    transition: cubic-bezier(0.075, 0.82, 0.165, 1)
    
    }
    </style>
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

%>
<% 
	HttpSession sesion = request.getSession();
	String buscarPorNombre = null;
	if(sesion.getAttribute("buscarPorNombre") != null){
		buscarPorNombre = (String)sesion.getAttribute("buscarPorNombre");
	}
	int buscarPorCategoria = 0;
	if(sesion.getAttribute("buscarPorCategoria") != null){
		buscarPorCategoria = (int)sesion.getAttribute("buscarPorCategoria");
	}
	int buscarPorMarca = 0;
	if(sesion.getAttribute("buscarPorMarca") != null){
		buscarPorMarca = (int)sesion.getAttribute("buscarPorMarca");
	}
/*
		String sesionIniciadaAdmins = null;
		if(sesion.getAttribute("sesionIniciadaAdmins") != null){
			sesion.setAttribute("sesionIniciadaAdmins", "1");
		}
		if(!sesionIniciadaAdmins.equals("1")){
			response.sendRedirect("loginAdmin.jsp");
		}
		*/
		%>
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		
		<script>
		$( document ).ready(function() {
		<%
		
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		if(buscarPorNombre != null){
			productos = productosDAO.listaProductosPorNombre(buscarPorNombre);
		} else if(buscarPorCategoria == 0){
			productos = productosDAO.listaProductos();
			%>
			$('#cat option[value="0"]').attr("selected", "selected");
			<%
		}else if(buscarPorCategoria != 0){
			if(buscarPorCategoria == 8){
				productos = productosDAO.listaProductosDestacados();
				%>
				$('#cat option[value="8"]').attr("selected", "selected");
				<%
			}else{
				productos = productosDAO.listaProductosPorCategoria(buscarPorCategoria);
				%>
				$('#cat option[value="<%=buscarPorCategoria%>"]').attr("selected", "selected");
				<%

			}
		}
		
		
		else if(buscarPorMarca == 0){
			productos = productosDAO.listaProductos();
			%>
			$('#mar option[value="0"]').attr("selected", "selected");
			<%
		}
		else if(buscarPorMarca != 0){
			productos = productosDAO.listaProductosPorMarca(buscarPorMarca);
			%>
			$('#mar option[value="<%=buscarPorMarca%>"]').attr("selected", "selected");

			<%
		}else{
			productos = productosDAO.listaProductos();
		}
		
		productosVO producto = null;

		ArrayList<marcasVO> marcas = new ArrayList<marcasVO>();
		marcas = marcasDAO.listaMarcas();
		marcasVO marca = null;
		
		ArrayList<categoriasVO> categorias = new ArrayList<categoriasVO>();
		categorias = categoriasDAO.listaCategorias();
		categoriasVO categoria = null;
		
		Boolean iniciadoSesion = false;
		if(!email.equals(""))iniciadoSesion = true;




		usersVO user = null;
		user = usersDAO.buscarUsuarioPorEmail(email);
		
		%>
		});
</script>
<!-- Barra lateral-->
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
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #A6D3A0; align-items:center; padding:20px">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarNav" style="justify-content:center;">
      <ul class="navbar-nav" style="text-align:center; display:flex ">
        <li class="nav-item" style="padding:20px">
          <form action="ServletBuscarPorMarca" method="post">
		    	Marca:
			    <select name="marca" id="mar" onchange="this.form.submit()">
				<option value="0" selected>Todos</option>
				<%
				for(int m = 0; m < marcas.size();m++){
					marca = marcas.get(m);
				%>
				<option value="<%=marca.getIdMarcas()%>"><%=marca.getNombre()%></option>
				<% 
				}
				%>
				</select>
			</form>
        </li>
        <li class="nav-item" style="padding:20px">
          <form action="ServletBuscarPorCategoria" method="post">
				Categoria:
				<select name="categoria" id="cat" onchange="this.form.submit()">
					<option value="0" selected>Todos</option>
					<%
						for(int c = 0; c < categorias.size();c++){
							categoria = categorias.get(c);
					%>
							<option value="<%=categoria.getIdCategorias()%>"><%=categoria.getNombre()%></option>
					<% 
						} 
					%>
				</select>
			</form>
        </li>
        <li class="nav-item" style="padding:20px">
        
          <form action="ServletBuscarPorNombre" method="post"> 
          Nombre:
				<input type="text" name="nombre" id="buscarNombre">

        </li>
        <li class="nav-item" style="padding:20px">
        				<button type="submit">Buscar</button>
			</form>
        </li>
      </ul>
    </div>
  </div>
</nav>
      <div class="container" style="margin-top:50px; text-align:center; margin-bottom:100px">
      <div class="row" style="margin-left:78px">
      <%for(int p = 0; p < productos.size();p++) {
    	  producto = productos.get(p);
			
    	  %>
             
             <%if(p >= 8){
            	 	 %> 
             <div class="hide" id="divHide">
             <%} %>
            <div id="<%=p%>" class="col-md-3" style="margin-top:80px;">
                <div class="card-sl">
                    <div class="card-image">
                        <img style="width:100%; height:90%"
                            src="<%=producto.getImagenString() %>" />
                    </div>

            
                    <div class="card-heading">
                        <%=producto.getNombre() %>
                    </div>
                    <div class="card-text">
                        <%=producto.getDescripcion() %>
                    </div>
                    <div class="card-text">
                        <%=producto.getPrecio() %>$
                    </div>
                    <a href="producto.jsp?id=<%=producto.getIdProductos()%>" class="card-button"> Comprar</a>
                </div>
            </div>
        
      <%if(p >= 8){
            	 	 %> 
             </div>
             <%} %>
<%} %>
<%if(productos.size() > 7)  {%>
<button id="hideText_btns">Ver más</button>
<%} %>
</div> 
</div>
<script>
let hideText_btn = document.getElementById("hideText_btns");
let hideText = document.getElementById("divHide");
hideText_btn.addEventListener("click", toggleText);
function toggleText(){
	hideText.classList.toggle("show");
	
	if(hideText.classList.contains("show")){
		hideText_btn.innerHTML = "Mostrar menos"
	} else {
		hideText_btn.innerHTML = "Ver más"
	}
}

</script>
    
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