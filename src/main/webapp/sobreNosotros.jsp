<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
  <%@ page import="java.util.ArrayList" %>
 <%@page import="javax.servlet.http.HttpSession"%>
 <%@page import="models.eventosVO"%>
 <%@page import="models.usersVO"%>
  <%@page import="models.usersDAO"%>
 <%@page import="models.eventosDAO"%>
  <%@page import="models.productosVO"%>
 <%@page import="models.productosDAO"%>
 
    <title>Sobre Nosotros</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Links -->
    <link rel="stylesheet" href="./css/eventos.css" />
    <link
      href="./css/style-PagPrincipal.css"
      type="text/css"
      rel="stylesheet"
    />
    
    <link rel="stylesheet" href="./css/navbar.css" />
    <link rel="stylesheet" href="./css/productos.css" />
    <link rel="stylesheet" href="./css/header.css" />
    <link rel="stylesheet" href="./css/sobreNosotros.css" />
    <link rel="stylesheet" href="./css/divs.css" />
    <link rel="stylesheet" href="./css/animaciones.css" />
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
    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

     <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  </head>
<script type="text/javascript">
function googleTranslateElementInit() {
    new google.translate.TranslateElement(
      {
        pageLanguage: "es",
        layout:
          google.translate.TranslateElement.InlineLayout.SIMPLE,
        autoDisplay: false,
        includedLanguages: "",
      },
      "google_translate_element"
    );
  }
</script>
  <body>
  
  <%
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
  <% 
	HttpSession sesion = request.getSession();
  
  	sesion.setAttribute("buscarPorNombre", null);
  	sesion.setAttribute("buscarPorCategoria", 0);
  	sesion.setAttribute("buscarPorMarca", 0);
  
		ArrayList<eventosVO> eventos = new ArrayList<eventosVO>();
		eventos = eventosDAO.listaEventos();
		eventosVO evento = null;
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		productos = productosDAO.listaProductos();
		productosVO producto = null;
		
	
		
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

   
    <!-- Enlaces -->
    <div id="divOfertaEducativa" style="background-color:white">
	<div class="container py-2" id="">
		<div class="text-center" style="margin-left:78px; margin-top: -50px">
        <h2 class="tituloFormulario" >Sobre Nosotros</h2>
        <br>
<div class="container">
    <div class="row text-center">
        <div class="col-md-6">
<div style="width: 100%"><iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=es&amp;q=Paseo%20de%20las%20delicias%2041+(Tienda%20Alrafe)&amp;t=h&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"><a href="https://www.gps.ie/car-satnav-gps/">Car GPS</a></iframe></div>        </div>
        <div class="col-md-6" style="font-size:18px; text-align:justify; padding-left:50px; padding-right:50px">
        <br>
            <p><strong>Tienda Alrafe </strong> es un nuevo proyecto llevado a cabo por un grupo de amigos de la infancia. Este idea fue pensada hace muchos años en la época en la que estaban en el instituto, pensándolo como un sueño/idea de futuro. Desde el año 2022 esta idea se hizo realidad y pudieron fundar el negocio pese a las dificultades de ser autónomo en estas épocas. Hoy dia estamos muy contentos del inicio de esta empresa y os damos las gracias a todos nuestros clientes.</p>
            
        </div>
    </div>
</div>
        
      </div>
	</div>
</div>

    <div id="divOfertaEducativa" >
	<div class="container py-2" id="">
		<div class="text-center" style="margin-left:78px;">
        <h2 class="tituloFormulario" >Nuestro equipo</h2>

