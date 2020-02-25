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

import model.ChiTietHoaDon;
import model.HoaDon;
import model.KhachHang;
import model.Sach;
import util.KiemTraNgayThang;

public class ChiTietHoaDonDao implements ITFChiTietHoaDonDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	
	@Override
	public boolean insert(ChiTietHoaDon cthd) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Insert into ChiTietHoaDon(SoHD, MaSach, SoLuong, DonGia) Values(?,?,?,?)";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, cthd.getSoHD());
			pStatement.setString(2, cthd.getMaSach());
			pStatement.setInt(3, cthd.getSoLuong());
			pStatement.setFloat(4, cthd.getDonGia());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi insert ChiTietHoaDon: " + e.toString());
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
	public boolean update(ChiTietHoaDon cthd) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update ChiTietHoaDon Set SoLuong= ?, DonGia= ? Where SoHD= ? And MaSach= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, cthd.getSoLuong());
			pStatement.setFloat(2, cthd.getDonGia());
			pStatement.setInt(3, cthd.getSoHD());
			pStatement.setString(4, cthd.getMaSach());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update ChiTietHoaDon: " + e.toString());
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
	public boolean delete(int soHD, String maSach) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Delete From ChiTietHoaDon Where SoHD= ? And MaSach= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, soHD);
			pStatement.setString(2, maSach);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi delete ChiTietHoaDon: " + e.toString());
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
	public Map<String, Object> xemThongTinDonHang(int soHD) {
		ketNoiDatabase = new KetNoiDatabase();
		Map<String, Object> thongTinDH = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select ChiTietHoaDon.SoHD, ChiTietHoaDon.MaSach, ChiTietHoaDon.SoLuong, ChiTietHoaDon.DonGia, " +
						 "Sach.TenSach, Sach.UrlHinh, HoaDon.ThayDoiNN, HoaDon.TongTien, HoaDon.NgayDat, " + 
						 "HoaDon.NgayGiao, HoaDon.TinhTrangDH, HoaDon.MaKH " +
						 "From ChiTietHoaDon " + 
						 "Inner Join HoaDon On (ChiTietHoaDon.SoHD = HoaDon.SoHD And HoaDon.SoHD =?) " + 
						 "Inner Join Sach On ChiTietHoaDon.MaSach = Sach.MaSach";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, soHD);
			rs = pStatement.executeQuery();
			thongTinDH = new HashMap<>();
			if( rs.next() ) {
				
				HoaDon hd = new HoaDon();
				hd.setSoHD(rs.getInt("SoHD"));
				hd.setThayDoiNN(rs.getString("ThayDoiNN"));
				hd.setTongTien(rs.getFloat("TongTien"));
				hd.setNgayDat(rs.getDate("NgayDat"));
				hd.setNgayGiao(rs.getDate("NgayGiao"));
				hd.setTinhTrangDH(rs.getString("TinhTrangDH"));
				hd.setMaKH(rs.getInt("MaKH"));
				
				thongTinDH.put("HoaDon", hd);
				
				
				List<HashMap> dsChiTietHD  = new ArrayList<>();
				
				ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
				chiTietHoaDon.setSoHD(rs.getInt("SoHD"));
				chiTietHoaDon.setMaSach(rs.getString("MaSach"));
				chiTietHoaDon.setSoLuong(rs.getInt("SoLuong"));
				chiTietHoaDon.setDonGia(rs.getFloat("DonGia"));
				
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));;
				sach.setTenSach(rs.getString("TenSach"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				
				HashMap hashMap = new HashMap<>();
				hashMap.put("ChiTietHoaDon", chiTietHoaDon);
				hashMap.put("Sach", sach);
				
				dsChiTietHD.add(hashMap);
				while(rs.next()) {
					chiTietHoaDon = new ChiTietHoaDon();
					chiTietHoaDon.setSoHD(rs.getInt("SoHD"));
					chiTietHoaDon.setMaSach(rs.getString("MaSach"));
					chiTietHoaDon.setSoLuong(rs.getInt("SoLuong"));
					chiTietHoaDon.setDonGia(rs.getFloat("DonGia"));
					
					sach = new Sach();
					sach.setMaSach(rs.getString("MaSach"));;
					sach.setTenSach(rs.getString("TenSach"));
					sach.setUrlHinh(rs.getString("UrlHinh"));
					
					hashMap = new HashMap<>();
					hashMap.put("ChiTietHoaDon", chiTietHoaDon);
					hashMap.put("Sach", sach);
					
					dsChiTietHD.add(hashMap);
				}
				thongTinDH.put("DanhSachChiTietHoaDon", dsChiTietHD);
			}
			
			conn.commit();
			return thongTinDH;
		} catch (SQLException e) {
			System.out.println("Loi truy van tim kiem HoaDon trong ChiTietHoaDon: " + e.toString());
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
