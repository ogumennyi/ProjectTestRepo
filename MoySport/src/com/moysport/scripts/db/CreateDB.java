package com.moysport.scripts.db;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Scanner;

public class CreateDB {
	
	private static String JDBC_PROPERTIES_URL = "./WebContent/WEB-INF/jdbc.properties";
	private static String SQL_DB_CREATION = "./src/com/moysport/scripts/db/CreateDB.sql";
	private static String SQL_DB_TEST = "./src/com/moysport/scripts/db/SQLTemp.sql";
	
	public static void main(String[] args) throws IOException {
		//String sSQLCreation = readFile("./src/com/moysport/scripts/db/SQLTemp.sql", StandardCharsets.UTF_8);
		//String sSQLCreation = readFile(SQL_DB_CREATION, StandardCharsets.UTF_8);
		//System.out.println(sSQLCreation);
		
		ArrayList<String> alSQL= getSqlFromFile(SQL_DB_CREATION);
		
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		try {

			con = getConnection();
						
			stmt = con.createStatement();
			
			for (String sRow : alSQL) {
				//i++;
				System.out.println(">>>"+sRow);
				boolean res = stmt.execute(sRow);
				System.out.println("res="+res);
			}

			releaseDB(con, stmt, rs);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			// Could not find the database driver
		} catch (SQLException e) {
			e.printStackTrace();
			// Could not connect to the database
		} catch (IOException e) {
			e.printStackTrace();
			// Could not find/read properties file
		} finally {
			releaseDB(con, stmt, rs);
		}
		
	}
	
	
	public static Connection getConnection() throws IOException, ClassNotFoundException, SQLException {
		Connection con = null;
		
		String sDriverName = null;
		String sDBUrl = null;
		String sUserName = null;
		String sUserPassword = null;
		File file = new File(JDBC_PROPERTIES_URL);
		Properties prop = new Properties();
		FileInputStream fileIS = new FileInputStream(file);
		
		prop.load(fileIS);
		fileIS.close();
		
		sDriverName = prop.getProperty("jdbc.driverClassName");
		sDBUrl = "jdbc:mysql://localhost:3306";//prop.getProperty("jdbc.databaseurl");
		sUserName = prop.getProperty("jdbc.username");
		sUserPassword = prop.getProperty("jdbc.password");
		
		con = getConnection(sDriverName, sDBUrl, sUserName, sUserPassword);
		
		return con;
	}
	
	public static ArrayList<String> getSqlFromFile(String pathname) throws IOException {
		ArrayList<String> alRes = new ArrayList<String>();
	    File file = new File(pathname);
	    
	    Scanner scanner = new Scanner(file,"UTF-8");
	    String lineSeparator = System.getProperty("line.separator");
	    
	    StringBuilder sSQL = new StringBuilder();
	    try {
	        while(scanner.hasNextLine()) {
	        	String sTemp = scanner.nextLine();
	        	if (sTemp.length()>0 || sTemp.startsWith("--")) {
	        		if (sTemp.indexOf(";")!=-1) {
		        		sSQL.append(sTemp);
		        		alRes.add(sSQL.toString());
		        		sSQL.delete(0, sSQL.length());
		        	} else {
		        		sSQL.append(sTemp).append(lineSeparator);
		        	}
	        	}
	        }
	        return alRes;
	    } finally {
	        scanner.close();
	    }
	}
	
	
	public static String readFile(String pathname) throws IOException {

	    File file = new File(pathname);
	    StringBuilder fileContents = new StringBuilder((int)file.length());
	    Scanner scanner = new Scanner(file);
	    String lineSeparator = System.getProperty("line.separator");

	    try {
	        while(scanner.hasNextLine()) {        
	            fileContents.append(scanner.nextLine() + lineSeparator);
	        }
	        return fileContents.toString();
	    } finally {
	        scanner.close();
	    }
	}
	
	public static String readFile(String path, Charset encoding) throws IOException {
		byte[] encoded = Files.readAllBytes(Paths.get(path));
		return encoding.decode(ByteBuffer.wrap(encoded)).toString();
	}
	
	public static Connection getConnection(String sDriverName, String sDBUrl, String sUserName, String sUserPassword) throws ClassNotFoundException, SQLException {
		Connection con = null;
		Class.forName(sDriverName);
		con = DriverManager.getConnection(sDBUrl, sUserName, sUserPassword);
		return con;
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
