package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.HoaDon;
import model.NguoiNhanHang;
import model.Sach;
import util.KiemTraNgayThang;

public class HoaDonDao implements ITFHoaDonDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	
	//Dung khi khong dung Trigger tinh TongTien
//	@Override
//	public int insert(HoaDon hd) {
//		ketNoiDatabase = new KetNoiDatabase();
//		try {
//			conn = ketNoiDatabase.getConn();
//			conn.setAutoCommit(false);
//			String sql = "Insert into HoaDon(IDNN, PhiGiaoHang, TongTien, NgayDat, TinhTrangDH, MaKH) Values(?,?,?,?,?,?)";
//			pStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//			pStatement.setInt(1, hd.getIdNN());
//			pStatement.setFloat(2, hd.getPhiGiaoHang());
//			pStatement.setFloat(3, hd.getTongTien());
//			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
//			pStatement.setString(4, dateFormat.format(hd.getNgayDat()));
//			pStatement.setNString(5, hd.getTinhTrangDH());
//			if( hd.getMaKH() == 0 ) {
//				pStatement.setNull(6, java.sql.Types.INTEGER);
//			}else {
//				pStatement.setInt(6, hd.getMaKH());
//			}
//			pStatement.executeUpdate();
//			int soHD = -1;
//			rs = pStatement.getGeneratedKeys();
//			if( rs.next() ) {
//				soHD = rs.getInt(1);
//			}
//			conn.commit();
//			return soHD;
//		} catch (SQLException e) {
//			System.out.println("Loi insert HoaDon: " + e.toString());
//			try {
//                conn.rollback();
//            } catch (SQLException ex1) {
//                System.out.println("Loi rollback");
//            }
//		}finally {
//			try {
//				pStatement.close();
//			} catch (SQLException e) {
//				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
//			}
//			ketNoiDatabase.closeConnection(conn);
//		}
//		return -1;
//	}
	
	//Dung khi co Trigger tinh TongTien
	@Override
	public int insert(HoaDon hd) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Insert into HoaDon(ThayDoiNN, NgayDat, TinhTrangDH, MaKH) Values(?,?,?,?)";
			pStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pStatement.setString(1, hd.getThayDoiNN());
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			pStatement.setString(2, dateFormat.format(hd.getNgayDat()));
			pStatement.setNString(3, hd.getTinhTrangDH());
			if( hd.getMaKH() == 0 ) {
				pStatement.setNull(4, java.sql.Types.INTEGER);
			}else {
				pStatement.setInt(4, hd.getMaKH());
			}
			pStatement.executeUpdate();
			int soHD = -1;
			rs = pStatement.getGeneratedKeys();
			if( rs.next() ) {
				soHD = rs.getInt(1);
			}
			conn.commit();
			return soHD;
		} catch (SQLException e) {
			System.out.println("Loi insert HoaDon: " + e.toString());
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
	public boolean xulyDonHang(int soHD, int maNVGiao,  String tinhTrangDonHang) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update HoaDon Set MaNVGiao= ?, TinhTrangDH= ? Where SoHD= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setFloat(1, maNVGiao);
			pStatement.setNString(2, tinhTrangDonHang);
			pStatement.setInt(3, soHD);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi xu ly HoaDon: " + e.toString());
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
	public boolean updateThayDoiNN(int soHD, String thayDoiNN) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update HoaDon Set ThayDoiNN= ? Where SoHD= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, thayDoiNN);
			pStatement.setInt(2, soHD);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update thayDoiNN HoaDon: " + e.toString());
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
	public boolean updateTinhTrangDonHang(int soHD, String tinhTrangDonHang, String ngayGiao) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update HoaDon Set TinhTrangDH= ?, NgayGiao=? Where SoHD= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, tinhTrangDonHang);
			if( ngayGiao.equals("") ){
				pStatement.setNull(2, java.sql.Types.VARCHAR);
			}
			else {
				pStatement.setString(2, ngayGiao);
			}
			pStatement.setInt(3, soHD);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update tinh trang HoaDon: " + e.toString());
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
	public boolean khoUpdateTinhTrangDonHang(int soHD, String tinhTrangDonHang) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update HoaDon Set TinhTrangDH= ? Where SoHD= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, tinhTrangDonHang);
			pStatement.setInt(2, soHD);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi kho update tinh trang HoaDon: " + e.toString());
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
	public boolean updateTongTien(float tongTien, int soHD) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update HoaDon Set TongTien= ? Where SoHD= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setFloat(1, tongTien);
			pStatement.setInt(2, soHD);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update tongTien HoaDon: " + e.toString());
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
			String sql = "Delete From HoaDon Where SoHD= ?";
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
			System.out.println("Loi delete HoaDon: " + e.toString());
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
	public HoaDon getHoaDon(int soHD) {
		ketNoiDatabase = new KetNoiDatabase();
		HoaDon hoaDon = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select SoHD, ThayDoiNN, TongTien, NgayDat, NgayGiao, TinhTrangDH, MaNVGiao, MaKH " + 
						 "From HoaDon " + 
						 "Where SoHD= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, soHD);
			rs = pStatement.executeQuery();
			hoaDon = new HoaDon();
			if( rs.next() ) {
				hoaDon.setSoHD(rs.getInt("SoHD"));
				hoaDon.setThayDoiNN(rs.getString("ThayDoiNN"));
				hoaDon.setTongTien(rs.getFloat("TongTien"));
				hoaDon.setNgayDat(rs.getDate("NgayDat"));
				hoaDon.setNgayGiao(rs.getDate("NgayGiao"));
				hoaDon.setTinhTrangDH(rs.getString("TinhTrangDH"));
				hoaDon.setMaNVGiao(rs.getInt("MaNVGiao"));
				hoaDon.setMaKH(rs.getInt("MaKH"));
			}
			conn.commit();
			return hoaDon;
		} catch (SQLException e) {
			System.out.println("Loi truy van Sach trong table Sach: " + e.toString());
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
	public List<HoaDon> dsDonHangTheoTinhTrang(String tinhTrangDH) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> dsDonHangTheoKhachHang(int maKH) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Object> dsDonHang = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select HoaDon.SoHD, ThayDoiNN, TongTien, NgayDat, NgayGiao, TinhTrangDH, MaNVGiao, HoaDon.MaKH, TenKH, DienThoai, DiaChi " + 
						 "From HoaDon Join KhachHang " + 
						 "On HoaDon.MaKH = KhachHang.MaKH And HoaDon.MaKH=? ";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, maKH);
			rs = pStatement.executeQuery();
			dsDonHang = new ArrayList<Object>();
			while( rs.next() ) {
				Map<String, Object>  chiTietDonHang = new HashMap<String, Object>();
				
				HoaDon hdb = new HoaDon();
				hdb.setSoHD(rs.getInt("SoHD"));
				hdb.setThayDoiNN(rs.getString("ThayDoiNN"));
				hdb.setTongTien(rs.getFloat("TongTien"));
				hdb.setNgayDat(rs.getDate("NgayDat"));
				hdb.setNgayGiao(rs.getDate("NgayGiao"));
				hdb.setTinhTrangDH(rs.getString("TinhTrangDH"));
				hdb.setMaNVGiao(rs.getInt("MaNVGiao"));
				hdb.setMaKH(rs.getInt("MaKH"));
				
				NguoiNhanHang nguoiNhanHang = null;
				if(rs.getString("ThayDoiNN").equals("Co")) {//Nếu Nguoi Khac nhan thi truy xuat thêm Table NguoiNhanHang
					NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();
					nguoiNhanHang = nguoiNhanHangDao.getNguoiNhanHang(rs.getInt("SoHD"));
				}
				else if(rs.getString("ThayDoiNN").equals("Khong")) {//Neu Chinh KhachHang nhan thi lay thong tin gan cho NguoiNhanHang
					nguoiNhanHang = new NguoiNhanHang();
					nguoiNhanHang.setTenNN((rs.getString("TenKH")));
					nguoiNhanHang.setSoHD(rs.getInt("SoHD"));
					nguoiNhanHang.setDienThoai(rs.getString("DienThoai"));
					nguoiNhanHang.setDiaChi(rs.getString("DiaChi"));
				}
					
				chiTietDonHang.put("HoaDon",hdb);
				chiTietDonHang.put("NguoiNhanHang",nguoiNhanHang);
				dsDonHang.add(chiTietDonHang);
			}
			conn.commit();
			return dsDonHang;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach DonHang theo MaKH: " + e.toString());
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
	public List<Object> dsDonHangVaKhachHangTheoNVGiao(int maNV) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Object> dsDonHangVaKhachHang = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select HoaDon.SoHD, ThayDoiNN, TongTien, NgayDat, NgayGiao, TinhTrangDH, MaNVGiao, HoaDon.MaKH,  TenKH, DienThoai, DiaChi " + 
						 "From HoaDon Join KhachHang " + 
						 "On (HoaDon.MaKH = KhachHang.MaKH And MaNVGiao = ?)";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, maNV);
			rs = pStatement.executeQuery();
			dsDonHangVaKhachHang = new ArrayList();
			while( rs.next() ) {
				Map<String, Object>  chiTietDonHang = new HashMap();
				
				HoaDon hdb = new HoaDon();
				hdb.setSoHD(rs.getInt("SoHD"));
				hdb.setThayDoiNN(rs.getString("ThayDoiNN"));
				hdb.setTongTien(rs.getFloat("TongTien"));
				hdb.setNgayDat(rs.getDate("NgayDat"));
				hdb.setNgayGiao(rs.getDate("NgayGiao"));
				hdb.setTinhTrangDH(rs.getString("TinhTrangDH"));
				hdb.setMaNVGiao(rs.getInt("MaNVGiao"));
				hdb.setMaKH(rs.getInt("MaKH"));
				
				NguoiNhanHang nguoiNhanHang = null;
				if(rs.getString("ThayDoiNN").equals("Co")) {//Nếu Nguoi Khac nhan thi truy xuat thêm Table NguoiNhanHang
					NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();
					nguoiNhanHang = nguoiNhanHangDao.getNguoiNhanHang(rs.getInt("SoHD"));
				}
				else if(rs.getString("ThayDoiNN").equals("Khong")) {//Neu Chinh KhachHang nhan thi lay thong tin gan cho NguoiNhanHang
					nguoiNhanHang = new NguoiNhanHang();
					nguoiNhanHang.setTenNN((rs.getString("TenKH")));
					nguoiNhanHang.setSoHD(rs.getInt("SoHD"));
					nguoiNhanHang.setDienThoai(rs.getString("DienThoai"));
					nguoiNhanHang.setDiaChi(rs.getString("DiaChi"));
				}
				
				chiTietDonHang.put("HoaDon",hdb);
				chiTietDonHang.put("NguoiNhanHang",nguoiNhanHang);
				dsDonHangVaKhachHang.add(chiTietDonHang);
			}
			conn.commit();
			return dsDonHangVaKhachHang;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach DonHang: " + e.toString());
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
	public List<Object> dsDonHangVaKhachHang() {
		ketNoiDatabase = new KetNoiDatabase();
		List<Object> dsDonHangVaKhachHang = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select HoaDon.SoHD, ThayDoiNN, TongTien, NgayDat, NgayGiao, TinhTrangDH, MaNVGiao, HoaDon.MaKH,  TenKH, DienThoai, DiaChi " + 
					"From HoaDon Join KhachHang " + 
					"On HoaDon.MaKH = KhachHang.MaKH";
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			dsDonHangVaKhachHang = new ArrayList();
			while( rs.next() ) {
				Map<String, Object>  chiTietDonHang = new HashMap();
				
				HoaDon hdb = new HoaDon();
				hdb.setSoHD(rs.getInt("SoHD"));
				hdb.setThayDoiNN(rs.getString("ThayDoiNN"));
				hdb.setTongTien(rs.getFloat("TongTien"));
				hdb.setNgayDat(rs.getDate("NgayDat"));
				hdb.setNgayGiao(rs.getDate("NgayGiao"));
				hdb.setTinhTrangDH(rs.getString("TinhTrangDH"));
				hdb.setMaNVGiao(rs.getInt("MaNVGiao"));
				hdb.setMaKH(rs.getInt("MaKH"));
				
				NguoiNhanHang nguoiNhanHang = null;
				if(rs.getString("ThayDoiNN").equals("Co")) {//Nếu Nguoi Khac nhan thi truy xuat thêm Table NguoiNhanHang
					NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();
					nguoiNhanHang = nguoiNhanHangDao.getNguoiNhanHang(rs.getInt("SoHD"));
				}
				else if(rs.getString("ThayDoiNN").equals("Khong")) {//Neu Chinh KhachHang nhan thi lay thong tin gan cho NguoiNhanHang
					nguoiNhanHang = new NguoiNhanHang();
					nguoiNhanHang.setTenNN((rs.getString("TenKH")));
					nguoiNhanHang.setSoHD(rs.getInt("SoHD"));
					nguoiNhanHang.setDienThoai(rs.getString("DienThoai"));
					nguoiNhanHang.setDiaChi(rs.getString("DiaChi"));
				}
				
				chiTietDonHang.put("HoaDon",hdb);
				chiTietDonHang.put("NguoiNhanHang",nguoiNhanHang);
				dsDonHangVaKhachHang.add(chiTietDonHang);
			}
			conn.commit();
			return dsDonHangVaKhachHang;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach DonHang: " + e.toString());
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
