package connectDB;

import model.Member;
import model.Comment;
import model.Writing;

import java.sql.*;

public class ConnectDatabase {
	
	String driverName = "org.gjt.mm.mysql.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/test1";
	String tblName;
	
	public ConnectDatabase() {}
	
	public ConnectDatabase(String $tblName) {
		tblName = $tblName;
	}
	
	public int addMember(Member $member) {
		
		Member member = $member;
		
		try{
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");
			Statement stmt = conn.createStatement();

			String strSQL = "INSERT INTO user6(id,pass,name,juminnum1, juminnum2,zip,address1,address2,phone,email,major,subject)";
			strSQL = strSQL +  "VALUES('" + member.getId() + "', '" + member.getPass() + "', '" + member.getName() + "', '" + member.getJuminnum1() + "',";
			strSQL = strSQL +  "'" + member.getJuminnum2() + "', '" + member.getZip() + "', '" + member.getAddress1() + "',"; 
			strSQL = strSQL +  "'" + member.getAddress2() + "', '" + member.getPhone() + "', '" + member.getEmail() + "',";
			strSQL = strSQL + "'" + member.getMajor() + "', '" + member.getSubject() + "')";
			stmt.executeUpdate(strSQL);
			
			stmt.close();
			conn.close();
			return 1;
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	public int checkId(String $id) {
		
		String id = $id;
		try{
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

		Statement stmt = conn.createStatement();
		
		String strSQL = "SELECT id FROM user6 where id='" + id + "'";
		ResultSet rs = stmt.executeQuery(strSQL);
		
		if (!rs.next()) {
			rs.close();
			stmt.close();
			conn.close();
			return 2;
		} else {
			rs.close();
			stmt.close();
			conn.close();
			return 1;
		}
		
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	public int addWriting(Writing $writing) {
		
		Writing writing = $writing;
		
		try{
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");
			
			Statement stmt = conn.createStatement();
		
			String strSQL ="INSERT INTO " + tblName + " (id, name, title, contents, writedate, readcount, filename)";
			strSQL = strSQL +  "VALUES('" + writing.getId() + "', '" + writing.getName() + "', '" + writing.getTitle() + "',";
			strSQL = strSQL +  "'" + writing.getContents() + "', '" + writing.getWritedate() + "', '" + writing.getReadCount() + "', '" + writing.getFileName() + "')";
			stmt.executeUpdate(strSQL);

			stmt.close();                	
			conn.close();
			return 1;
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
		
	}
	
	public Writing getWriting(String $num) {
		Writing writing = new Writing();
		String num = $num;
		String strSQL = "";

		try{
	    Class.forName(driverName);
	    Connection conn = DriverManager.getConnection(dbURL, "root", "dongyang");
	    
	    Statement stmt = conn.createStatement();
	    
	    strSQL = "SELECT * FROM " + tblName + " where num='" + num + "'";
	    ResultSet rs = stmt.executeQuery(strSQL);
	    rs.next();
	    writing.setTitle(rs.getString("title"));
	    writing.setName(rs.getString("name"));
	    writing.setWritedate(rs.getString("writedate"));
	    writing.setContents(rs.getString("contents"));
	    writing.setFileName(rs.getString("filename"));
	    
	    stmt.close();                	
		conn.close();
		return writing;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public int resetWriting(Writing $writing) {
		Writing writing = $writing;
		
		try{
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");
			
			Statement stmt = conn.createStatement();
			String strSQL = "UPDATE " + tblName + " set title = '" + writing.getTitle() + "', contents = '" + writing.getContents() + "',";
			strSQL = strSQL +  "filename = '" + writing.getFileName() + "'" + "WHERE num = '" + writing.getNum() + "'";
			stmt.executeUpdate(strSQL);

			stmt.close();                	
			conn.close();
			return 1;
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	public int addComment(Comment $comment) {
		Comment comment = $comment;
		try{
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");
			
			Statement stmt = conn.createStatement();
			
			String strSQL = "INSERT INTO " + tblName + "(id,maker,name,contents,writedate)";
			strSQL = strSQL +  "VALUES('" + comment.getId() + "', '" + comment.getMaker() + "', '" + comment.getName() + "', '" + comment.getContents() + "',";
			strSQL = strSQL + "'" + comment.getWriteDate() + "')";
			stmt.executeUpdate(strSQL);
			
			stmt.close();
			conn.close();
			return 1;
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	public int resetComment(Comment $comment) {
		Comment comment = $comment;
		
		try{
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(dbURL,"root","dongyang");

			Statement stmt = conn.createStatement();
			String strSQL = "UPDATE " + tblName + " set contents = '" + comment.getContents() + "'" + "WHERE num = '" + comment.getNum() + "'";
			stmt.executeUpdate(strSQL);

			stmt.close();                	
			conn.close();
			return 1;
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
}
