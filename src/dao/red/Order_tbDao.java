package dao.red;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Order_tbDao {
	private static Order_tbDao instance;
	private Order_tbDao() {}
	public static Order_tbDao getInstance() {
		if(instance == null) {
			instance = new Order_tbDao();
		}
		return instance;
		
	}public Connection getConnection() {
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
	public int insert(Order order) throws SQLException {
		int result=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select to_number(to_char(sysdate, 'yymmdd')) || LPAD(oid_num.NEXTVAL,4,0) from dual;";
		String sql2 = "SELECT inv_num.NEXTVAL FROM DUAL ";
		String sql3 = "Insert INTO order_tb values(?,sysdate,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			int count=0;
			conn=getConnection();
			pstmt=conn.prepareStatement(sql1);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			pstmt.close();
			rs.close();
			
			int invoice=0;
			pstmt=conn.prepareStatement(sql2);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				invoice=rs.getInt(1);
			}
			
			
			pstmt.close();
			rs.close();
			
			pstmt=conn.prepareStatement(sql3);
			pstmt.setInt(1, count);
			//sysdate
			pstmt.setInt(2, order.getSid());
			pstmt.setInt(3, order.getCid());
			pstmt.setString(4, order.getOname());
			pstmt.setString(5, order.getOcontact());
			pstmt.setString(6, order.getOaddress());
			pstmt.setInt(7, order.getOpost());
			pstmt.setInt(8, order.getOpay());
			pstmt.setInt(9, order.getOstate());
			pstmt.setInt(10, order.getOamount());
			pstmt.setInt(11, invoice);
			pstmt.setInt(12, order.getOdeliverey());
			
			result=pstmt.executeUpdate();
			
			System.out.println("-----------------");
			System.out.println("result =>"+ result);
			
		}catch(Exception e) {
			System.out.println("Order_tdDao error!!"+e.getMessage());
		}finally {
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}

		
		return result;
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
}