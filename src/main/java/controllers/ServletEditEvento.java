package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.eventosDAO;

/**
 * Servlet implementation class ServletEditEvento
 */
@WebServlet("/ServletEditEvento")
public class ServletEditEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEditEvento() {
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
		String idEvento = request.getParameter("idEvento");
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		String horaInicio = request.getParameter("horaInicio");
		String horaFinal = request.getParameter("horaFinal");
		String fecha = request.getParameter("fecha");
		String categoria = request.getParameter("categoria");
		String image = request.getParameter("image");

		
		
		eventosDAO.editEvento(idEvento, nombre, descripcion, horaInicio, horaFinal, fecha, categoria, image);
		response.sendRedirect("adminEventos.jsp");
	}

}
