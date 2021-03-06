package member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	// ?λΉμ°κ²? ??λ©μ?()
	private Connection getConnection() throws Exception {

		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		return con;
	}

	public void insertMember(MemberDTO mdto) {// ??κ°??

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
	}// insertMember()λ©μ?

	public int userCheck(String mem_id, String mem_pass) {// λ‘κ·Έ?Έ? id/password μ²΄ν¬
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
				if (mem_pass.equals(rs.getString("mem_pass"))) {// λΉλ?λ²νΈκ°? λ§λ κ²½μ°
					check = 1; // ??΄?κ°? ?? κ²½μ°
				} else {
					check = 0; // λΉλ?λ²νΈκ°? ??λ¦? κ²½μ°
				}
			} else {
				check = -1; // ??΄?κ°? ?? κ²½μ°
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
	}// userCheck()λ©μ?

	public MemberDTO getMember(String mem_id) {// ??? λ³? κ°?? Έ?€κΈ?(??? λ³΄μ? ?, ?΄? ₯? ??±?)

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

			if (rs.next()) {// id? ?΄?Ή?? ? λ³΄κ? ??κ²½μ° dto? ???₯
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
	}// getmember()λ©μ?

	public void updateMember(MemberDTO mdto) {// ??? λ³? ?? 

		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			//?΄λ¦μ? λ³?κ²½λΆκ°??₯?κ²? ~ ?λ―?λ‘? ??  X
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
	}// updateMember()λ©μ?

	public void deleteMember(String mem_id) {// ??? λ³? ?? 

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
	}// deleteMember()λ©μ?

}
