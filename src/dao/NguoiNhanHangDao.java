package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.NguoiNhanHang;

public class NguoiNhanHangDao implements ITFNguoiNhanHangDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	
	@Override
	public int insert(NguoiNhanHang nnh) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Insert into NguoiNhanHang(SoHD, TenNN, DienThoai, DiaChi) Values(?,?,?,?)";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, nnh.getSoHD());
			pStatement.setNString(2, nnh.getTenNN());
			pStatement.setNString(3, nnh.getDienThoai());
			pStatement.setNString(4, nnh.getDiaChi());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return 1;
			}
			
			return -1;
		} catch (SQLException e) {
			System.out.println("Loi insert NguoiNhanHang: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		return -1;
	}

	@Override
	public boolean update(NguoiNhanHang nnh) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update NguoiNhanHang Set TenNN = ?, DienThoai= ?, DiaChi= ? Where SoHD= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, nnh.getTenNN());
			pStatement.setNString(2, nnh.getDienThoai());
			pStatement.setNString(3, nnh.getDiaChi());
			pStatement.setInt(4, nnh.getSoHD());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update NguoiNhanHang: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		return false;
	}

	@Override
	public boolean delete(int soHD) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Delete From NguoiNhanHang Where SoHD= ?";
			pStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pStatement.setInt(1, soHD);
			pStatement.executeUpdate();
			int idnn = -1;
			rs = pStatement.getGeneratedKeys();
			conn.commit();
			if( rs.next() ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi delete NguoiNhanHang: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		return false;
	}

	@Override
	public NguoiNhanHang getNguoiNhanHang(int soHD) {
		ketNoiDatabase = new KetNoiDatabase();
		NguoiNhanHang nnh = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select SoHD, TenNN, DienThoai, DiaChi From NguoiNhanHang Where SoHD=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, soHD);
			rs = pStatement.executeQuery();
			if( rs.next() ) {
				nnh = new NguoiNhanHang();
				nnh.setSoHD(rs.getInt("SoHD"));
				nnh.setTenNN(rs.getString("TenNN"));
				nnh.setDienThoai(rs.getString("DienThoai"));
				nnh.setDiaChi(rs.getString("DiaChi"));
			}
			conn.commit();
			return nnh;
		} catch (SQLException e) {
			System.out.println("Loi truy van lay ra NguoiNhanHang theo IDNN: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		
		return null;
	}

}
