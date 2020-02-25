package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.NVList;

import model.NhanVien;
import util.KiemTraNgayThang;

public class NhanVienDao implements ITFNhanVienDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	
	@Override
	public boolean insert(NhanVien nv) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Insert into NhanVien(TenNV, ChucVu , MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi) Values(?,?,?,?,?,?,?,?)";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, nv.getTenNV());
			pStatement.setNString(2, nv.getChucVu());
			pStatement.setNString(3, nv.getMatKhau());
			pStatement.setNString(4, nv.getEmail());
			pStatement.setNString(5, nv.getDienThoai());
			pStatement.setNString(6, nv.getGioiTinh());
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			String ngaySinh = dateFormat.format(nv.getNgaySinh());
			pStatement.setString(7, ngaySinh);
			pStatement.setNString(8, nv.getDiaChi());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi insert tai khoan NhanVien: " + e.toString());
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
	public boolean update(NhanVien nv) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update NhanVien Set TenNV= ?, ChucVu=? , MatKhau= ?, Email= ?, DienThoai= ?, GioiTinh= ?, NgaySinh= ?, DiaChi= ? Where MaNV=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, nv.getTenNV());
			pStatement.setNString(2, nv.getChucVu());
			pStatement.setNString(3, nv.getMatKhau());
			pStatement.setNString(4, nv.getEmail());
			pStatement.setNString(5, nv.getDienThoai());
			pStatement.setNString(6, nv.getGioiTinh());
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			String ngaySinh = dateFormat.format(nv.getNgaySinh());
			pStatement.setString(7, ngaySinh);
			pStatement.setNString(8, nv.getDiaChi());
			pStatement.setInt(9, nv.getMaNV());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update tai khoan NhanVien: " + e.toString());
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
	public boolean updatePassWord(int maNV, String matKhau) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update NhanVien Set MatKhau= ? Where MaNV=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, matKhau);
			pStatement.setInt(2, maNV);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update PassWord NhanVien: " + e.toString());
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
	public boolean delete(int maNV) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Delete From NhanVien Where MaNV = ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, maNV);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi delete tai khoan NhanVien: " + e.toString());
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
	public NhanVien getNhanVien(String email) {
		ketNoiDatabase = new KetNoiDatabase();
		NhanVien nhanVien = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaNV, TenNV, ChucVu, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi From NhanVien Where Email=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, email);
			rs = pStatement.executeQuery();
			if( rs.next() ) {
				nhanVien = new NhanVien();
				nhanVien.setMaNV(rs.getInt("MaNV"));
				nhanVien.setTenNV(rs.getString("TenNV"));
				nhanVien.setChucVu(rs.getString("ChucVu"));
				nhanVien.setMatKhau(rs.getString("MatKhau"));
				nhanVien.setEmail(rs.getString("Email"));
				nhanVien.setDienThoai(rs.getString("DienThoai"));
				nhanVien.setGioiTinh(rs.getString("GioiTinh"));
				nhanVien.setNgaySinh(rs.getDate("NgaySinh"));
				nhanVien.setDiaChi(rs.getString("DiaChi"));
			}
			conn.commit();
			return nhanVien;
		} catch (SQLException e) {
			System.out.println("Loi truy van lay ra NhanVien theo Email: " + e.toString());
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
	public NhanVien getNhanVien(int maNV) {
		ketNoiDatabase = new KetNoiDatabase();
		NhanVien nhanVien = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaNV, TenNV, ChucVu, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi From NhanVien Where MaNV=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, maNV);
			rs = pStatement.executeQuery();
			if( rs.next() ) {
				nhanVien = new NhanVien();
				nhanVien.setMaNV(rs.getInt("MaNV"));
				nhanVien.setTenNV(rs.getString("TenNV"));
				nhanVien.setChucVu(rs.getString("ChucVu"));
				nhanVien.setMatKhau(rs.getString("MatKhau"));
				nhanVien.setEmail(rs.getString("Email"));
				nhanVien.setDienThoai(rs.getString("DienThoai"));
				nhanVien.setGioiTinh(rs.getString("GioiTinh"));
				nhanVien.setNgaySinh(rs.getDate("NgaySinh"));
				nhanVien.setDiaChi(rs.getString("DiaChi"));
			}
			conn.commit();
			return nhanVien;
		} catch (SQLException e) {
			System.out.println("Loi truy van lay ra NhanVien theo MaNV: " + e.toString());
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
	public List<NhanVien> getDSNhanVien(){
		ketNoiDatabase = new KetNoiDatabase();
		List<NhanVien> dsNhanVien = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaNV, TenNV, ChucVu, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi "
						+ "From NhanVien ";
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			dsNhanVien = new ArrayList<>();
			while( rs.next() ) {
				NhanVien nhanVien = new NhanVien();
				nhanVien.setMaNV(rs.getInt("MaNV"));
				nhanVien.setTenNV(rs.getString("TenNV"));
				nhanVien.setChucVu(rs.getString("ChucVu"));
				nhanVien.setMatKhau(rs.getString("MatKhau"));
				nhanVien.setEmail(rs.getString("Email"));
				nhanVien.setDienThoai(rs.getString("DienThoai"));
				nhanVien.setGioiTinh(rs.getString("GioiTinh"));
				nhanVien.setNgaySinh(rs.getDate("NgaySinh"));
				nhanVien.setDiaChi(rs.getString("DiaChi"));
				dsNhanVien.add(nhanVien);
			}
			conn.commit();
			return dsNhanVien;
		} catch (SQLException e) {
			System.out.println("Loi truy van lay ra danh sach NhanVien: " + e.toString());
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
	public List<NhanVien> getDSNhanVienTheoChuVu(String chucVu){
		ketNoiDatabase = new KetNoiDatabase();
		List<NhanVien> dsNhanVien = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaNV, TenNV, ChucVu, MatKhau, Email, DienThoai, GioiTinh, NgaySinh, DiaChi "
						+ "From NhanVien "
						+ "Where ChucVu like ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, chucVu);
			rs = pStatement.executeQuery();
			dsNhanVien = new ArrayList<>();
			while( rs.next() ) {
				NhanVien nhanVien = new NhanVien();
				nhanVien.setMaNV(rs.getInt("MaNV"));
				nhanVien.setTenNV(rs.getString("TenNV"));
				nhanVien.setChucVu(rs.getString("ChucVu"));
				nhanVien.setMatKhau(rs.getString("MatKhau"));
				nhanVien.setEmail(rs.getString("Email"));
				nhanVien.setDienThoai(rs.getString("DienThoai"));
				nhanVien.setGioiTinh(rs.getString("GioiTinh"));
				nhanVien.setNgaySinh(rs.getDate("NgaySinh"));
				nhanVien.setDiaChi(rs.getString("DiaChi"));
				dsNhanVien.add(nhanVien);
			}
			conn.commit();
			return dsNhanVien;
		} catch (SQLException e) {
			System.out.println("Loi truy van lay ra danh sach NhanVien theo ChucVu: " + e.toString());
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
	public NhanVien dangNhap(String email, String matKhau) {
		NhanVien nhanVien = this.getNhanVien(email);
		if( nhanVien != null && matKhau.equals(nhanVien.getMatKhau()) ) {
			return nhanVien;
		}
		return null;
	}

	@Override
	public boolean kiemTraEmailTonTai(String email) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select * From NhanVien Where Email= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1,email);
			rs = pStatement.executeQuery();
			conn.commit();
			if( rs.next() ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi truy van theo email NhanVien: " + e.toString());
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
			String sql = "Select * From NhanVien Where DienThoai= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1,dienThoai);
			rs = pStatement.executeQuery();
			conn.commit();
			if( rs.next() ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi truy van theo dienThoai NhanVien: " + e.toString());
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
