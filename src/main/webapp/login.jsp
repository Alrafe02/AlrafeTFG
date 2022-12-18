<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
 <link
      href="./css/style-PagPrincipal.css"
      type="text/css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./css/navbar.css" />
    <link rel="stylesheet" href="./css/header.css" />
    <link rel="stylesheet" href="./css/divs.css" />
    <link rel="stylesheet" href="./css/animaciones.css" />
        <link rel="stylesheet" href="./css/login.css" />
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
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link rel="icon" href="Resources/LogoTfg.png" />
      <%@page import="models.usersDAO"%>
       <%@page import="models.usersVO"%>
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
	if(!email.equals(""))response.sendRedirect("perfil.jsp");
	Boolean iniciadoSesion = false;
	if(!email.equals(""))iniciadoSesion = true;




	usersVO user = null;
	user = usersDAO.buscarUsuarioPorEmail(email);

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
<section class="vh-100" style="background-color: #212529;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
                <form action="ServletLogIn" method="post" >
                  <div class="d-flex align-items-center mb-3 pb-1">
                    <span class="h1 fw-bold mb-0"><img src="Resources/LogoTfg.png" style="width:60px; height:60px"></span>
                  </div>
                  
                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Iniciar Sesión</h5>
                  <div class="form-outline mb-4">
                    <input type="email" name="email" id="form2Example17" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example17">Email</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" name="password" id="form2Example27" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example27">Contraseña</label>
                  </div>

                  <div class="pt-1 mb-4">
                    <button type="submit" class="btn btn-dark btn-lg btn-block">Iniciar Sesión</button>
                  </div>

                  <a class="small text-muted" href="#!">¿Olvidaste la Contraseña?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">¿No tienes cuenta?  <a href="register.jsp"
                      style="color: #393f81;">¡Registrate!</a></p>
                  <a href="https://www.cookiepolicygenerator.com/live.php?token=BoiY9hiCfv3fv5yWY33fUGGPV7KTcSzF" class="small text-muted">Política de Cookies</a>
                </form>

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