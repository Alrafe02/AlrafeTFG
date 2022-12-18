<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
if(!email.equals(""))iniciadoSesion = true;




usersVO user = null;
user = usersDAO.buscarUsuarioPorEmail(email);



String idCarrito;
idCarrito = carritosDAO.buscarCarritoPorEmail(email);
ArrayList<productosVO> productos = new ArrayList<productosVO>();
productos = carritosDAO.listaProductosPorIdCarrito(idCarrito);
productosVO producto;
float precioTotal = 0;

%>
  <% Object[][] articulos=null;
if(request.getAttribute("articulos")==null)
	 //articulos = (Object[][]) request.getAttribute("articulos"); 
	 %>
    <title>Datos de pedido</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="./img/logo.svg" />
    <link rel="stylesheet" type="text/css"
	href="./css/checkout.css"/>
    <script src="https://polyfill.io/v3/polyfill.min.js?version=3.52.1&features=fetch"></script>
    <script src="https://js.stripe.com/v3/"></script>
  </head>
  <body>
    <section>
    <%	for(int i = 0;i< productos.size();i++){ 
			producto = productos.get(i);	%>
      <div class="product">
        <img alt="No tiene imagen" onerror="this.src='<%=producto.getImagenString() %>';" src='<%=producto.getImagenString() %>' width="100" height="100">
        <div class="description">
          <h3><%=producto.getNombre()%></h3>
          <h5><%=producto.getPrecio()%> €</h5>
        </div>
      </div>
      <%  }%>
      <form action="/TFG_Alrafe/CCheckout" method="POST">
        <button type="submit" id="checkout-button">Checkout</button>
      </form>
    </section>
  </body>
</html>