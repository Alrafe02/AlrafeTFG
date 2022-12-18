package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.mail.MessagingException;

import utils.ConexionBD;
import utils.ConexionEmail;
import utils.EncriptadorSHA256;
import utils.GeneradorStringAleatorio;

public class loginDAO {

	
	public static void registrarCliente(String nombre, String apellidos, String fecha, String email, String nacionalidad, String direccion, String password, String ciudad, String codPostal, String genero) throws MessagingException {
		password = EncriptadorSHA256.convertirSHA256(password);
		String query="",query3="";
		Statement stat, stat2, stat3;
		Connection con = ConexionBD.conectarBD();
		String foto = "Resources/otro.png";
		if(genero.equals("Masculino"))foto="Resources/masculino.png";
		if(genero.equals("Femenino"))foto="Resources/femenino.png";
		String codVerificacion = GeneradorStringAleatorio.generateRandomString(15);
		try {
			stat = con.createStatement();
			query = ""
					+ "INSERT INTO `Clientes`(`nombre`, `apellidos`, `fechaNac`, `paisNac`, `contraseña`, `email`, `direccion`, `ciudad`, `codPostal`, `genero`, `foto`, `verificado`) VALUES (\""+nombre+"\",\""+apellidos+"\",\""+fecha+"\",\""+nacionalidad+"\",\""+password+"\",\""+email+"\",\""+direccion+"\",\""+ciudad+"\", "+codPostal+", \""+genero+"\", \""+foto+"\", \""+codVerificacion+"\");";
		System.out.println(query);
			stat.execute(query);
			stat.close();

			
			stat3 = con.createStatement();
			query3 = "INSERT INTO Carritos (emailCliente) \r\n"
					+ "VALUES (\""+email+"\")";
			System.out.println(query3);
			stat3.execute(query3);
			stat3.close();
			

		con.close();
		String enlaceVerificar = "http://localhost:8080/TFG_Alrafe/ServletVerificar?cod="+codVerificacion+"&email="+email;
		ConexionEmail.enviarConGMail(email, "Verificacion de su cuenta TFG_Alrafe", "Acceda a este enlace para verificar su cuenta: "+enlaceVerificar);
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public static Boolean iniciarSesion(String email, String password) {
		String contrasena = EncriptadorSHA256.convertirSHA256(password);
		Boolean sesionIniciada = false;
		String query = "select * from Clientes WHERE email=? AND contraseña=?";
		Connection con = ConexionBD.conectarBD();
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, contrasena);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String verificado = rs.getString("verificado");
				if(verificado.equals("si")) {
					sesionIniciada = true;

				}else {
					sesionIniciada = false;
				}

			} else {
				sesionIniciada = false;

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sesionIniciada;
	}
	
	public static Boolean iniciarSesionAdmin(String usuario, String password) {
		String contrasena = EncriptadorSHA256.convertirSHA256(password);
		Boolean sesionIniciada = false;
		String query = "select * from Empleados WHERE nombre=? AND contraseña=?";
		Connection con = ConexionBD.conectarBD();
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, usuario);
			pstmt.setString(2, contrasena);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sesionIniciada = true;
				System.out.println("Si");
			} else {
				sesionIniciada = false;
				System.out.println("No");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sesionIniciada;
	}
	public static Boolean verificarCliente(String email, String cod) {
		Boolean verificado = false;
		String query = "select * from Clientes WHERE email=?";
		Connection con = ConexionBD.conectarBD();
		ResultSet rs = null;
		String codBD = "";
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				codBD = rs.getString("verificado");
			}

			if(codBD.equals(cod)) {

				String query2 = "UPDATE Clientes SET verificado = ? WHERE email = ?";
				PreparedStatement pstmt2 = con.prepareStatement(query2);
				pstmt2.setString(1, "si");
				pstmt2.setString(2, email);
				pstmt2.executeUpdate();
				verificado = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return verificado;
	}
	
	
	
}
