package com.moysport.scripts.db;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.Scanner;

public class CreateDB {
	
	private static String JDBC_PROPERTIES_URL = "./WebContent/WEB-INF/jdbc.properties";
	private static String SQL_DB_CREATION = "./src/com/moysport/scripts/db/CreateDB.sql";
	
	public static void main(String[] args) {
		System.out.println("Database creation is Start!!!");
		Date dStart = new Date();
		
		ArrayList<String> alSQL = null;
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		boolean endWithError = false;
		try {
			alSQL = getSqlFromFile(SQL_DB_CREATION);

			con = getConnection();
						
			stmt = con.createStatement();
			
			for (String sRow : alSQL) {
				stmt.execute(sRow);
			}

			releaseDB(con, stmt, rs);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			// Could not find the database driver
			endWithError = true;
		} catch (SQLException e) {
			e.printStackTrace();
			// Could not connect to the database
			endWithError = true;
		} catch (IOException e) {
			e.printStackTrace();
			// Could not find/read properties file
			endWithError = true;
		} finally {
			releaseDB(con, stmt, rs);
		}
		
		long lResult = new Date().getTime() - dStart.getTime();
		if (endWithError) {
			System.out.println("Database creation end with ERROR!!!");
		} else {
			System.out.println("Database creation is Complete!!!");
			System.out.println("Execute Sql Count: " + alSQL.size());
			System.out.println("Execute time: " + lResult + "ms");
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
		sDBUrl = prop.getProperty("jdbc.databaseurlshort");
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
	        	if (sTemp.length()>0 && !sTemp.startsWith("--")) {
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
