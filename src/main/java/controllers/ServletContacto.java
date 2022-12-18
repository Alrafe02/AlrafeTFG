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
import utils.ConexionEmail;

/**
 * Servlet implementation class ServletContacto
 */
@WebServlet("/ServletContacto")
public class ServletContacto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletContacto() {
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
		String motivo = request.getParameter("motivo");
		String mensaje = request.getParameter("mensaje");
		String email = request.getParameter("email");

		
		try {
			ConexionEmail.enviarConGMail(email, "Copia del mensaje enviado a Tienda Alrafe", "\b\nMotivo: " + motivo + "\b\n Mensaje: "+mensaje + "\b\n Nombre: "+ nombre);
			ConexionEmail.enviarConGMail("alrafepruebas@gmail.com", email, "\b\nMotivo: " + motivo + "\b\n Mensaje: "+mensaje + "\b\n Nombre: "+ nombre);
			ConexionEmail.enviarConGMail("alrafe02@gmail.com", email, "\b\nMotivo: " + motivo + "\b\n Mensaje: "+mensaje + "\b\n Nombre: "+ nombre);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		sesion.setAttribute("toast", "si");
		response.sendRedirect("sobreNosotros.jsp");
	}

}
