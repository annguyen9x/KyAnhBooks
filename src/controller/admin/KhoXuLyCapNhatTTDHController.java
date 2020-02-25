package controller.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChiTietHoaDonDao;
import dao.HoaDonDao;
import dao.NguoiNhanHangDao;
import dao.SachDao;
import model.ChiTietHoaDon;
import model.NguoiNhanHang;
import model.NhanVien;
import model.Sach;
import util.KiemTraNgayThang;

@WebServlet(name = "KhoXuLyCapNhatTTDH", urlPatterns = { "/KhoXuLyCapNhatTTDH" })
public class KhoXuLyCapNhatTTDHController extends HttpServlet {
	HoaDonDao hoaDonDao = new HoaDonDao();
	SachDao sachDao = new SachDao();
	ChiTietHoaDonDao chiTietHoaDonDao = new ChiTietHoaDonDao();
	NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		if( session.getAttribute("DsDHCNTTDHloi") != null) {
			session.removeAttribute("DsDHCNTTDHloi");
		}
		if( session.getAttribute("TrangThaiXuLyCapNhatTTDH") != null) {
			session.removeAttribute("TrangThaiXuLyCapNhatTTDH");
		}
		
		String[] dsSoHD = request.getParameterValues("SoHD");
		if( dsSoHD == null) {
			response.sendRedirect("/SachKyAnh/view/admin/view/kho_trangchu.jsp");
		}
		else 
		{
			List DsDHCNTTDHloi = new ArrayList<>();
			for(int i=0; i < dsSoHD.length; i++) {
				int soHD = Integer.parseInt(dsSoHD[i]);
				String tinhTrangDH =  request.getParameter("TinhTrangDH"+soHD);
				
				if( "1".equals(tinhTrangDH) ) {
					tinhTrangDH = "Đang chuẩn bị hàng";
				}
				else if( "2".equals(tinhTrangDH)) {
					tinhTrangDH = "Đợi người giao lấy hàng";
				}
				else if( "3".equals(tinhTrangDH)) {
					tinhTrangDH = "Đang giao hàng";
				}
				else if( "4".equals(tinhTrangDH)) {
					tinhTrangDH = "Giao hàng thành công";
				}
				else if( "5".equals(tinhTrangDH)) {
					tinhTrangDH = "Hoàn tất";
				}
				else if( "6".equals(tinhTrangDH)) {
					tinhTrangDH = "Trả lại hàng";
				}
				else if( "7".equals(tinhTrangDH)) {
					tinhTrangDH = "Trả lại hàng về kho";
				}
				
				
				if(hoaDonDao.khoUpdateTinhTrangDonHang(soHD, tinhTrangDH)) {
					System.out.println("HD ngoai: " + soHD);
					if( "Trả lại hàng về kho".equals(tinhTrangDH)) {//Trả lại hàng về kho
						System.out.println("tt= 7");
						//update lại số lượng sách
						Map<String, Object> thongTinDonHang = chiTietHoaDonDao.xemThongTinDonHang(soHD);
						if( thongTinDonHang != null && thongTinDonHang.size() > 0 ){
							System.out.println("thongTinDonHang: " + thongTinDonHang);
							
							List<HashMap> dsChiTietHoaDonBan = (List<HashMap>)thongTinDonHang.get("DanhSachChiTietHoaDon");
							
							for(int j = 0; j < dsChiTietHoaDonBan.size() ; j++){
								System.out.println("dsChiTietHoaDonBan: " + dsChiTietHoaDonBan);
								
								Map mapSachVaChiTiet = dsChiTietHoaDonBan.get(j);
								ChiTietHoaDon chiTietHoaDon = (ChiTietHoaDon)mapSachVaChiTiet.get("ChiTietHoaDon");
								Sach sach = (Sach)mapSachVaChiTiet.get("Sach");
								
								String maSach = sach.getMaSach();
								Sach sachDB = sachDao.getSachTheoMaSach(maSach);
								int soLuongDB = sachDB.getSoLuong();
								int soLuongTraLai = chiTietHoaDon.getSoLuong();
								
								sachDao.updateSoLuong(soLuongDB + soLuongTraLai, maSach);
								System.out.println("HD: " + soHD);
								System.out.println("Sach: " + sach.getTenSach());
								System.out.println("SL db: " + soLuongDB);
								System.out.println("SL tra: " + soLuongTraLai);
							}
						}
						
					}
				}
				else {
					DsDHCNTTDHloi.add(soHD);
				}
				session.setAttribute("TrangThaiXuLyCapNhatTTDH", "DaCapNhatTTDH");
			}
			
			//update lại thông tin
			if( session.getAttribute("DsDonHangVaKhachHang") != null) {
				session.removeAttribute("DsDonHangVaKhachHang");
			}
			List<Object> dsDonHangVaKhachHang = hoaDonDao.dsDonHangVaKhachHang();
			session.setAttribute("DsDonHangVaKhachHang", dsDonHangVaKhachHang);
			
			if(DsDHCNTTDHloi.size() > 0) {
				session.setAttribute("DsDHCNTTDHloi", DsDHCNTTDHloi);
			}
			response.sendRedirect("/SachKyAnh/view/admin/view/kho_cn_tinhtrang_dh.jsp");
		}
		
	}

}
