package com.moysport.dbsql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;

public class CreateDB {
	
	/*jdbc.driverClassName= com.mysql.jdbc.Driver
	jdbc.dialect=org.hibernate.dialect.MySQLDialect
	jdbc.databaseurl=jdbc:mysql://localhost:3306/mysport
	jdbc.username=player01
	jdbc.password=MySqlPlayer*/

	public static void main(String[] args) throws IOException {
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		try {
			// Название драйвера
			String driverName = "com.mysql.jdbc.Driver";

			Class.forName(driverName);

			// Create a connection to the database
			String serverName = "localhost:3306";
			String mydatabase = "mysport";
			String url = "jdbc:mysql://" + serverName + "/" + mydatabase;
			String username = "player01";
			String password = "MySqlPlayer";

			con = DriverManager.getConnection(url, username, password);
			System.out.println("is connect to DB" + con);

			String query = "Select * FROM eventgames";
			stmt = con.createStatement();

			rs = stmt.executeQuery(query);
			String dbtime;
			while (rs.next()) {
				dbtime = rs.getString(1);
				System.out.println(dbtime);
			}

			releaseDB(con, stmt, rs);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			// Could not find the database driver
		} catch (SQLException e) {
			e.printStackTrace();
			// Could not connect to the database
		} finally {
			releaseDB(con, stmt, rs);
		}
		
		File file = new File ("./WebContent/WEB-INF/jdbc.properties");///WebContent/WEB-INF/jdbc.properties
		//File file1 = new File ();
		String current = file.getCanonicalPath();
        System.out.println("Current dir:"+current);
        System.out.println("Current dir:"+file.exists());
		
		Properties prop = new Properties();
		 
    	try {
               //load a properties file from class path, inside static method jdbc.properties
    		prop.load(new FileInputStream(file));
 
               //get the property value and print it out
            System.out.println(prop.getProperty("jdbc.dialect"));
    		System.out.println(prop.getProperty("jdbc.databaseurl"));
    		System.out.println(prop.getProperty("jdbc.username"));
 
    	} catch (IOException ex) {
    		ex.printStackTrace();
        }

	}
	
	public static void releaseDB(Connection con, Statement st, ResultSet rs) {
		if (st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
