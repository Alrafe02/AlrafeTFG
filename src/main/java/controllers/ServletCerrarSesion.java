package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletCerrarSesion
 */
@WebServlet("/ServletCerrarSesion")
public class ServletCerrarSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCerrarSesion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cookie cookieUsername = new Cookie("cookieLoginUser", "");
		Cookie cookiePassword = new Cookie("cookieLoginPassword", "");
		Cookie cookieLoginEmail = new Cookie("cookieLoginEmail", "");
		Cookie cookieLoginPasswd = new Cookie("cookieLoginPasswd", "");
		cookieLoginEmail.setMaxAge(0);
		cookieLoginPasswd.setMaxAge(0);
		cookieUsername.setMaxAge(0);
        cookiePassword.setMaxAge(0);
        response.addCookie(cookieLoginEmail);
        response.addCookie(cookieLoginPasswd);
        response.addCookie(cookieUsername);
        response.addCookie(cookiePassword);
	    response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            cookie.setValue("");
	            cookie.setPath("/");
	            cookie.setMaxAge(0);
	            response.addCookie(cookie);
	        }
	    }
	    response.sendRedirect("index.jsp");
	}

}
