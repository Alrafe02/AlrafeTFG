package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.eventosDAO;
import models.productosDAO;

/**
 * Servlet implementation class ServletAddProducto
 */
@WebServlet("/ServletAddProducto")
public class ServletAddProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAddProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion = request.getSession();
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		float precio = Float.parseFloat(request.getParameter("precio"));
		String imagenString = request.getParameter("imagenString");
		int marca = Integer.parseInt(request.getParameter("marca"));
		int categoria = Integer.parseInt(request.getParameter("categoria"));
		boolean destacado;
		if(request.getParameter("destacado") == null){
		    destacado = false;
		}else{
		    destacado = true;
		}
		
		
		productosDAO.addProducto(nombre, descripcion, precio, imagenString, marca, categoria, destacado);
		response.sendRedirect("adminProductos.jsp");
		
		
	}

}
