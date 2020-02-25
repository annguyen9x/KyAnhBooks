package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import model.KhachHang;
import util.KiemTraNgayThang;

public class KhachHangDao implements ITFKhachHangDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	
	@Override
	public boolean insert(KhachHang kh) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Insert into KhachHang(TenKH , MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) Values(?,?,?,?,?,?,?)";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, kh.getTenKH());
			pStatement.setNString(2, kh.getMatKhau());
			pStatement.setNString(3, kh.getEmail());
			pStatement.setNString(4, kh.getDienThoai());
			pStatement.setNString(5, kh.getGioiTinh());
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			String ngaySinh = dateFormat.format(kh.getNgaySinh());
			pStatement.setString(6, ngaySinh);
			pStatement.setNString(7, kh.getDiaChi());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi insert tai khoan KhachHang: " + e.toString());
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
	public boolean update(KhachHang kh) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update KhachHang Set TenKH= ? , MatKhau= ?, Email= ?, DienThoai= ?, GioiTinh= ?, NgaySinh= ?, DiaChi= ? Where MaKH=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, kh.getTenKH());
			pStatement.setNString(2, kh.getMatKhau());
			pStatement.setNString(3, kh.getEmail());
			pStatement.setNString(4, kh.getDienThoai());
			pStatement.setNString(5, kh.getGioiTinh());
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			String ngaySinh = dateFormat.format(kh.getNgaySinh());
			pStatement.setString(6, ngaySinh);
			pStatement.setNString(7, kh.getDiaChi());
			pStatement.setInt(8, kh.getMaKH());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update tai khoan KhachHang: " + e.toString());
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
	public boolean delete(KhachHang kh) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Delete From KhachHang Where MaKH = ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, kh.getMaKH());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi delete tai khoan KhachHang: " + e.toString());
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
	public KhachHang getKhachHang(String email) {
		ketNoiDatabase = new KetNoiDatabase();
		KhachHang kh = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaKH, TenKH, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi From KhachHang Where Email=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, email);
			rs = pStatement.executeQuery();
			if( rs.next() ) {
				kh = new KhachHang();
				kh.setMaKH(rs.getInt("MaKH"));
				kh.setTenKH(rs.getString("TenKH"));
				kh.setMatKhau(rs.getString("MatKhau"));
				kh.setEmail(rs.getString("Email"));
				kh.setDienThoai(rs.getString("DienThoai"));
				kh.setGioiTinh(rs.getString("GioiTinh"));
				kh.setNgaySinh(rs.getDate("NgaySinh"));
				kh.setDiaChi(rs.getString("DiaChi"));
			}
			conn.commit();
			return kh;
		} catch (SQLException e) {
			System.out.println("Loi truy van lay ra KhachHang theo Email: " + e.toString());
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
	public KhachHang getKhachHang(int maKH) {
		ketNoiDatabase = new KetNoiDatabase();
		KhachHang kh = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaKH, TenKH, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi From KhachHang Where MaKH=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, maKH);
			rs = pStatement.executeQuery();
			if( rs.next() ) {
				kh = new KhachHang();
				kh.setMaKH(rs.getInt("MaKH"));
				kh.setTenKH(rs.getString("TenKH"));
				kh.setMatKhau(rs.getString("MatKhau"));
				kh.setEmail(rs.getString("Email"));
				kh.setDienThoai(rs.getString("DienThoai"));
				kh.setGioiTinh(rs.getString("GioiTinh"));
				kh.setNgaySinh(rs.getDate("NgaySinh"));
				kh.setDiaChi(rs.getString("DiaChi"));
			}
			conn.commit();
			return kh;
		} catch (SQLException e) {
			System.out.println("Loi truy van lay ra KhachHang theo MaKH: " + e.toString());
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
	public List<KhachHang> getDSKhachHang() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public KhachHang dangNhap(String email, String matKhau) {
		KhachHang khachhang = this.getKhachHang(email);
		if( khachhang != null && matKhau.equals(khachhang.getMatKhau()) ) {
			return khachhang;
		}
		return null;
	}

	@Override
	public boolean kiemTraEmailTonTai(String email) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select * From KhachHang Where Email= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1,email);
			rs = pStatement.executeQuery();
			conn.commit();
			if( rs.next() ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi truy van theo email KhachHang: " + e.toString());
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
	public boolean kiemTraDienThoaiTonTai(String dienThoai) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select * From KhachHang Where DienThoai= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1,dienThoai);
			rs = pStatement.executeQuery();
			conn.commit();
			if( rs.next() ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi truy van theo dien thoai KhachHang: " + e.toString());
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

}
