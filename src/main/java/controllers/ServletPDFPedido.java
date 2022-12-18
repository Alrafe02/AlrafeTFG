package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.ConexionEmail;
import utils.PDFUtils;
import models.carritosDAO;
import models.productosVO;
import models.usersDAO;
import models.usersVO;
/**
 * Servlet implementation class ServletPDFPedido
 */
@WebServlet("/ServletPDFPedido")
public class ServletPDFPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPDFPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
		usersVO user = usersDAO.buscarUsuarioPorEmail(email);

		String idCarrito;
		idCarrito = carritosDAO.buscarCarritoPorEmail(email);
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		ArrayList<Integer> cantidades =  new ArrayList<Integer>();
		productos = carritosDAO.listaProductosPorIdCarrito(idCarrito);
		productosVO producto;
		for(int e = 0; e < productos.size();e++) {
			producto = productos.get(e);
			cantidades.add(producto.getCantidad());
		}

		PDFUtils.crearPdfPedido(new File(PDFUtils.UBICACION_PDF), productos, email, cantidades);
		PDFUtils.descargarPdf(new File(PDFUtils.UBICACION_PDF), "asd", "asd", response);
		PDFUtils.eliminarPdfServidor(new File(PDFUtils.UBICACION_PDF+"\\Pedido"+email+".pdf"));
		
		
		
		
		//PDF por correo
		String codPDF;
		
		PDFUtils.crearPdfPedido(new File(PDFUtils.UBICACION_PDF), productos, email, cantidades);
		codPDF = PDFUtils.UBICACION_PDF+"\\Pedido"+email+".pdf";
		try {
			ConexionEmail.enviarConGMailPDF(email, codPDF);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		PDFUtils.eliminarPdfServidor(new File(codPDF));	

		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
