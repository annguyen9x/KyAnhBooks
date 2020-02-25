package dao;

import java.util.List;
import java.util.Map;

import model.HoaDon;

public interface ITFHoaDonDao {
	
	int insert(HoaDon hd);
	
	boolean xulyDonHang(int soHD, int maNVGiao, String tinhTrangDonHang);
	
	boolean updateThayDoiNN(int soHD, String thayDoiNN);
	
	boolean updateTinhTrangDonHang(int soHD, String tinhTrangDonHang, String ngayGiao);
	
	boolean khoUpdateTinhTrangDonHang(int soHD, String tinhTrangDonHango);
	
	boolean updateTongTien(float tongTien, int soHD);
	
	boolean delete(int soHD);
	
	HoaDon getHoaDon(int soHD);
	
	List<HoaDon> dsDonHangTheoTinhTrang(String tinhTrangDH);
	
	List<Object> dsDonHangTheoKhachHang(int maKH);
	
	List<Object> dsDonHangVaKhachHangTheoNVGiao(int maNV);
	
	List<Object> dsDonHangVaKhachHang();
}
