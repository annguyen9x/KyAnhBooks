package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;

import model.NhapSach;
import util.KiemTraNgayThang;

public class NhapSachDao implements ITFNhapSachDao {
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;

	@Override
	public boolean insert(NhapSach nhapSach) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Insert into NhapSach(MaNS, MaNVKho, MaSach, SoLuongNhap, NgayNhap) Values(?,?,?,?,?)";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1,nhapSach.getMaNS());
			pStatement.setInt(2, nhapSach.getMaNVKho());
			pStatement.setString(3, nhapSach.getMaSach());
			pStatement.setInt(4, nhapSach.getSoLuongNhap());
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			String ngayNhap = dateFormat.format(nhapSach.getNgayNhap());
			pStatement.setString(5, ngayNhap);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi insert NhapSach: " + e.toString());
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
	public boolean update(NhapSach nhapSach) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(NhapSach nhapSach) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public NhapSach getNhapSach(String maNS) {
		ketNoiDatabase = new KetNoiDatabase();
		NhapSach nhapSach = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaNS, MaNVKho, MaSach, SoLuongNhap, NgayNhap From NhapSach Where MaNS=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maNS);
			rs = pStatement.executeQuery();
			if( rs.next() ) {
				nhapSach = new NhapSach();
				nhapSach.setMaNS(rs.getString("MaNS"));
				nhapSach.setMaNVKho(rs.getInt("MaNVKho"));
				nhapSach.setMaSach(rs.getString("MaSach"));
				nhapSach.setSoLuongNhap(rs.getInt("SoLuongNhap"));
				nhapSach.setNgayNhap(rs.getDate("NgayNhap"));
			}
			conn.commit();
			return nhapSach;
		} catch (SQLException e) {
			System.out.println("Loi truy van lay ra NhapSach theo MaNS: " + e.toString());
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
