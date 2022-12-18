package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.carritosDAO;

/**
 * Servlet implementation class ServletDeleteFromCarrito
 */
@WebServlet("/ServletDeleteFromCarrito")
public class ServletDeleteFromCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletDeleteFromCarrito() {
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

		String idProducto = request.getParameter("idProducto");
		String email = request.getParameter("email");
		String idCarritos;
		idCarritos = carritosDAO.buscarCarritoPorEmail(email);
		System.out.println(idCarritos);	
		
		carritosDAO.deleteProductoFromCarrito(idCarritos, idProducto);
		response.sendRedirect("carrito.jsp");
	}

}
