package dao.god;

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
				Product su = new Product();
				su.setPid(rs.getInt("pid"));
				su.setPtype(rs.getString("ptype"));
				su.setCol1(rs.getString("col1"));
				su.setCol2(rs.getString("col2"));
				su.setCol3(rs.getString("col3"));
				su.setCol4(rs.getString("col4"));
				su.setCol5(rs.getString("col5"));
				su.setPprice(rs.getInt("pprice"));
				su.setPname(rs.getString("pname"));
				su.setPregdate(rs.getDate("pregdate"));
				su.setPsell(rs.getInt("psell"));
				su.setPhit(rs.getInt("phit"));
				su.setPdiscount(rs.getInt("pdiscount"));
				su.setPpublic(rs.getInt("ppublic"));
				su.setPthumbimg(rs.getString("pthumbimg"));
				su.setPoption(rs.getString("poption"));
				list.add(su);
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
	public int getTotalProduct() throws SQLException {
		int totalProduct=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from Product";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalProduct=rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getTotalProduct() -> "+e.getMessage());
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return totalProduct;
	}
	public List<Product> list(int startRow, int endRow) throws SQLException {
		List<Product> productlist=new ArrayList<Product>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from (select rownum rn, p.* from (select * from Product order by pid) p) where rn between ? and ?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Product product=new Product();
				product.setPid(rs.getInt(2));
				product.setPtype(rs.getString(3));
				product.setCol1(rs.getString(4));
				product.setCol2(rs.getString(5));
				product.setCol3(rs.getString(6));
				product.setCol4(rs.getString(7));
				product.setCol5(rs.getString(8));
				product.setPprice(rs.getInt(9));
				product.setPinventory(rs.getInt(10));
				product.setPname(rs.getString(11));
				product.setPregdate(rs.getDate(12));
				product.setPsell(rs.getInt(13));
				product.setPhit(rs.getInt(14));
				product.setPdiscount(rs.getInt(15));
				product.setPpublic(rs.getInt(16));
				product.setPthumbimg(rs.getString(17));
				product.setPoption(rs.getString(18));
				
				productlist.add(product);
			}
		} catch (Exception e) {
			System.out.println("product list() -> "+e.getMessage());
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return productlist;
	}
	
	public Product select(int pid) throws SQLException {
		Product product=new Product();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from Product where pid=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				product.setPid(pid);
				product.setPtype(rs.getString(2));
				product.setCol1(rs.getString(3));
				product.setCol2(rs.getString(4));
				product.setCol3(rs.getString(5));
				product.setCol4(rs.getString(6));
				product.setCol5(rs.getString(7));
				product.setPprice(rs.getInt(8));
				product.setPinventory(rs.getInt(9));
				product.setPname(rs.getString(10));
				product.setPregdate(rs.getDate(11));
				product.setPsell(rs.getInt(12));
				product.setPhit(rs.getInt(13));
				product.setPdiscount(rs.getInt(14));
				product.setPpublic(rs.getInt(15));
				product.setPthumbimg(rs.getString(16));
				product.setPoption(rs.getString(17));
			}
		} catch (Exception e) {
			System.out.println("product select() -> "+e.getMessage());
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		
		return product;
	}
	public int updateProduct(Product product) throws SQLException {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update Product set pname=?, ptype=?, pprice=?, pinventory=?, pdiscount=?, ppublic=? where pid=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, product.getPname());
			pstmt.setString(2, product.getPtype());
			pstmt.setInt(3, product.getPprice());
			pstmt.setInt(4, product.getPinventory());
			pstmt.setInt(5, product.getPdiscount());
			pstmt.setInt(6, product.getPpublic());
			pstmt.setInt(7, product.getPid());
			
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePd() -> "+e.getMessage());
		} finally {
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return result;
	}
	public int deleteProduct(int pid) throws SQLException {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from Product where pid=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteProduct() -> "+e.getMessage());
		} finally {
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return result;
	}
	public int insert(Product product) throws SQLException {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="insert into Product values(?,?,?,?,?,?,?,?,?,?,sysdate,0,0,?,?,?,?)";
		String sql2="select max(pid) from product";
		int pid=0;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql2);
			rs=pstmt.executeQuery();
			if(rs.next())
				pid=rs.getInt(1)+1;
			rs.close();
			pstmt.close();
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2, product.getPtype());
			pstmt.setString(3, product.getCol1());
			pstmt.setString(4, product.getCol2());
			pstmt.setString(5, product.getCol3());
			pstmt.setString(6, product.getCol4());
			pstmt.setString(7, product.getCol5());
			pstmt.setInt(8, product.getPprice());
			pstmt.setInt(9, product.getPinventory());
			pstmt.setString(10, product.getPname());
			pstmt.setInt(11, product.getPdiscount());
			pstmt.setInt(12, product.getPpublic());
			pstmt.setString(13, product.getPthumbimg());
			pstmt.setString(14, product.getPoption());
			
			result=pstmt.executeUpdate();
			System.out.println("result : "+result);
		} catch (Exception e) {
			System.out.println("product insert() ->"+e.getMessage());
		} finally {
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return result;
	}
	
}
