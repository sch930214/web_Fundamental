package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.kic.dev1.dto.EmpDto;
import kr.co.kic.dev1.util.ConnLocator;

public class EmpDao {
	private static EmpDao single;
	
	private EmpDao() {
		
	}
	
	public static EmpDao getInstance() {
		if(single == null) {
			single = new EmpDao();
		}
		return single;
	}
	public boolean insert(EmpDto e) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) ");
			sql.append("VALUES(?,?,?,?,?,?,?,?) ");
			pstmt = con.prepareStatement(sql.toString());
			int index = 1;
			pstmt.setInt(index++, e.getEmpno());
			pstmt.setString(index++, e.getEname());
			pstmt.setString(index++, e.getJob());
			pstmt.setInt(index++, e.getMgr());
			pstmt.setString(index++, e.getHiredate());
			pstmt.setInt(index++, e.getSal());
			pstmt.setInt(index++, e.getComm());
			pstmt.setInt(index++, e.getDeptno());
			
			pstmt.executeUpdate();
			isSuccess = true;
			
		} catch (SQLException e2) {
			e2.printStackTrace();
		} finally {
			try {
				if(con != null)con.close();
				if(pstmt != null)pstmt.close();
			} catch (SQLException e3) {
				e3.printStackTrace();
			}
		}
		return isSuccess;
	}
}
