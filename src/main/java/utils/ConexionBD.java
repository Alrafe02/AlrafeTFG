package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
	/**
	 * Función que conecta con la BD, Introducir String con el nombre de la BD
	 * 
	 * @return Connection o null si ha habido fallos
	 */


	
	
	public static Connection conectarBD() {
		Connection con = null;

		// Parametros de conexión
		

		try {
			// Conectamos con la BD
			Class.forName("com.mysql.jdbc.Driver");
			//con = DriverManager.getConnection(
			//        "jdbc:mysql://brcbnxayxf3dnluxbav4-mysql.services.clever-cloud.com:3306/brcbnxayxf3dnluxbav4",
			//        "umqq6xr2ozhff0vw", "EzVUQLLL3fV7lr9LWSTE");
			con = DriverManager.getConnection(
			        "jdbc:mysql://localhost:3306/tiendaTFG",
			        "root", "admin");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// devolvemos la conexión
		return con;
	}
}