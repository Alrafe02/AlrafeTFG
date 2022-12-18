package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.loginDAO;

/**
 * Servlet implementation class ServletVerificar
 */
@WebServlet("/ServletVerificar")
public class ServletVerificar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletVerificar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cod = request.getParameter("cod");
		String email = request.getParameter("email");
		System.out.println(cod+email);
		
		if(loginDAO.verificarCliente(email, cod)) {
			Cookie cookieLoginEmail = new Cookie("cookieLoginEmail", email);
			cookieLoginEmail.setMaxAge(60 * 60 * 24 * 365);
			response.addCookie(cookieLoginEmail);

			response.sendRedirect("perfil.jsp");
		} else {
			response.setContentType("text/html");
		    PrintWriter out = response.getWriter();

		    out.println("<html>");
		    out.println("<head>");
		    out.println("<title>Error</title>");
		    out.println("</head>");
		    out.println("<body bgcolor=\"white\">");
		    out.println("<p>Ha ocurrido un error, inténtelo de nuevo</p>");
		    out.println("</body>");
		    out.println("</html>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
