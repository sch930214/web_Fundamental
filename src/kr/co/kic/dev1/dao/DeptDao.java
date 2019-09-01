package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.kic.dev1.dto.DeptDto;
import kr.co.kic.dev1.util.ConnLocator;

public class DeptDao {
	private static DeptDao single;
	
	private DeptDao() {
		
	}
	
	public static DeptDao getInstance() {
		if(single == null) {
			single = new DeptDao();
		}
		return single;
	}
	public boolean insert(DeptDto d) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO dept(deptno, dname, loc) ");
			sql.append("VALUES(?,?,?) ");
			pstmt = con.prepareStatement(sql.toString());
			int index =1 ;
			pstmt.setInt(index++, d.getDeptno());
			pstmt.setString(index++, d.getDname());
			pstmt.setString(index++, d.getLoc());
			
			pstmt.executeUpdate();
			isSuccess = true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null)con.close();
				if(pstmt != null)pstmt.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return isSuccess;
	}
}
