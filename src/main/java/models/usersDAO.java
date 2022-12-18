package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;

import utils.ConexionBD;

public class usersDAO {
	public static usersVO buscarUsuarioPorEmail(String email){
		usersVO user = null;
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Clientes WHERE email = \""+email+"\"";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				user = new usersVO(
						rs.getString("email"),
						rs.getString("nombre"),
						rs.getString("apellidos"),
						rs.getString("fechaNac"),
						rs.getString("paisNac"),
						rs.getString("contraseña"),
						rs.getString("direccion"),
						rs.getString("ciudad"),
						rs.getInt("codPostal"),
						rs.getString("foto"),
						rs.getString("genero")
						);

			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return user;
	}
	public static String getImgBlobPorEmail(String id) {
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		String encode = null;
		byte[] imgData = null;
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Clientes WHERE email = \""+id+"\"";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
					
				 imgData = rs.getBytes("imagenBlob"); // blob field 
				 
			}
			if(imgData != null) {
			encode = Base64.getEncoder().encodeToString(imgData);
			}else {
				encode ="nofoto";
			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return encode;
	}
	
	public static void editUserByEmail(String email, String nombre, String apellidos, String pais, String direccion, String codPostal, String ciudad){


		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "UPDATE Clientes SET nombre = \""+nombre+"\", apellidos = \""+apellidos+"\", paisNac = \""+pais+"\", direccion= \""+direccion+"\", ciudad = \""+ciudad+"\", codPostal = "+codPostal+" WHERE email =\""+email+"\"";
			stmt.executeUpdate(query);
						
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
}
