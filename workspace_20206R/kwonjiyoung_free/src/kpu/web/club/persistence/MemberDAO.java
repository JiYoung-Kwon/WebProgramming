package kpu.web.club.persistence;

import java.sql.*;
import java.util.*;
import kpu.web.club.domain.MemberVO;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";

	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "jspbook", "passwd");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean add(MemberVO vo) {
		connect();
		String sql = "insert into member values (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getUsername());
			pstmt.setString(4, vo.getSnum());
			pstmt.setString(5, vo.getDepart());
			pstmt.setString(6, vo.getMobile());
			pstmt.setString(7, vo.getEmail());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean update(MemberVO vo) {
		connect();
		String sql = "update member set passwd=?,username=?,snum=?,depart=?,mobile=?,email=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getPasswd());
			pstmt.setString(2, vo.getUsername());
			pstmt.setString(3, vo.getSnum());
			pstmt.setString(4, vo.getDepart());
			pstmt.setString(5, vo.getMobile());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getId());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public ArrayList<MemberVO> getStudentList() {
		connect();
		ArrayList<MemberVO> studentlist = new ArrayList<MemberVO>();
		String sql = "select * from member";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setUsername(rs.getString("username"));
				vo.setSnum(rs.getString("snum"));
				vo.setDepart(rs.getString("depart"));
				vo.setMobile(rs.getString("mobile"));
				vo.setEmail(rs.getString("email"));
				studentlist.add(vo);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return studentlist;
	}

	public MemberVO read(String id) {
		MemberVO vo = new MemberVO();
		connect();
		String sql = "select * from member where id= ?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setUsername(rs.getString("username"));
				vo.setSnum(rs.getString("snum"));
				vo.setDepart(rs.getString("depart"));
				vo.setMobile(rs.getString("mobile"));
				vo.setEmail(rs.getString("email"));
			}
			rs.close();
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return vo;
	}

	// 로그인을 시도하는 함수****

	public int login(String userID, String userPassword) {
		connect();
		String SQL = "select passwd from member where id= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				// 패스워드 일치한다면 실행
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음 오류
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류를 의미

	}

}
