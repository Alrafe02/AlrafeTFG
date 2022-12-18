<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn | Admin</title>
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
</head>
<body>
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
                alt="Icono Moodle"
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
            <div class="iocn-link">
              <a href="#">
                <img
                  src="Resources/lupa.png"
                  class="iconosNav"
                  alt="Icono Noticias"
                />
                <span class="link_name">Buscador</span>
              </a>
            </div>
            <ul class="sub-menu">
              <li><a class="link_name" href="#">Buscador</a></li>
            </ul>
          </li>

          <li class="iconico">
            <div class="iocn-link">
              <a href="#">
                <img
                  src="https://i.ibb.co/vB1NQ0N/AMPA.png"
                  class="iconosNav"
                  alt="Icono Sobre Nosotros"
                />
                <span class="link_name">Sobre Nosotros</span>
              </a>
            </div>
            <ul class="sub-menu">
              <li><a class="link_name" href="#">Sobre Nosotros</a></li>
            </ul>
          </li>

          <li class="iconico">
            <a href="#">
              <img
                src="Resources/RRSS.png"
                class="iconosNav"
                alt="Icono Ampa"
              />
              <span class="link_name">RRSS</span>
            </a>
            <ul class="sub-menu blank">
              <li><a class="link_name" href="#">RRSS</a></li>
            </ul>
          </li>

          <li class="iconico">
            <a href="#">
              <img
                src="https://i.ibb.co/xXFPVSc/empleo.png"
                class="iconosNav"
                alt="Icono Biblioteca"
              />
              <span class="link_name">Contacto</span>
            </a>
            <ul class="sub-menu blank">
              <li><a class="link_name" href="#">Contacto</a></li>
            </ul>
          </li>

          <li class="iconico">
            <div class="iocn-link">
              <a href="#">
                <img
                  src="Resources/login.png"
                  class="iconosNav"
                  alt="Icono Impresora"
                />
                <span class="link_name">Iniciar sesión / Registrarse</span>
              </a>
            </div>
            <ul class="sub-menu">
              <li><a class="link_name" href="#">Iniciar sesión / Registrarse</a></li>
            </ul>
          </li>

          <li class="iconico">
            <a href="#">
              <img
                src="Resources/admin.png"
                class="iconosNav"
                alt="Icono jardines"
              />
              <span class="link_name">Administración</span>
            </a>
            <ul class="sub-menu blank">
              <li><a class="link_name" href="#">Administracion</a></li>
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

                <form action="ServletLogInAdmin" method="post" >

                  <div class="d-flex align-items-center mb-3 pb-1">

                    <span class="h1 fw-bold mb-0">Parte de administración</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Iniciar Sesión | Admin</h5>

                  <div class="form-outline mb-4">
                    <input type="text" name="usuario" id="form2Example17" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example17">Usuario</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" name="password" id="form2Example27" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example27">Contraseña</label>
                  </div>

                  <div class="pt-1 mb-4">
                    <button type="submit" class="btn btn-dark btn-lg btn-block">Iniciar Sesión</button>
                  </div>

                  <a class="small text-muted" href="#!">¿Olvidaste la Contraseña?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">¿No tienes cuenta?  <a href="#!"
                      style="color: #393f81;">¡Registrate!</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Section: Design Block -->
</body>
</html>