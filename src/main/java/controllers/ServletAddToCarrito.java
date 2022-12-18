package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.carritosDAO;

/**
 * Servlet implementation class ServletAddToCarrito
 */
@WebServlet("/ServletAddToCarrito")
public class ServletAddToCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAddToCarrito() {
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
		String quantity = request.getParameter("quantity");
		String idProducto = request.getParameter("idProducto");
		String email = request.getParameter("email");
		String idCarritos;
		idCarritos = carritosDAO.buscarCarritoPorEmail(email);
		
		sesion.setAttribute("editado", "si");
		carritosDAO.addProductoToCarrito(idCarritos, idProducto, quantity);
		response.sendRedirect("producto.jsp?id="+idProducto);
		
	}

}
