<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
 <link
      href="./css/style-PagPrincipal.css"
      type="text/css"
      rel="stylesheet"
    />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./css/navbar.css" />
    <link rel="stylesheet" href="./css/header.css" />
    <link rel="stylesheet" href="./css/divs.css" />
    <link rel="stylesheet" href="./css/animaciones.css" />
        <link rel="stylesheet" href="./css/register.css" />
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
      <%@page import="models.usersDAO"%>
       <%@page import="models.usersVO"%>
</head><%
Cookie[] cookies=request.getCookies();
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
if(!email.equals(""))iniciadoSesion = true;

usersVO user = null;
user = usersDAO.buscarUsuarioPorEmail(email);
%>
<body>
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
<section class="h-100 bg-dark" style="margin-left:78px">
  <div class="container py-5 h-100" >
  <form action="ServletRegister" method="post" class="validatedForm">
  
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img4.webp"
                alt="Sample photo" class="img-fluid"
                style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
            </div>
            <div class="col-xl-6">
              <div class="card-body p-md-5 text-black">
                <h3 class="mb-5 text-uppercase">Registro de Usuario</h3>

                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input required type="text" id="form3Example1m" name="nombre" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Example1m">Nombre</label>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input required type="text" id="form3Example1n" name="apellidos" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Example1n">Apellidos</label>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input required type="text" id="form3Example1m1" name="ciudad" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Example1m1">Ciudad</label>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input required type="text" id="form3Example1n1" name="pais" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Example1n1">Pais</label>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input required type="text" id="form3Example1n1" name="codPostal" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Example1n1">Cod. Postal</label>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input required type="date" id="form3Example1n1" name="fechaNac" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Example1n1">Fecha Nacimiento</label>
                    </div>
                  </div>
                </div>

                <div class="form-outline mb-4">
                  <input required type="text" id="form3Example8" name="direccion" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example8">Direccion</label>
                </div>

                <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">

                  <h6 class="mb-0 me-4">Género: </h6>

                  <div class="form-check form-check-inline mb-0 me-4">
                    <input required class="form-check-input" type="radio" name="genero" id="femaleGender"
                      value="Femenino" />
                    <label class="form-check-label" for="femaleGender">Femenino</label>
                  </div>

                  <div class="form-check form-check-inline mb-0 me-4">
                    <input required class="form-check-input" type="radio" name="genero" id="maleGender"
                      value="Masculino" />
                    <label class="form-check-label" for="maleGender">Masculino</label>
                  </div>

                  <div class="form-check form-check-inline mb-0">
                    <input required class="form-check-input" type="radio" name="genero" id="otherGender"
                      value="Otro" />
                    <label class="form-check-label" for="otherGender">Otro</label>
                  </div>

                </div>
                <div class="form-outline mb-4">
                  <input required type="email" id="form3Example9" name="email" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example9">Email</label>
                </div>

                <div class="form-outline mb-4">
                  <input required type="password" id="form3Example90" name="passwd" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example90">Contraseña</label>
                </div>

                <div class="form-outline mb-4">
                  <input required type="password" id="form3Example99" name="passwd2" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example99">Confirmar Contraseña</label>
                  <span id="uno"></span>
                  <span id="uno"></span>
                </div>


                <div class="d-flex justify-content-end pt-3">
                  <button type="submit" class="btn btn-warning btn-lg ms-2">Registrarse</button>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </form>
  </div>
</section>
<script>
$(document).ready(function () {
   $("#form3Example99").on('keyup', function(){
    var password = $("#form3Example90").val();
    var confirmPassword = $("#form3Example99").val();
    if (password != confirmPassword)
        $("#uno").html("La contraseña no coincide").css("color","red");
    else
        $("#uno").html("Contraseña correcta").css("color","green");
   });
});
</script>

	
</body>
</html>