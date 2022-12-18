package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.loginDAO;

/**
 * Servlet implementation class ServletLogInAdmin
 */
@WebServlet("/ServletLogInAdmin")
public class ServletLogInAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogInAdmin() {
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
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");
		if(loginDAO.iniciarSesionAdmin(usuario, password) == true) {
			sesion.setAttribute("sesionIniciadaAdmins", "1");
			Cookie cookieUsername = new Cookie("cookieLoginUser", usuario);
			Cookie cookiePassword = new Cookie("cookieLoginPassword", password);
			cookieUsername.setMaxAge(60 * 60 * 24 * 365);
			cookiePassword.setMaxAge(60 * 60 * 24 * 365);
			response.addCookie(cookieUsername);
			response.addCookie(cookiePassword);
			response.sendRedirect("indexAdmin.jsp");
		} else {
			response.sendRedirect("loginAdmin.jsp");
		}
	}

}
