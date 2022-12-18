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
 <style>
@import url('https://fonts.cdnfonts.com/css/aileron');
</style>
 
    <title>Tienda Alrafe</title>
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
    <div id="loader"></div>

<a href="https://api.whatsapp.com/send?phone=34657526022&text=Hola%21%20Quisiera%20hacerles%20una%20pregunta%20sobre%20...%20" class="float" target="_blank">
<i class="fa fa-whatsapp my-float"></i>
</a>
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
              <li><a class="link_name" href="sobreNosotros.jsp">Sobre Nosotros / Contacto</a></li>
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

    <!-- Header -->
    <div id="divHeader">
      <div class="contenedorHeader">
        <img
          class="img imgFondo"
          id="fondo"
          src="https://st4.depositphotos.com/20453466/27122/i/450/depositphotos_271228964-stock-photo-photo-set-for-the-game.jpg"
          alt="FotoMagig"
        />
      </div>


        <!--
              <div class="logo-details">
                  <a href="./index.html"><img src="images/iconopaloma.png" style="width:65px; height:60px; margin-left: 9px; margin-top: 25px; border-radius: 15px;"></a>
                <span class="logo_name" onclick="location.href='./index.html'"style="cursor: pointer; padding-left: 15px; padding-top: 25px; align-self: center; ">  Mar de Cádiz</span>
              </div>
            -->
        >
        <br>
        <div class="tituloPrincipal" style="margin: auto; width: 50%; padding: 10px; justify-content:center" >TIENDA ALRAFE</div>
     <br>
     <div class="tituloPrincipal" style="margin: auto; width: 50%; padding: 10px; justify-content:center" >
      <img
          style="width: 250px;
  height: 150px;
  filter: drop-shadow(5px 5px 10px white);"
          src="Resources/LogoTfg.png"
          alt="Logo Tienda Alrafe"
        />
        </div>
      </div>
      
                      
      <div class="logoHeaderContainer">
        <div>
          <div class="video">
          
            <!--  <iframe
              allowfullscreen
              style="border: none"
              src="video/videoInicio.mp4"
              width="640"
              height="360"
            ></iframe>
            -->
          </div>
        </div>

      </div>


    <!-- Enlaces -->
    <div id="divEnlaces">
      <h2 class="h2Enlaces">Búsqueda por categoría</h2>
      <div class="enlaces">
        <div
          data-aos="fade-up"
          data-aos-delay="200"
          class="btn-acceso-rapido enlace1"
          onclick="location.href='ServletBuscarPorCategoria?categoria=4'"
          style="cursor: pointer; height:auto; padding-bottom:30px"
        >
          Juegos de Mesa <br />
          <img
            class="img"
            src="Resources/mesa.png"
            alt="IconoJuegosDeMesa"
          />
        </div>
        <div
          data-aos="fade-up"
          data-aos-delay="500"
          class="btn-acceso-rapido enlace2"
          onclick="location.href='ServletBuscarPorCategoria?categoria=5'"
          style="cursor: pointer; height:auto; padding-bottom:30px"
        >
          Juegos de Cartas <br />
          <img
            class="img"
            src="Resources/cartas.png"
            alt="IconoCartas"
          />
        </div>
        <div
          data-aos="fade-up"
          data-aos-delay="800"
          class="btn-acceso-rapido enlace3"
          onclick="location.href='ServletBuscarPorCategoria?categoria=6'"
          style="cursor: pointer; height:auto; padding-bottom:30px"
        >
          Merchandising <br />
          <img
            class="img"
            src="Resources/merchandising.png"
            alt="IconoMerchandising"
          />
        </div>
        <div
          data-aos="fade-up"
          data-aos-delay="1100"
          class="btn-acceso-rapido enlace3"
          onclick="location.href='ServletBuscarPorCategoria?categoria=7'"
          style="cursor: pointer; height:auto; padding-bottom:30px"
        >
          Comics/Libros <br />
          <img
            class="img"
            src="Resources/libro.png"
            alt="IconoComics"
          />
        </div>
      </div>
    </div>

    <!-- Noticias -->
    <div id="divNoticias" style="margin-left:78px;">
      <h2 class="h2Enlaces">Productos destacados</h2>
      <div class="container" style="margin-top:50px;">
      <div class="row">
      <%for(int p = 0; p < productos.size();p++) {
    	  producto = productos.get(p);
    	if(producto.isDestacado()){
    	  %>
      
      
        
            <div class="col-md-3">
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
                        <%=producto.getPrecio() %>€
                    </div>
                    <a href="producto.jsp?id=<%=producto.getIdProductos()%>" class="card-button"> Comprar</a>
                </div>
            </div>
        
      
    
<%}} %>
</div> 
</div>
    </div>
    <div id="divOfertaEducativa" >
	<div class="container py-2" id="">
		<div class="text-center" style="margin-left:78px;">
        <h2 class="tituloFormulario" >Eventos disponibles</h2>
        <p>
          En nuestro local ofrecemos una amplia serie de eventos en los que
          podrá apuntarse...
        </p>
      </div>
		<%
for(int i = 0; i < eventos.size();i++){
	evento = eventos.get(i);
	%>
		<article class="postcard light blue" style="margin-left:78px">
			<a class="postcard__img_link" href="#">
				<img class="postcard__img" src="<%=evento.getImage() %>" alt="Image Title" />
			</a>
			<div class="postcard__text t-dark">
				<h1 class="postcard__title "><a href="#"><%=evento.getNombre() %></a></h1>
				<div class="postcard__subtitle small">
					<time datetime="2020-05-25 12:00:00">
						<i class="fas fa-calendar-alt mr-2"></i><%=evento.getFecha() %>
					</time>
				</div>
				<div class="postcard__bar"></div>
				<div class="postcard__preview-txt"><%=evento.getDescripcion() %></div>
				<ul class="postcard__tagbox">
					<li class="tag__item"><i class="fas fa-clock mr-2"></i><%=evento.getCategoria() %></li>
					<li class="tag__item"><i class="fas fa-clock mr-2"></i><%=evento.getHoraInicio()%> - <%=evento.getHoraFinal() %></li>
					<li class="tag__item"><i class="fas fa-clock mr-2"></i>Registro por WhatsApp o por Email</li>
				</ul>
			</div>
		</article>
		
<%
}
%>

	</div>

      
      
      
    </div>

    
    <div id="divFormulario">
    <!-- Formulario 
      <div class="text-center">
        <h2 class="tituloFormulario">Formulario de Contacto</h2>
        <p style="margin-left: 72px">
          Rellene este formulario para ponerse en contacto con el centro, en
          cuanto uno de nuestro personal esté disponible le contactará de
          inmediato
        </p>
      </div>
      <form action="#" class="justify-content-center">
        <div class="inputsFormulario">
          <input type="text" placeholder="Nombre" class="form1" />
          <input type="email" placeholder="E-mail" class="form2" />
          <input type="text" placeholder="Telefono" class="form3" />
        </div>
        <div class="botonFormulario">
          <button>Enviar</button>
        </div>
      </form>
      -->
      <div id="insta">
      <div class="powr-instagram-feed" id="d233058d_1669239232"></div><script src="https://www.powr.io/powr.js?platform=html"></script>
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
    <script>
      $(window).on("load", function () {
        $("#loader").delay(500).fadeOut("slow");
      });
    </script>
  </body>
</html>