<div class="container">
    <div class="row text-center">

        <!-- Team item -->
        <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="Resources/yo.jpg" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                <h5 class="mb-0">Alberto Ramírez</h5><span class="small text-uppercase text-muted">CEO - Fundador</span>
                <ul class="social mb-0 list-inline mt-3">
                    <li class="list-inline-item"><a href="https://facebook.com" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                    <li class="list-inline-item"><a href="https://twitter.com/Alrafe02" class="social-link"><i class="fa fa-twitter"></i></a></li>
                    <li class="list-inline-item"><a href="https://instagram.com/alrafe_02" class="social-link"><i class="fa fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="https://linkedin.com/alrafe" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div><!-- End -->

        <!-- Team item -->
        <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="Resources/DanielMartinezCoFounder.jpeg" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                <h5 class="mb-0">Daniel Martínez</h5><span class="small text-uppercase text-muted">Co-Fundador</span>
                <ul class="social mb-0 list-inline mt-3">
                    <li class="list-inline-item"><a href="https://facebook.com" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                    <li class="list-inline-item"><a href="https://twitter.com/ralferios" class="social-link"><i class="fa fa-twitter"></i></a></li>
                    <li class="list-inline-item"><a href="https://instagram.com/ertserV2" class="social-link"><i class="fa fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="https://linkedin.com/ertser" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div><!-- End -->

        <!-- Team item -->
        <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="Resources/PaulaRecioRRHH.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                <h5 class="mb-0">Paula Recio</h5><span class="small text-uppercase text-muted">Jefa de RRHH</span>
                <ul class="social mb-0 list-inline mt-3">
                    <li class="list-inline-item"><a href="https://facebook.com" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                    <li class="list-inline-item"><a href="https://twitter.com/iampaulix" class="social-link"><i class="fa fa-twitter"></i></a></li>
                    <li class="list-inline-item"><a href="https://instagram.com/paulix.molax" class="social-link"><i class="fa fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="https://linkedin.com/Paulix" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div><!-- End -->

        <!-- Team item -->
        <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="Resources/megamind.jpg" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                <h5 class="mb-0">Megamind Gummi</h5><span class="small text-uppercase text-muted">Becario importante</span>
                <ul class="social mb-0 list-inline mt-3">
                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div>
        <!-- End -->
    </div>

</div>
      </div>
	</div>

      
      
      
    </div>

    
    <div id="divFormulario">
    <div class="card shadow rounded-3 my-auto" style="margin:200px; margin-left:278px;">
        <div class="card-header p-3 h4">
            Contacte con nosotros!
        </div>
        <div class="card-body p-4">
            <form action="ServletContacto" method="POST" class="row">
                <div class="form-group col-lg-4">
                    <label class="form-control-label" for="form-group-input">Nombre</label>
                    <input type="text" class="form-control" id="form-group-input" name="nombre">
                </div>
                <div class="form-group col-lg-4">
                    <label class="form-control-label" for="form-group-input">Email</label>
                    <input type="text" class="form-control" id="form-group-input" name="email">
                </div>
                <div class="form-group col-lg-4">
                    <label class="form-control-label" for="form-group-input">Motivo</label>
                    <select size="0" class="form-control" name="motivo">
                        <option value="Informacion">Informacion</option>
                        <option value="Empleo">Empleo</option>
                        <option value="Soporte Técnico">Soporte Técnico</option>
                    </select>
                </div>
                <div class="form-group col-lg-12">
                    <label class="form-control-label" for="form-group-input">Mensaje</label>
                    <input type="text" class="form-control" id="form-group-input" name="mensaje" ></input>
                </div>
                <div class="form-group col-lg-12">
                    <button class="btn btn-warning float-end mt-2" for="form-group-input">Enviar</button>
                </div>
                	<%if(sesion.getAttribute("toast")!= null){
		%>


                 <div class="form-group col-lg-12">
                    <label class="form-control-label" for="form-group-input" style="color:lightgreen">Mensaje enviado correctamente!</label>
                    
                </div>
                		<%
                		sesion.setAttribute("toast", null);
	}
		
%>
            </form>
        </div>
    </div>
    </div>

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

    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
      AOS.init();
    </script>
    <!-- Animacion JQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

  </body>
</html>
