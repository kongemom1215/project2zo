package dao;

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
	
	public int login(String semail, String spwd) throws SQLException {
		
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select SEMAIL, SPWD from shoppinguser"
				+ " where semail = ?";
		
		int login_num = 0;
		
		try {
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, semail);
		rs = pstmt.executeQuery();
		
		if (semail != "" && semail != null) {
			if (rs.next()) {
				login_num = 2; // 아이디만 맞음
				if (rs.getString("spwd").equals(spwd)) {
					login_num = 3; // 로그인 성공
				}
			} else {
				login_num = 1; // 아이디 틀림
			}
		}
		
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		
		System.out.println("login_num : " + login_num);
		
		return login_num;
	}
	
	public List<ShoppingUser> shoppingUser_semail(String semail) throws SQLException {
		List<ShoppingUser> list = new ArrayList<ShoppingUser>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select SID, STYPE, SEMAIL, SPWD, SNAME, SCONTACT, SBIRTHDATE, SREGDATE, SADDRESS, SPOST, SAGREE from shoppinguser where semail = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, semail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ShoppingUser su = new ShoppingUser();
				su.setSid(rs.getInt("sid"));
				su.setStype(rs.getInt("stype"));
				su.setSemail(rs.getString("semail"));
				su.setSpwd(rs.getString("spwd"));
				su.setSname(rs.getString("sname"));
				su.setScontact(rs.getString("scontact"));
				su.setSbirthdate(rs.getDate("sbirthdate"));
				su.setSregdate(rs.getDate("sregdate"));
				su.setSaddress(rs.getString("saddress"));
				su.setSpost(rs.getInt("spost"));
				su.setSagree(rs.getString("sagree"));
				list.add(su);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		
		return list;
	}
	
	public List<ShoppingUser> shoppingUser_sid(int sid) throws SQLException {
		List<ShoppingUser> list = new ArrayList<ShoppingUser>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select SID, STYPE, SEMAIL, SPWD, SNAME, SCONTACT, SBIRTHDATE, SREGDATE, SADDRESS, SPOST, SAGREE from shoppinguser where sid = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ShoppingUser su = new ShoppingUser();
				su.setSid(rs.getInt("sid"));
				su.setStype(rs.getInt("stype"));
				su.setSemail(rs.getString("semail"));
				su.setSpwd(rs.getString("spwd"));
				su.setSname(rs.getString("sname"));
				su.setScontact(rs.getString("scontact"));
				su.setSbirthdate(rs.getDate("sbirthdate"));
				su.setSregdate(rs.getDate("sregdate"));
				su.setSaddress(rs.getString("saddress"));
				su.setSpost(rs.getInt("spost"));
				su.setSagree(rs.getString("sagree"));
				list.add(su);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		
		return list;
	}
	
	public String covid_19_live(String start, String end) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"); /*URL*/
        String service_key = "zQQiK%2BrG5QvJ3DIxw2tSn18c0ifbEX009htHuFt%2ByZHTkE6FCTh5heo2xjYkpzlJ9fUPTMvaS9ZPmnalruFNbg%3D%3D";
        String page_num = "1";
        String date_count = "1";
        String start_day = start;
        String end_day = end;
        
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + service_key); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page_num, "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(date_count, "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(start_day, "UTF-8")); /*검색할 생성일 범위의 시작*/
        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(end_day, "UTF-8")); /*검색할 생성일 범위의 종료*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
		/* System.out.println("Response code: " + conn.getResponseCode()); */
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        return sb.toString();
    }
	
	public ShoppingUser select(int sid) throws SQLException {
		String sql="select * from ShoppingUser where sid=?";
		ShoppingUser shoppinguser = new ShoppingUser();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				shoppinguser.setSemail(rs.getString(3));
				shoppinguser.setSaddress(rs.getString(8));
				shoppinguser.setSagree(rs.getString(10));
				shoppinguser.setScontact(rs.getString(6));
				shoppinguser.setSname(rs.getString(5));
				shoppinguser.setSid(rs.getInt(1));
				shoppinguser.setSpost(rs.getInt(9));
				shoppinguser.setSpwd(rs.getString(4));
				shoppinguser.setSregdate(rs.getDate(7));
				shoppinguser.setStype(rs.getInt(2));
			}
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
		
		return shoppinguser;
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
		String sql="select * from (select s.* from (select * from ShoppingUser order by sid ) s) where sid between ? and ?";
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
				shoppinguser.setSid(rs.getInt(1));
				shoppinguser.setStype(rs.getInt(2));
				shoppinguser.setSemail(rs.getString(3));
				shoppinguser.setSpwd(rs.getString(4));
				shoppinguser.setSname(rs.getString(5));
				shoppinguser.setScontact(rs.getString(6));
				shoppinguser.setSregdate(rs.getDate(7));
				shoppinguser.setSaddress(rs.getString(8));
				shoppinguser.setSpost(rs.getInt(9));
				shoppinguser.setSagree(rs.getString(10));
				
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

	public int updateUser(ShoppingUser shoppinguser, int sid) throws SQLException {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		//이름,이메일,연락처,우편번호,주소,마켓팅동의여부
		String sql="update ShoppingUser set sname=?, semail=?, scontact=?, spost=?, saddress=?, sagree=? where sid=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, shoppinguser.getSname());
			pstmt.setString(2, shoppinguser.getSemail());
			pstmt.setString(3, shoppinguser.getScontact());
			pstmt.setInt(4, shoppinguser.getSpost());
			pstmt.setString(5, shoppinguser.getSaddress());
			pstmt.setString(6, shoppinguser.getSagree());
			pstmt.setInt(7, sid);
			
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateUser() ->"+e.getMessage());
		} finally {
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
		
		return result;
	}
	
}
