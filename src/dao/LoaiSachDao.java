package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.LoaiSach;
import util.KiemTraNgayThang;

public class LoaiSachDao implements ITFLoaiSachDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	private ResultSetMetaData rsmData;
	
	@Override
	public boolean insert(LoaiSach ls) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Insert into LoaiSach(MaLoaiSach, TenLoaiSach) Values(?,?)";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, ls.getMaLoaiSach());
			pStatement.setNString(2, ls.getTenLoaiSach());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi insert LoaiSach: " + e.toString());
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
	public boolean update(LoaiSach ls) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update LoaiSach Set MaLoaiSach= ?, TenLoaiSach= ? Where MaLoaiSach=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, ls.getMaLoaiSach());
			pStatement.setNString(2, ls.getTenLoaiSach());
			pStatement.setString(3, ls.getMaLoaiSach());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update LoaiSach: " + e.toString());
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
	public boolean delete(String maLoaiSach) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Delete From LoaiSach Where MaLoaiSach=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maLoaiSach);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi delete LoaiSach: " + e.toString());
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
	public LoaiSach getLoaiSach(String maLS) {
		ketNoiDatabase = new KetNoiDatabase();
		LoaiSach loaiSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaLoaiSach, TenLoaiSach From LoaiSach Where MaLoaiSach=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maLS);
			rs = pStatement.executeQuery();
			if( rs.next() ) {
				loaiSach = new LoaiSach();
				loaiSach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				loaiSach.setTenLoaiSach(rs.getNString("TenLoaiSach"));
			}
			conn.commit();
			return loaiSach;
		} catch (SQLException e) {
			System.out.println("Loi truy van LoaiSach: " + e.toString());
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

	@Override
	public List<LoaiSach> getDSLoaiSach() {
		ketNoiDatabase = new KetNoiDatabase();
		List<LoaiSach> dsLoaiSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaLoaiSach, TenLoaiSach From LoaiSach";
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			dsLoaiSach = new ArrayList<LoaiSach>();
			while( rs.next() ) {
				LoaiSach loaiSach = new LoaiSach();
				loaiSach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				loaiSach.setTenLoaiSach(rs.getNString("TenLoaiSach"));
				dsLoaiSach.add(loaiSach);
			}
			conn.commit();
			return dsLoaiSach;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach LoaiSach: " + e.toString());
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

	@Override
	public List<LoaiSach> hienThiMenuDoc() {
		List<LoaiSach> dsLoaiSach = this.getDSLoaiSach();
		if( dsLoaiSach != null ) {
			return dsLoaiSach;
		}
		return null;
	}

}
