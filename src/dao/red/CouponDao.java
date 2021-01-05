package dao.red;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CouponDao {
	private static CouponDao instance;
	private CouponDao() {}
	public static CouponDao getInstance() {
		if(instance == null) {
			instance = new CouponDao();
		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		
		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	public Coupon select(int sid) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = "select cid,sid,cstartdate,cenddate,cdiscount,cusedate from coupon where sid= ?";
		
		System.out.println("Coupon select sql -> "+ sql);
		Coupon coupon = new Coupon();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				coupon.setCid(rs.getInt("cid"));
				coupon.setSid(rs.getInt("sid"));
				coupon.setCstartdate(rs.getDate("cstartdate"));
				coupon.setCenddate(rs.getDate("cenddate"));
				coupon.setCdiscount(rs.getInt("cdiscount"));
				coupon.setCusedate(rs.getDate("cusedate"));
				System.out.println("coupon=>"+coupon);
			}
		} catch (Exception e) {
			System.out.println("ShoppingUser select error=>"+e.getMessage());
		} finally {
			if (rs !=null)    rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null)  conn.close();
		}
		return coupon;
	}
	public int getCount(int sid) throws SQLException {
		ResultSet rs =null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select count(*) from coupon order by cenddate where sid=? and cenddate >= sysdate and cusedate is null ";
		int cnt =0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			if(rs.next()) cnt=rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
	}
		return cnt;
	}
	public int getTotalCnt(int sid) throws SQLException {
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "Select count(*) from coupon where sid=?";
		int tot = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			if(rs.next()) tot= rs.getInt(1);
		} catch (Exception e) {
			System.out.println("CouponDao getTotalCnt => "+e.getMessage());
		}finally {
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
		return tot;
	}
	public List<Coupon> list(int sid) throws SQLException {
		List<Coupon> list= new ArrayList<Coupon>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 String sql = "select * from (select a.* from (select * from coupon where sid=? and cenddate>sysdate and cusedate is null order by cenddate) a )";
		 try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sid);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Coupon coupon = new Coupon();
					coupon.setCid(rs.getInt(1));
					coupon.setSid(rs.getInt(2));
					coupon.setCstartdate(rs.getDate(3));
					coupon.setCenddate(rs.getDate(4));
					coupon.setCdiscount(rs.getInt(5));
					coupon.setCusedate(rs.getDate(6));
					list.add(coupon);
				}
			} catch(Exception e) {	System.out.println(e.getMessage());
			} finally {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn !=null) conn.close();
			}
		return list;
	}
}
