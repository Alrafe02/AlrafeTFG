package controllers;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.loginDAO;

/**
 * Servlet implementation class ServletRegister
 */
@WebServlet("/ServletRegister")
public class ServletRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegister() {
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
		String apellidos = request.getParameter("apellidos");
		String ciudad = request.getParameter("ciudad");
		String pais = request.getParameter("pais");
		String codPostal = request.getParameter("codPostal");
		String fechaNac = request.getParameter("fechaNac");
		String direccion = request.getParameter("direccion");
		String genero = request.getParameter("genero");
		String email = request.getParameter("email");
		String passwd = request.getParameter("passwd");
		String passwd2 = request.getParameter("passwd2");
		try {
			loginDAO.registrarCliente(nombre, apellidos, fechaNac, email, pais, direccion, passwd, ciudad, codPostal, genero);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		response.sendRedirect("login.jsp");
		
		
	}

}
