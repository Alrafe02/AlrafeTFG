package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletBuscarPorCategoria
 */
@WebServlet("/ServletBuscarPorCategoria")
public class ServletBuscarPorCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBuscarPorCategoria() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion = request.getSession();
		sesion.setAttribute("buscarPorNombre", null);
	  	sesion.setAttribute("buscarPorMarca", 0);
		
	  	String categoriaString = request.getParameter("categoria");
int categoria = Integer.parseInt(categoriaString);
		sesion.setAttribute("buscarPorCategoria", categoria);
		response.sendRedirect("buscador.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion = request.getSession();
		int categoria = Integer.parseInt(request.getParameter("categoria"));

		sesion.setAttribute("buscarPorNombre", null);
	  	sesion.setAttribute("buscarPorMarca", 0);
	  	
		sesion.setAttribute("buscarPorCategoria", categoria);
		response.sendRedirect("buscador.jsp");
	}

}
