package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.usersDAO;

/**
 * Servlet implementation class ServletEditUser
 */
@WebServlet("/ServletEditUser")
public class ServletEditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEditUser() {
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
		String nombre = request.getParameter("name");
		String apellidos = request.getParameter("surname");
		String ciudad = request.getParameter("city");
		String pais = request.getParameter("country");
		String codPostal = request.getParameter("codpostal");
		String direccion = request.getParameter("address");
		String email = request.getParameter("email");

		usersDAO.editUserByEmail(email, nombre, apellidos, pais, direccion, codPostal, ciudad);
		sesion.setAttribute("editado", "si");
		response.sendRedirect("perfil.jsp");
	}

}
