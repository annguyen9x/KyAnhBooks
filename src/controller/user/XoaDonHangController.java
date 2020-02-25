package controller.user;

import java.io.IOException;
import java.util.Iterator;
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
import model.HoaDon;
import model.NguoiNhanHang;
import model.Sach;

@WebServlet(name = "XoaDonHang", urlPatterns = { "/XoaDonHang" })
public class XoaDonHangController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String maSach = request.getParameter("MaSach");
		
		HttpSession session = request.getSession();
		Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
		if(gioHang != null ) {
			
			Map<String, Object> danhSachChiTietGioHang = (Map<String, Object>)gioHang.get("DanhSachChiTietGioHang");
			ChiTietHoaDonDao chiTietHoaDonDao = new ChiTietHoaDonDao();
			SachDao sachDao = new SachDao();
			NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();
			HoaDonDao hoaDonDao = new HoaDonDao();
			int soHD = ((HoaDon)gioHang.get("HoaDon")).getSoHD();
//			int idNN = ((NguoiNhanHang)gioHang.get("NguoiNhanHang")).getIdNN();
			
			if( maSach != null && maSach.equals("HuyDonHang") ) {
				Iterator iterator = danhSachChiTietGioHang.entrySet().iterator();
				while (iterator.hasNext()) {
					Map.Entry mapEntrychiTietGioHang = (Map.Entry)iterator.next();
					Map<String, Object> chiTietGioHang = (Map<String, Object>)mapEntrychiTietGioHang.getValue();
					int soLuongDaMuaChiTiet = (int)chiTietGioHang.get("SoLuong");
					String maSachChiTiet = mapEntrychiTietGioHang.getKey().toString();
					Sach sachDB = sachDao.getSachTheoMaSach(maSachChiTiet);
					
					sachDao.updateSoLuong(sachDB.getSoLuong() + soLuongDaMuaChiTiet, maSachChiTiet);
					chiTietHoaDonDao.delete(soHD, maSachChiTiet);
				}
				nguoiNhanHangDao.delete(soHD);
				hoaDonDao.delete(soHD);
				session.removeAttribute("GioHang");
				session.removeAttribute("CapNhatDonHang");
				response.sendRedirect("/SachKyAnh/view/user/view/capnhat_donhang.jsp");
				return;
			}
			else if( maSach != null && !maSach.equals("HuyDonHang") ){
				if( danhSachChiTietGioHang != null && maSach != null) {
					
					Map<String, Object> chiTietGioHang = (Map<String, Object>)danhSachChiTietGioHang.get(maSach);
					int soLuongDaMua = (int)chiTietGioHang.get("SoLuong");
					Sach sachDB = sachDao.getSachTheoMaSach(maSach);
					
					chiTietHoaDonDao.delete(soHD, maSach);
					sachDao.updateSoLuong(sachDB.getSoLuong() + soLuongDaMua, maSach);
					float tongTienMoi = hoaDonDao.getHoaDon(soHD).getTongTien() - soLuongDaMua*(float)chiTietGioHang.get("DonGia");
					hoaDonDao.updateTongTien(tongTienMoi, soHD);
					danhSachChiTietGioHang.remove(maSach);
					
					if( danhSachChiTietGioHang.size() == 0 ) {
						nguoiNhanHangDao.delete(soHD);
						hoaDonDao.delete(soHD);
						session.removeAttribute("GioHang");
						session.removeAttribute("CapNhatDonHang");
						response.sendRedirect("/SachKyAnh/view/user/view/capnhat_donhang.jsp");
						return;
					}
				}
			}
			response.sendRedirect("/SachKyAnh/XemGioHang");
		}
		else {
			response.sendRedirect("/SachKyAnh/userTrangChu");
		}


		
	}

}
