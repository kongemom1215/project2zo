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


public class BoardDao {
	
	private static BoardDao instance;
	private BoardDao() {}
	public static BoardDao getInstance() {
		if (instance == null) {	
			instance = new BoardDao();		
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
	
	
	public List<Board> qna_list(int sid,int startRow, int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn, q.* from (SELECT a.*, p.pname FROM qna a, product p where a.pid=p.pid and sid=? order by qdate desc) q) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			System.out.println("startRow->"+startRow);
			System.out.println("endRow"+endRow);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					Board board = new Board();
					board.setQid(rs.getInt("qid"));
					board.setQctg(rs.getString("qctg"));
					board.setPid(rs.getInt("pid"));
					board.setOid(rs.getInt("oid"));
					board.setQcontent(rs.getString("qcontent"));
					board.setQdate(rs.getDate("qdate"));
					board.setQfile(rs.getString("qfile"));
					board.setQcmt(rs.getString("qcmt"));
					board.setQcmtdate(rs.getDate("qcmtdate")); 
					board.setOdate(rs.getDate("odate"));
					board.setPname(rs.getString("pname"));
					list.add(board);
				} while (rs.next());
			}
			
		} catch (Exception e) {
			System.out.println("BoardDao qna_list Error-> "+e.getMessage());
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		System.out.println("qna list->"+list);
		return list;
	}
	
	public List<Board> review_list(int sid,int startRow, int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn, q.* from (SELECT r.*, p.pname FROM review r, product p,orderdetail otb where r.oid =otb.oid and r.pid=p.pid and sid=? order by rdate desc) q) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			System.out.println("startRow->"+startRow);
			System.out.println("endRow"+endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
                Board board = new Board();
                board.setRid(rs.getInt(2));
                board.setSid(rs.getInt(3));
                board.setOid(rs.getInt(4));
                board.setRwriter(rs.getString(5));
                board.setRtitle(rs.getString(6));
                board.setRcontent(rs.getString(7));
                board.setRimg(rs.getString(8));
                board.setRdate(rs.getDate(9));
                board.setRhit(rs.getInt(10));
                board.setRcmt(rs.getString(11));
                board.setRcmtwriter(rs.getDate(12));
                board.setOdate(rs.getDate(13));
                board.setPid(rs.getInt(14));
                board.setPname(rs.getString(15));

                list.add(board);
			}
			
		} catch (Exception e) {
			System.out.println("BoardDao review_list Error-> "+e.getMessage());
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		System.out.println("list->"+list);
		return list;
	}
	public int getCount_R(int sid) throws SQLException {
		int cntReview = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from Review where sid=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs=pstmt.executeQuery();
			if(rs.next())
				cntReview=rs.getInt(1);
		} catch (Exception e) {
			System.out.println("BoardDao cntReview"+e.getMessage());
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return cntReview;
	}
	public int getCount_Q(int sid) throws SQLException {
		int cntQna = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from qna where sid=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs=pstmt.executeQuery();
			if(rs.next())
				cntQna=rs.getInt(1);
		} catch (Exception e) {
			System.out.println("BoardDao cntQna"+e.getMessage());
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return cntQna;
	}
	public Board select(int oid, int pid) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		Board board = new Board();
		String sql = "SELECT * FROM review where oid=? order by rdate desc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oid);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					board.setRid(rs.getInt("rid"));				
					board.setRwriter(rs.getString("rwriter"));
					board.setRtitle(rs.getString("rtitle"));
					board.setRcontent(rs.getString("rcontent"));
					board.setRimg(rs.getString("rimg"));
					board.setRcmt(rs.getString("rcmt"));
					board.setRdate(rs.getDate("rdate"));
					board.setOdate(rs.getDate("odate"));
					board.setRcmtwriter(rs.getDate("rcmtwriter"));
					board.setRhit(rs.getInt("rhit"));
					
					rs.close();
					
					sql = "select pid from product where oid = ?";
					rs = pstmt.executeQuery();
					pstmt.setInt(1, oid);
					
					
					Order_Join orderjoin = new Order_Join();
					orderjoin.setPid(rs.getInt("pid"));
					pid = rs.getInt("pid");
					rs.close();
					
					sql = "select pname from product where pid = ?";
					rs = pstmt.executeQuery();
					pstmt.setInt(1, pid);

					orderjoin.setPname(rs.getString("pname"));				
				} while (rs.next());
			}
			
		} catch (Exception e) {
			System.out.println("BoardDao select Error-> "+e.getMessage());
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		
		return board;
	}
	public int review(Board board,int sid, int oid,int pid) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result = 0;
		String sql1 = "select nvl(max(rid),0) from review";
		String sql2 = "insert into review values (?,?,?,?,?,?,?,sysdate,0,null,null,(select o.odate from order_tb o where oid=?),?)";
		//String sql3 = "select pid from orderdetail where oid=?";
		String sql4="select sname from shoppinguser where sid=?";
		String sql5="update order_tb set ostate=ostate+1 where oid=?";
		String sql6 ="Update orderdetail set reviewox=reviewox+1 where oid=? and pid=?";
		int rid=0;
		String sname=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql1);
			rs=pstmt.executeQuery();
			if(rs.next())
				rid=rs.getInt(1)+1;
			rs.close();
			pstmt.close();
			
		/*	pstmt=conn.prepareStatement(sql3);
			pstmt.setInt(1, oid);
			rs=pstmt.executeQuery();
			if(rs.next()) 
				pid = rs.getInt(1);
			rs.close();
			pstmt.close(); */
			
			pstmt=conn.prepareStatement(sql4);
			pstmt.setInt(1, sid);
			rs=pstmt.executeQuery();
			if(rs.next()) 
				sname = rs.getString(1);
			rs.close();
			pstmt.close();
			
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, rid);
			pstmt.setInt(2, sid);
			pstmt.setInt(3, oid);
			pstmt.setString(4, sname);
			pstmt.setString(5, board.getRtitle());
			pstmt.setString(6,board.getRcontent());
			pstmt.setString(7,board.getRimg());
			pstmt.setInt(8, oid);
			pstmt.setInt(9, pid);
			
			
			result=pstmt.executeUpdate();
			rs.close();
			pstmt.close();
			System.out.println("result : "+result);
			
			pstmt=conn.prepareStatement(sql5);
			pstmt.setInt(1, oid);
			pstmt.executeUpdate();
			rs.close();
			pstmt.close();
			
			pstmt=conn.prepareStatement(sql6);
			pstmt.setInt(1, oid);
			pstmt.setInt(2, pid);
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("review insert() ->"+e.getMessage());
		} finally {
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		return result;
	}

}
