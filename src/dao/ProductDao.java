package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDao {
	private static ProductDao instance;
	private ProductDao() {}
	public static ProductDao getInstance() {
		if (instance == null) {	
			instance = new ProductDao();		
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
	
	public int productAdd(String pname, String ptype, int pprice, int pinventory, String poption) {
		
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql_max = "SELECT max(pid) pid FROM product";
		int pid_max = 0;
		int result = 0;			
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql_max);
			rs = pstmt.executeQuery();
			rs.next();
			pid_max = rs.getInt("pid");
			System.out.println(pid_max + 1);
			String sql = "insert into PRODUCT (pid, pname, ptype, pprice, pinventory, poption) values (?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid_max + 1);
			pstmt.setString(2, pname);
			pstmt.setString(3, ptype);
			pstmt.setInt(4, pprice);
			pstmt.setInt(5, pinventory);
			pstmt.setString(6, poption);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	
	public List<Product> main_img() throws SQLException {
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from (select rownum, a.* from (SELECT * from product a order by psell desc) a) where rownum <= 6";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
				Product product = new Product();
				product.setPid(rs.getInt("pid"));
				product.setPtype(rs.getString("ptype"));
				product.setPexplain(rs.getString("pexplain"));
				product.setCol(rs.getString("col"));
				product.setCol2(rs.getString("col2"));
				product.setCol3(rs.getString("col3"));
				product.setCol4(rs.getString("col4"));
				product.setPprice(rs.getInt("pprice"));
				product.setPname(rs.getString("pname"));
				product.setPregdate(rs.getDate("pregdate"));
				product.setPsell(rs.getInt("psell"));
				product.setPhit(rs.getInt("phit"));
				product.setPdiscount(rs.getInt("pdiscount"));
				product.setPpublic(rs.getInt("ppublic"));
				product.setPthumbimg(rs.getString("pthumbimg"));
				product.setPoption(rs.getString("poption"));
				list.add(product);
				} while (rs.next());
			}
		} catch (Exception e) {
			
		} finally {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn !=null) conn.close();
			} 
		
		return list;
	
	}
}
