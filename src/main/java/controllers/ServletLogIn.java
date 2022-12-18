package controllers;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.loginDAO;
import utils.ConexionEmail;

/**
 * Servlet implementation class ServletLogIn
 */
@WebServlet("/ServletLogIn")
public class ServletLogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogIn() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email+password);
		if(loginDAO.iniciarSesion(email, password) == true) {
			try {
				ConexionEmail.enviarConGMail(email, "Inicio de sesión", "Alguien ha iniciado sesión en tu cuenta de TFG_Alrafe");
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			sesion.setAttribute("sesionIniciada", "1");
			Cookie cookieLoginEmail = new Cookie("cookieLoginEmail", email);
			Cookie cookieLoginPasswd = new Cookie("cookieLoginPasswd", password);
			cookieLoginEmail.setMaxAge(60 * 60 * 24 * 365);
			cookieLoginPasswd.setMaxAge(60 * 60 * 24 * 365);
			response.addCookie(cookieLoginEmail);
			response.addCookie(cookieLoginPasswd);
			response.sendRedirect("perfil.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
	}

}
