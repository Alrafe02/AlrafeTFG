<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head >
<%@ page import="java.util.ArrayList" %>
 <%@page import="javax.servlet.http.HttpSession"%>
 <%@page import="models.usersDAO"%>
  <%@page import="models.usersVO"%>
 <%@page import="models.*"%>
<meta charset="ISO-8859-1">
<title>Perfil personal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link rel="stylesheet" href="./css/perfil.css" />
	 <link
      href="./css/style-PagPrincipal.css"
      type="text/css"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./css/navbar.css" />
        <link rel="stylesheet" href="./css/login.css" />
    <!-- Libreria animaciones-->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>

    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />

    <link rel="icon" href="Resources/LogoTfg.png" />
</head>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

<body style="background-color:lightgrey;">
<%
HttpSession sesion = request.getSession();
Cookie[] cookies=request.getCookies();
String email="",pass="";
Boolean iniciadoSesion = false;
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
	if(email.equals("")){response.sendRedirect("login.jsp");}else {iniciadoSesion = true;};



	usersVO user = null;
	user = usersDAO.buscarUsuarioPorEmail(email);
	String idCarrito;
	idCarrito = carritosDAO.buscarCarritoPorEmail(email);
	ArrayList<productosVO> productos = new ArrayList<productosVO>();
	productos = carritosDAO.listaProductosPorIdCarrito(idCarrito);
	
	if(sesion.getAttribute("editado") != null) if(sesion.getAttribute("editado").equals("si")){
		sesion.setAttribute("editado", "no");
		%>
		<script>
			M.toast({html: 'Editado con éxito!'})
		</script>
		<%
	}
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

  <div class="main-content" style="margin-left:78px">
    <!-- Top navbar -->
    
    <!-- Header -->
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 500px; background-image: url(https://www.pixelstalk.net/wp-content/uploads/images6/Magic-The-Gathering-Wallpaper-HD-Free-download.jpg); background-size: cover; background-position: center top;">
      <!-- Filtro para la imagen del fondo (Mask)-->
      <span class="mask bg-gradient-default opacity-6"></span>
      <!-- Header container -->
    </div>
    <!-- Page content -->
    <div class="container-fluid" Style="margin-top:-300px">
      <div class="row">
        <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
          <div class="card card-profile shadow">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">

                    <img src="
                    <%if(usersDAO.getImgBlobPorEmail(email) != "nofoto"){
                    	out.print("data:image/png;base64," + usersDAO.getImgBlobPorEmail(email));
                    }else{
                    	out.print(user.getFoto());
                    }
                    %>
                    " class="rounded-circle">
                </div>
              </div>
            </div>
            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
              <div class="d-flex justify-content-between">
                <a href="carrito.jsp" class="btn btn-sm btn-info mr-4">Ver el Carrito</a>
                <a href="ServletPDFPedido" class="btn btn-sm btn-default float-right">Último pedido</a>
              </div>
            </div>
            <div class="card-body pt-0 pt-md-4">
              <div class="row">
                <div class="col">
                  <div class="card-profile-stats d-flex justify-content-center mt-md-5">
                    <div>
                      <span class="heading"><%=productos.size() %></span>
                      <span class="description">P.Carrito</span>
                    </div>
                    <div>
                      <span class="heading">0</span>
                      <span class="description">Pedidos</span>
                    </div>
                    <div>
                      <span class="heading">0</span>
                      <span class="description">Reseñas</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="text-center">
                <h3>
                  <%=user.getNombre() %> <%=user.getApellidos() %><span class="font-weight-light">, <%=user.getFechaNac() %></span>
                </h3>
                <div class="h5 font-weight-300">
                  <i class="ni location_pin mr-2"></i><%=user.getCiudad() %>, <%=user.getPaisNac() %>
                  <i class="ni business_briefcase-24 mr-2"></i>Género: <%=user.getGenero() %>
                </div>
                <div>
                  <i class="ni education_hat mr-2"></i><%=user.getEmail() %>
                </div>
         
                <hr class="my-4">
                     <form action="ServletAddImg" method="post" enctype="multipart/form-data"> 
                     <div>
      						<label> Cambiar foto de perfil: </label> 
      						<input type="file" name="photo" size="50" class="btn btn-sm btn-info mr-4" />
    				 </div>
    				 <hr class="my-4">
     						<input type="submit" class="btn btn-sm btn-info mr-4" value="Guardar">
     				</form>
              </div>
            </div>
          </div>
        </div>
                              <%
                        String[] emailRoto = user.getEmail().split("@");
                        String usuario = emailRoto[0]; // 123
 
                        %>
        <div class="col-xl-8 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                <div class="col-8">
                  <h1 class="mb-0">
                  <%
                  if(user.getGenero().equals("Femenino")){
                  %>
                  Bienvenida, <%=usuario %>
                  <%
                  }else{
                  %>
                  Bienvenido, <%=usuario %>
                  <%
                  }
                  %>
                  </h1>
                </div>
                <div class="col-4 text-right">
                  <form action="ServletEditUser" method="POST">
                	<button type="button" onclick="activarEdit()" id="editar" class="btn btn-sm btn-primary">Editar</button>
                	<button type="submit" id="guardar" class="btn btn-success" style="background-color:green; color:White">Guardar</button>
                	<input type="hidden" id="name" value="<%=user.getNombre()%>" name="name"/>
                	<input type="hidden" id="surname" value="<%=user.getApellidos() %>" name="surname"/>
                	<input type="hidden" id="address" value="<%=user.getDireccion() %>" name="address"/>
                	<input type="hidden" id="city" value="<%=user.getCiudad() %>" name="city"/>
                	<input type="hidden" id="country" value="<%=user.getPaisNac() %>" name="country"/>
                	<input type="hidden" id="codpostal" value="<%=user.getCodPostal() %>" name="codpostal"/>
                	<input type="hidden" id="email" value="<%=email %>" name="email"/>
                </form>
                </div>
                <script>
                $( document ).ready(function() {
                	 $('#guardar').hide()
                });
					function activarEdit(){
						  $('#input-first-name').prop("disabled", false); // Element(s) are now enabled.
						  $('#input-last-name').prop("disabled", false);
						  $('#input-address').prop("disabled", false);
						  $('#input-city').prop("disabled", false);
						  $('#input-country').prop("disabled", false);
						  $('#input-postal-code').prop("disabled", false);

						  $('#editar').hide();

						  $('#guardar').show()
						  
					}



						 function myChangeFunctionName(input1) {
						    var input2 = document.getElementById('name');
						    input2.value = input1.value;
						  }
						 function myChangeFunctionSurname(input1) {
							    var input2 = document.getElementById('surname');
							    input2.value = input1.value;
							  }
						 function myChangeFunctionAddress(input1) {
							    var input2 = document.getElementById('address');
							    input2.value = input1.value;
							  }
						 function myChangeFunctionCity(input1) {
							    var input2 = document.getElementById('city');
							    input2.value = input1.value;
							  }
						 function myChangeFunctionCountry(input1) {
							    var input2 = document.getElementById('country');
							    input2.value = input1.value;
							  }
						 function myChangeFunctionCodPostal(input1) {
							    var input2 = document.getElementById('codpostal');
							    input2.value = input1.value;
							  }

				</script>	
              </div>
            </div>
            <div class="card-body">
              
                <h6 class="heading-small text-muted mb-4">Detalles del Usuario:</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-username">Usuario</label>

                        <input type="text" id="input-username" class="form-control form-control-alternative" placeholder="Username" value="<%=usuario %>" disabled>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Email </label>
                        <input type="email" id="input-email" class="form-control form-control-alternative" placeholder="<%=user.getEmail() %>" value="<%=user.getEmail() %>" disabled>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-first-name">Nombre</label>
                        <input type="text" onchange="myChangeFunctionName(this)" id="input-first-name" class="form-control form-control-alternative" placeholder="First name" value="<%=user.getNombre() %>" disabled>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name" disabled>Apellidos</label>
                        <input type="text" id="input-last-name" onchange="myChangeFunctionSurname(this)" class="form-control form-control-alternative" placeholder="Last name" value="<%=user.getApellidos() %>" disabled>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4">
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">Información de Contacto</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-address">Dirección</label>
                        <input id="input-address" onchange="myChangeFunctionAddress(this)" class="form-control form-control-alternative" placeholder="Home Address" value="<%=user.getDireccion() %>" type="text" disabled>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-city">Ciudad</label>
                        <input type="text" id="input-city" onchange="myChangeFunctionCity(this)" class="form-control form-control-alternative" placeholder="City" value="<%=user.getCiudad() %>" disabled>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-country">País</label>
                        <input type="text" id="input-country"  onchange="myChangeFunctionCountry(this)" class="form-control form-control-alternative" placeholder="Country" value="<%=user.getPaisNac() %>" disabled>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-country">Cod. Postal</label>
                        <input type="number" id="input-postal-code" onchange="myChangeFunctionCodPostal(this)" class="form-control form-control-alternative" placeholder="<%=user.getCodPostal() %>" disabled>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4">
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">Sobre mi</h6>
                <div class="pl-lg-4">
                  <div class="form-group focused">
                    <label>Creo q lo voy a quitar, lo dejo por si acaso</label>
                    <textarea rows="4" class="form-control form-control-alternative" placeholder="Escribe sobre tí ..."></textarea>
                  </div>
                </div>
              
            </div>
          </div>
        </div>
      </div>
      
    </div>
    
  </div>
  
  <footer style="margin:40px"> 
    <div class="row align-items-center justify-content-xl-between">
      <div class="col-xl-6 m-auto text-center">
        <!--	
        <div class="copyright">
          <p>Made with <a href="https://www.creative-tim.com/product/argon-dashboard" target="_blank">Argon Dashboard</a> by Creative Tim</p>
        </div> 
         -->
      	<a href="ServletCerrarSesion">Cerrar sesión</a>
      </div>
    </div>
  </footer>
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