package dao.red;

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
	public ArrayList<CartnWish> select(int session_sid) throws SQLException {
		
		ArrayList<CartnWish> list = new ArrayList<CartnWish>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=
				"Select p.pid, p.pname,p.pprice, c.cwid, c.cwqty, s.sid, c.cwoption\r\n"
				+ "From product p , cartnwish c , SHOPPINGUSER s\r\n"
				+ "where p.pid = c.pid\r\n"
				+ "And c.sid = s.sid\r\n"
				+ "ANd c.sid=? \r\n"
				+ "order by cwid";
		try {
			
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, session_sid);
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
					cart.setCwoption(rs.getString("cwoption"));
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
	public int insert (int pid,int session_sid,int howmany,String option) throws SQLException{
		
		
		
		int result=0;
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		System.out.println("확인 insert3");
		
		String sql1 = "select nvl(max(cwid),0) from cartnwish";
		String sql2 = "select count(*) from cartnwish where sid=? and pid=?";
		String sql3 = "Insert into cartnwish values(?,?,?,?,?,?)";
		String sql4 = "update cartnwish set cwqty=cwqty+? where sid=? and pid=? and cwoption=?";
	
		System.out.println("확인 insert1");
		System.out.println("CartnWishDao insert sql3 ->" + sql3 );
		System.out.println("확인 insert2");
			
		try {
			conn=getConnection();
			//카트번호 순서쌍
			int num=0;
			pstmt=conn.prepareStatement(sql1);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}
			
			//중복확인
//			rs.close();
//			pstmt.close();
//			
//			pstmt=conn.prepareStatement(sql2);
//			pstmt.setInt(1, session_sid);
//			pstmt.setInt(2, pid);
//			pstmt.setString(3, option);
//			rs=pstmt.executeQuery();
//			System.out.println("CartnWishDao insert rs=>"+rs);
//			if(rs.next()) {
				rs.close();
				pstmt.close();
				pstmt=conn.prepareStatement(sql3);
				System.out.println("CartnWishDao insert num ->" + num );
				System.out.println("CartnWishDao insert session_sid ->" + session_sid );
				System.out.println("CartnWishDao insert pid ->" + pid );
				pstmt.setInt(1, num);
				pstmt.setInt(2, session_sid);
				pstmt.setInt(3, pid);
				pstmt.setString(4, "cart");
				System.out.println("CartnWishDao insert howmany ->" + howmany );
				System.out.println("CartnWishDao insert option ->" + option );
				pstmt.setInt(5, howmany);
				pstmt.setString(6, option);
				
				result=pstmt.executeUpdate();
				
//			}
			
//			if(rs.) {
//				 //값이 있으면 update
//				rs.close();
//				pstmt.close();
//				 
//				pstmt=conn.prepareStatement(sql3);
//				pstmt.setInt(1, num);
//				pstmt.setInt(2, session_sid);
//				pstmt.setInt(3, pid);
//				pstmt.setString(4, "cart");
//				pstmt.setInt(5, howmany);
//				pstmt.setString(6, option);
//				result=pstmt.executeUpdate();
//				 
//				 System.out.println("Insert result"+result);
//
//			 }else {
//				 
//			 }

				
			System.out.println("======================");
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
	public int delete(int session_sid) throws SQLException {
		int result=0;
		Connection conn= null;
		PreparedStatement pstmt=null;
		
		String sql="delete from cartnwish where sid=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,session_sid);
			result=pstmt.executeUpdate();
			System.out.println("======================");
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
	public int count(int session_sid) throws SQLException {
		int count =0;
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "select sum(cwqty) from cartnwish where sid = ?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, session_sid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
			System.out.println("======================");
			System.out.println("장바구니 상품 총 개수 =>"+count);
			
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
