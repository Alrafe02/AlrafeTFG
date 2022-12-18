package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.LineItem;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

import models.*;




@WebServlet("/CCheckout")
public class CCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;
	Connection conexion;



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		if(!email.equals("")) {
			iniciadoSesion = true;
		} else {
			response.sendRedirect("login.jsp");
		}

		String idCarrito;
		idCarrito = carritosDAO.buscarCarritoPorEmail(email);
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		productos = carritosDAO.listaProductosPorIdCarrito(idCarrito);
		productosVO producto;
		List<com.stripe.param.checkout.SessionCreateParams.LineItem> lista = new ArrayList<com.stripe.param.checkout.SessionCreateParams.LineItem>();
		for(int i = 0; i<productos.size();i++) {
			producto = productos.get(i);
			String precio = String.valueOf(producto.getPrecio())+"0";
			precio = precio.replace(".", "");
			System.out.println(precio);
			long precioLong = Long.parseLong(precio);
			long cantidad = (long) producto.getCantidad();
			lista.add( SessionCreateParams.LineItem.builder()
					.setPriceData(SessionCreateParams.LineItem.PriceData.builder().setCurrency("eur")
							.setUnitAmount(precioLong)
							.setProductData(SessionCreateParams.LineItem.PriceData.ProductData.builder()
									.setName(producto.getNombre()).setDescription(producto.getDescripcion()).build())
							.build())
					.setQuantity(cantidad).build());
		}
		
		
			Stripe.apiKey = "sk_test_51M8LMbDPnpMPrdK2ERdXeEfkt9zyzbIF1iUprDH8THaJk51Mw0g0cnA2VWLaTfC9hexwJa8wY2d9KeRHkNpoTnvQ00JpvUL8jG";

			String YOUR_DOMAIN = "http://localhost:8080/TFG_Alrafe/CCheckout";
			SessionCreateParams params = SessionCreateParams.builder()
					.addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
					.addAllLineItem(lista)

					
					.setMode(SessionCreateParams.Mode.PAYMENT).setSuccessUrl("http://localhost:8080/TFG_Alrafe/success.html")
					.setCancelUrl("http://localhost:8080/TFG_Alrafe/ServletCancelStripe").build();

			try {
				Session session = Session.create(params);
				response.sendRedirect(session.getUrl());
			} catch (StripeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

}
