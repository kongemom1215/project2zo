package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import oracle.net.aso.e;

public class CartnWishDao {
	private static CartnWishDao instance;
	private CartnWishDao() {}
	
	public static CartnWishDao getInstance() {
		if(instance == null) {
			instance = new CartnWishDao();
		}
		return instance;
	}
	public Connection getConnection() {
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
//장바구니에 담긴 상품 불러오기	
	public ArrayList<CartnWish> select(int sid) throws SQLException {
		
		ArrayList<CartnWish> list = new ArrayList<CartnWish>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=
				"Select p.pid, p.pname,p.pprice, c.cwid, c.cwqty, s.sid\r\n"
				+ "From product p , cartnwish c , SHOPPINGUSER s\r\n"
				+ "where p.pid = c.pid\r\n"
				+ "And c.sid = s.sid\r\n"
				+ "ANd c.sid=? \r\n"
				+ "order by cwid";
		try {
			
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				do {
					CartnWish cart = new CartnWish();
					cart.setPid(rs.getInt("pid"));
					cart.setPname(rs.getString("pname"));
					cart.setPprice(rs.getInt("pprice"));
					cart.setCwid(rs.getInt("cwid"));
					cart.setCwqty(rs.getInt("cwqty"));
					cart.setSid(rs.getInt("sid"));
					list.add(cart);
					
				}while(rs.next());	
					
				
			}
			
			
		} catch (Exception e) {
			System.out.println("CartnWishDao error !!"+e.getMessage());
		}finally {
			if(conn != null) conn.close();
			if(pstmt != null)pstmt.close();
			if(rs != null) rs.close();
		}
		
		return list;
	}
	
//선택된 값 장바구니 테이블에 insert
	public int insert (int pid,int sid,int number) throws SQLException{
		
		int result=0;
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql1 = "select nvl(max(cwid),0) from cartnwish";
		String sql2 = "select count(*)from cartnwish where sid=? and pid=?";
		String sql3 = "Insert into cartnwish values(?,?,?,?,?)";
		String sql4 = "update cartnwish set cwqty=cwqty+1	where sid=? and pid=?";
				
		
		
		try {
			conn=getConnection();
			  
			 pstmt=conn.prepareStatement(sql2);
			 pstmt.setInt(1, sid);
			 pstmt.setInt(2, pid);
			 rs=pstmt.executeQuery(); 
			 if(rs.next()) {
				 int count=rs.getInt(1);
				 if(count == 0) {
					  //장바구니에 담긴 상품이 없으면 insert
					 pstmt.close();
					 rs.close();
					 pstmt=conn.prepareStatement(sql1);
					 rs=pstmt.executeQuery();
					 rs.next();
					 int num=rs.getInt(1)+1;
					 pstmt.close();
					 rs.close();
					 System.out.println("cwid =>"+num);
					 
					 pstmt=conn.prepareStatement(sql3);
					 pstmt.setInt(1, num);//카트위시번호
					 pstmt.setInt(2, sid); //유저번호 가져오기
					 pstmt.setInt(3, pid); //상품번호 가져오기
					 pstmt.setString(4, "cart");
					 pstmt.setInt(5,number); //디폴트는 1 장바구니에서 수량변경 가능하게
					 rs=pstmt.executeQuery();
					 result=0;
					 //result=pstmt.executeUpdate();
					 
				 }else {
					  //장바구니에 담긴 상품이 있으면 update
				  //pstmt.close();
				  //rs.close();
				  pstmt=conn.prepareStatement(sql4); 
				  pstmt.setInt(1, sid);
				  pstmt.setInt(2, pid);
				  rs=pstmt.executeQuery();
				  result=1;
				  //result=pstmt.executeUpdate();
				  
				 }
				
			  }else {
				  result=-1;
			  }
				
			
			System.out.println("result 값은??=>"+result);
			
		}catch(Exception e) {
			System.out.println("CartnWhisDao insert error!!"+e.getMessage());
		}finally {
			if(conn !=null) conn.close();
			if(pstmt !=null) pstmt.close();
			
		}
		
		return result;
	}
//전체 장바구니 상품 지우기	
	public int delete(int sid) throws SQLException {
		int result=0;
		Connection conn= null;
		PreparedStatement pstmt=null;
		
		String sql="delete from cartnwish where sid=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,sid);
			result=pstmt.executeUpdate();
			
			System.out.println("result 값은=>"+result );
			
			
			
		}catch(Exception e) {
			System.out.println("CartnWishDao delete error"+e.getMessage());
		}finally {
			if(conn != null) conn.close();
			if(pstmt != null)pstmt.close();
			
		}
		
		return result;
	}
//장바구니에서 전체 상품 개수	
	public int count(int sid) throws SQLException {
		int count =0;
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "select count(*) from cartnwish where sid = ?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
			
		}catch(Exception e) {
			System.out.println("CartnWishDao error!!"+e.getMessage());
		}finally {
			if(conn != null) conn.close();
			if(pstmt != null)pstmt.close();
			if(rs != null) rs.close();
		}
		return count;
		
	}

	
	
	
	
	
}
