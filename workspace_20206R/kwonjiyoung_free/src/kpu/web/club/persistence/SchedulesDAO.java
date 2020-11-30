package kpu.web.club.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kpu.web.club.domain.SchedulesVO;

public class SchedulesDAO {
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

	public boolean add(SchedulesVO vo) {
		connect();
		String sql = "insert into schedules values (null,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getSc_year());
			pstmt.setString(5, vo.getSc_month());
			pstmt.setString(6, vo.getSc_day());
			pstmt.setString(7, vo.getStart_time());
			pstmt.setString(8, vo.getEnd_time());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean update(SchedulesVO vo) {
		connect();
		String sql = "update schedules set title=?,sc_year=?,sc_month=?,sc_day=?,start_time=?,end_time=? where uid=?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getSc_year());
			pstmt.setString(3, vo.getSc_month());
			pstmt.setString(4, vo.getSc_day());
			pstmt.setString(5, vo.getStart_time());
			pstmt.setString(6, vo.getEnd_time());
			pstmt.setString(7, Integer.toString(vo.getUid()));

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	public boolean delete(SchedulesVO vo) {
		connect();
		String sql = "delete from schedules where uid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Integer.toString(vo.getUid()));

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public ArrayList<SchedulesVO> getTodoList(String id) {
		connect();
		ArrayList<SchedulesVO> todolist = new ArrayList<SchedulesVO>();
		String sql = "select * from schedules where id= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				SchedulesVO vo = new SchedulesVO();
				vo.setUid(Integer.parseInt(rs.getString("uid")));
				vo.setId(rs.getString("id"));
				vo.setTitle(rs.getString("title"));
				vo.setSc_year(rs.getString("sc_year"));
				vo.setSc_month(rs.getString("sc_month"));
				vo.setSc_day(rs.getString("sc_day"));
				vo.setStart_time(rs.getString("start_time"));
				vo.setEnd_time(rs.getString("end_time"));
				todolist.add(vo);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return todolist;
	}

}
