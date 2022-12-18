package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import utils.ConexionBD;

/**
 * Servlet implementation class ServletAddImg
 */
@WebServlet("/ServletAddImg")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)   	// 100 MB
public class ServletAddImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAddImg() {
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
        // Input stream of the upload file
        InputStream inputStream = null;
        Cookie[] cookies=request.getCookies();
		String email="";
		if (cookies != null) {
		     for (Cookie cookie : cookies) {
		       if (cookie.getName().equals("cookieLoginEmail")) {
		           email=cookie.getValue();
		       }

		    }
		} 
        String message = null;
  
        // Obtains the upload file
        // part in this multipart request
        Part filePart = request.getPart("photo");
  
        if (filePart != null) {
            // Obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
        String SQL
        = "UPDATE Clientes SET imagenBlob = ? WHERE email = ?";
    int row = 0;

    Connection connection = ConexionBD.conectarBD();

    PreparedStatement preparedStatement;
    try {
        preparedStatement = connection.prepareStatement(SQL);
        if (inputStream != null) {
            // Fetches the input stream
            // of the upload file for
            // the blob column
            preparedStatement.setBlob(1, inputStream);
            preparedStatement.setString(2, email);
        }

        // Sends the statement to
        // the database server
        row = preparedStatement.executeUpdate();
    }
    catch (SQLException e) {
        System.out.println(e.getMessage());
    }
        
    	HttpSession sesion = request.getSession();
    	sesion.setAttribute("editado", "si");
        response.sendRedirect("perfil.jsp");
	}

}
