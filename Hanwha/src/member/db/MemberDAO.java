package member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	// ?””ë¹„ì—°ê²? ?•˜?Š”ë©”ì†Œ?“œ()
	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		return con;
	}

	public void insertMember(MemberDTO mdto) {// ?šŒ?›ê°??…

		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {

			con = getConnection();

			sql = "insert into member(mem_id, mem_name, mem_pass, mem_phone, mem_email, mem_fore) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getMem_id());
			pstmt.setString(2, mdto.getMem_name());
			pstmt.setString(3, mdto.getMem_pass());
			pstmt.setInt(4, mdto.getMem_phone());
			pstmt.setString(5, mdto.getMem_email());
			pstmt.setInt(6, mdto.getMem_fore());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}// insertMember()ë©”ì†Œ?“œ

	public int userCheck(String mem_id, String mem_pass) {// ë¡œê·¸?¸?‹œ id/password ì²´í¬
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1; //

		try {

			con = getConnection();

			sql = "select mem_pass from member where mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (mem_pass.equals(rs.getString("mem_pass"))) {// ë¹„ë?ë²ˆí˜¸ê°? ë§ëŠ” ê²½ìš°
					check = 1; // ?•„?´?””ê°? ?ˆ?Š” ê²½ìš°
				} else {
					check = 0; // ë¹„ë?ë²ˆí˜¸ê°? ??ë¦? ê²½ìš°
				}
			} else {
				check = -1; // ?•„?´?””ê°? ?—†?Š” ê²½ìš°
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
		}

		return check;
	}// userCheck()ë©”ì†Œ?“œ

	public MemberDTO getMember(String mem_id) {// ?šŒ?›? •ë³? ê°?? ¸?˜¤ê¸?(?šŒ?›? •ë³´ìˆ˜? •?‹œ, ?´? ¥?„œ ?‘?„±?‹œ)

		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO mdto = null;

		try {

			con = getConnection();

			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {// id?— ?•´?‹¹?•˜?Š” ? •ë³´ê? ?ˆ?Š”ê²½ìš° dto?— ???¥
				mdto.setMem_id(rs.getString("mem_id"));
				mdto.setMem_name(rs.getString("mem_name"));
				mdto.setMem_pass(rs.getString("mem_pass"));
				mdto.setMem_phone(rs.getInt("mem_phone"));
				mdto.setMem_email(rs.getString("mem_email"));
				mdto.setMem_fore(rs.getInt("mem_fore"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
		}
		return mdto;
	}// getmember()ë©”ì†Œ?“œ

	public void updateMember(MemberDTO mdto) {// ?šŒ?›? •ë³? ?ˆ˜? •

		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			//?´ë¦„ì? ë³?ê²½ë¶ˆê°??Š¥?•˜ê²? ~ ?•˜ë¯?ë¡? ?ˆ˜? • X
			sql = "update member set mem_pass=?, mem_phone=?, mem_email=?, mem_fore=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getMem_pass());
			pstmt.setInt(2, mdto.getMem_phone());
			pstmt.setString(3, mdto.getMem_email());
			pstmt.setInt(4, mdto.getMem_fore());
			pstmt.setString(5, mdto.getMem_id());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}// updateMember()ë©”ì†Œ?“œ

	public void deleteMember(String mem_id) {// ?šŒ?›? •ë³? ?ˆ˜? •

		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();

			sql = "delete from member where mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}// deleteMember()ë©”ì†Œ?“œ

}
