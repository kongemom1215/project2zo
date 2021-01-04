package dao.god;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ShoppingUserDao {
	
	private static ShoppingUserDao instance;
	private ShoppingUserDao() {}
	public static ShoppingUserDao getInstance() {
		if (instance == null) {	
			instance = new ShoppingUserDao();		
			}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
			}
		return conn;
	}
	
	public int getTotalUser() throws SQLException {
		int totalUser=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from ShoppingUser";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalUser=rs.getInt(1)-1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return totalUser;
	}
	
	public List<ShoppingUser> list(int startRow, int endRow) throws SQLException {
		String sql="select * from (select rownum rn, s.* from (select * from ShoppingUser order by sid ) s) where rn between ? and ?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ShoppingUser> userlist=new ArrayList<ShoppingUser>();
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow+1);
			pstmt.setInt(2, endRow+1);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ShoppingUser shoppinguser=new ShoppingUser();
				shoppinguser.setSid(rs.getInt(2));
				shoppinguser.setStype(rs.getInt(3));
				shoppinguser.setSemail(rs.getString(4));
				shoppinguser.setSpwd(rs.getString(5));
				shoppinguser.setSname(rs.getString(6));
				shoppinguser.setScontact(rs.getString(7));
				shoppinguser.setSregdate(rs.getDate(8));
				shoppinguser.setSaddress(rs.getString(9));
				shoppinguser.setSpost(rs.getInt(10));
				shoppinguser.setSagree(rs.getString(11));
				
				userlist.add(shoppinguser);
			}
		} catch (Exception e) {
			System.out.println("list 메소드 -> "+e.getMessage());
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		
		return userlist;
	}
}
