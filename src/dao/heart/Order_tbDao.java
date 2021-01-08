package dao.heart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	public Order_Join select(int sid) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("Order_tbDao Order_Join sid->"+sid);
		String sql = "select otb.* ,odt.*,p.pname, p.pthumbimg from order_tb otb, orderdetail odt, product p where otb.oid = odt.oid and odt.pid = p.pid and sid=?";
		System.out.println("Order_tbDao Order_Join sql->"+sql);
		Order_Join orderjoin = new Order_Join();
		System.out.println("Order_tbDao Order_Join 2");
		try {
			conn = getConnection();
			System.out.println("Order_tbDao Order_Join 3");
			pstmt = conn.prepareStatement(sql);
			System.out.println("Order_tbDao Order_Join 4");
			pstmt.setInt(1, sid);
			System.out.println("Order_tbDao Order_Join 5");
			rs = pstmt.executeQuery();
			System.out.println("Order_tbDao Order_Join 6");
			while(rs.next()) {
				System.out.println("Order_tbDao Order_Join 7");
				System.out.println("Order_tbDao Order_Join oname->"+rs.getString("oname"));
				orderjoin.setOid(rs.getInt("oid"));
				System.out.println("Order_tbDao Order_Join 8");
		    	orderjoin.setSid(rs.getInt("sid"));
			    System.out.println("Order_tbDao Order_Join 9");
				orderjoin.setCid(rs.getInt("cid"));
				orderjoin.setOpost(rs.getInt("opost"));
				orderjoin.setOpay(rs.getInt("opay"));
				orderjoin.setOstate(rs.getInt("ostate"));
				orderjoin.setOamount(rs.getInt("oamount"));
				orderjoin.setOinvoice(rs.getInt("oinvoice"));
				orderjoin.setOdelivery(rs.getInt("odelivery"));
				orderjoin.setPid(rs.getInt("pid"));
				orderjoin.setDqty(rs.getInt("dqty"));
				orderjoin.setOdate(rs.getDate("odate"));
				orderjoin.setOname(rs.getString("oname"));
				orderjoin.setOcontact(rs.getString("ocontact"));
				orderjoin.setOaddress(rs.getString("oaddress"));
				orderjoin.setPname(rs.getString("pname"));
				orderjoin.setPthumbimg(rs.getString("pthumbimg"));
				System.out.println("Order_tbDao Order_Join oaddress->"+rs.getString("oaddress"));
		    }
		} catch (Exception e) {
			System.out.println("Order_tbDao Order_Join select  Error->"+e.getMessage());
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		
		return orderjoin;
	}
	public List<Order_Join> list(int sid, String orderdate) throws SQLException {
		List<Order_Join> list= new ArrayList<Order_Join>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 String sql = "select otb.oid, otb.odate,otb.oname,otb.ocontact,otb.oaddress,otb.opay,otb.ostate, otb.oamount,otb.oinvoice, otb.odelivery ,odt.dqty,p.pname, p.pthumbimg from order_tb otb, orderdetail odt, product p where otb.oid = odt.oid and odt.pid = p.pid and sid=? order by otb.odate desc";
		 System.out.println("Order_Join list sql -> "+ sql);
		 try {
			
		} catch (Exception e) {
			System.err.println("Order_tbDao list sql Error->"+e.getMessage());
		}
		 try {
				conn = getConnection();
				System.out.println("Order_Join list 1");
				pstmt = conn.prepareStatement(sql);
				System.out.println("Order_Join list 2");
				pstmt.setInt(1, sid);
				System.out.println("Order_Join list 3");
				rs = pstmt.executeQuery();
				System.out.println("Order_Join list 4");
				
				while (rs.next()) {
					Order_Join orderjoin = new Order_Join();
					orderjoin.setOid(rs.getInt("oid"));
					orderjoin.setOdate(rs.getDate("odate"));
					orderjoin.setOname(rs.getString("oname"));
					orderjoin.setOcontact(rs.getString("ocontact"));
					orderjoin.setOaddress(rs.getString("oaddress"));
					orderjoin.setOpay(rs.getInt("opay"));
					orderjoin.setOstate(rs.getInt("ostate"));
					orderjoin.setOamount(rs.getInt("oamount"));
					orderjoin.setOinvoice(rs.getInt("oinvoice"));
					orderjoin.setOdelivery(rs.getInt("odelivery"));
					orderjoin.setDqty(rs.getInt("dqty"));
					orderjoin.setPname(rs.getString("pname"));
					orderjoin.setPthumbimg(rs.getString("pthumbimg"));
					System.out.println("Order_Join list oid->"+rs.getInt("oid"));
					list.add(orderjoin);
				}
			} catch(Exception e) {	System.out.println("Order_tbDao Order_Join list  Error->"+e.getMessage());
			} finally {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn !=null) conn.close();
			}
		 System.out.println(list);
		return list;
	}
	public List<Order_Join> list_main(int sid) throws SQLException {
		List<Order_Join> list_main= new ArrayList<Order_Join>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 String sql = "select otb.oid, otb.odate,otb.oname,otb.ocontact,otb.oaddress,otb.opay,otb.ostate, otb.oamount,otb.oinvoice, otb.odelivery ,odt.dqty,p.pname, p.pthumbimg from order_tb otb, orderdetail odt, product p where otb.oid = odt.oid and odt.pid = p.pid and sid=?   and otb.odate > sysdate-7 order by otb.odate desc";
		 System.out.println("Order_Join list sql -> "+ sql);
		 try {
				conn = getConnection();
				System.out.println("Order_Join list 1");
				pstmt = conn.prepareStatement(sql);
				System.out.println("Order_Join list 2");
				pstmt.setInt(1, sid);
				System.out.println("Order_Join list 3");
				rs = pstmt.executeQuery();
				System.out.println("Order_Join list 4");
				
				while (rs.next()) {
					Order_Join orderjoin = new Order_Join();
					orderjoin.setOid(rs.getInt("oid"));
					orderjoin.setOdate(rs.getDate("odate"));
					orderjoin.setOname(rs.getString("oname"));
					orderjoin.setOcontact(rs.getString("ocontact"));
					orderjoin.setOaddress(rs.getString("oaddress"));
					orderjoin.setOpay(rs.getInt("opay"));
					orderjoin.setOstate(rs.getInt("ostate"));
					orderjoin.setOamount(rs.getInt("oamount"));
					orderjoin.setOinvoice(rs.getInt("oinvoice"));
					orderjoin.setOdelivery(rs.getInt("odelivery"));
					orderjoin.setDqty(rs.getInt("dqty"));
					orderjoin.setPname(rs.getString("pname"));
					orderjoin.setPthumbimg(rs.getString("pthumbimg"));
					System.out.println("Order_Join list oid->"+rs.getInt("oid"));
					list_main.add(orderjoin);
				}
			} catch(Exception e) {	System.out.println("Order_tbDao Order_Join list  Error->"+e.getMessage());
			} finally {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn !=null) conn.close();
			}
		 System.out.println(list_main);
		return list_main;
	}
	public int getCount(int sid) throws SQLException {
			ResultSet rs =null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "select count(*) from order_tb otb, orderdetail odt, product p where otb.oid = odt.oid and odt.pid = p.pid and sid=? order by otb.odate";
			int cnt =0;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sid);
				rs = pstmt.executeQuery();
				if(rs.next()) cnt=rs.getInt(1);
			} catch (Exception e) {
				System.out.println("Order_tbDao Order_Join getCount  Error->"+e.getMessage());
			}finally {
				if(rs != null) rs.close();
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
		}
			return cnt;
		}
	public int delete(int oid) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs= null;
		//sid와 oid로 해당 ostate 찾기
		String sql1 = "select ostate from order_tb where oid=?";
		System.out.println("sql1->"+sql1);
		//OrderDetail TB정보 삭제
		String sql2 = "Delete from orderdetail where oid=?";
		System.out.println("sql2->"+sql2);
		//Order_tb TB정보 삭제
		String sql3 = "Delete from order_tb where oid=?";
		System.out.println("sql3->"+sql3);
		
		try {
			int Ostate = 0;
			conn = getConnection();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, oid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Ostate = rs.getInt("ostate");
				System.out.println("ostate->" + Ostate);
				if(Ostate == 1) {
					rs.close(); pstmt.close();
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, oid);
					result = pstmt.executeUpdate();
					rs.close(); pstmt.close();
					
					pstmt = conn.prepareStatement(sql3);
					pstmt.setInt(1, oid);
					result = pstmt.executeUpdate();
					
					System.out.println("mypage Order_tbDao Delete result ->"+result);
				}else result=0;
			}else result=-1;
		} catch (Exception e) {
			System.out.println("Order_tbDao delete Error-> "+ e.getMessage());
		}finally {
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
	}		
		return result;
	}
}