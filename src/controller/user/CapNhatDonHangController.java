package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
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
import dao.SachDao;
import model.ChiTietHoaDon;
import model.HoaDon;
import model.KhachHang;
import model.NguoiNhanHang;
import model.Sach;

@WebServlet(name = "CapNhatDonHang", urlPatterns = { "/CapNhatDonHang" })
public class CapNhatDonHangController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] mangSoLuong = req.getParameterValues("soLuong");

		HttpSession session = req.getSession();
		Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
		if( gioHang != null && mangSoLuong != null) {
			HoaDonDao hoaDonDao = new HoaDonDao();
			ChiTietHoaDonDao chiTietHoaDonDao = new ChiTietHoaDonDao();
			SachDao sachDao = new SachDao();
			HoaDon hoaDon = (HoaDon)gioHang.get("HoaDon");
			int i = 0;
			int soLuong= 0;
			int tongSoLuongDB= 0;
			String maSach= null;
			int soHD= hoaDon.getSoHD();
			float donGia = 0;
			float tongTienMoi = 0;
			
			Map<String, Object> danhSachChiTietGioHang = (Map<String, Object>)gioHang.get("DanhSachChiTietGioHang");
			Iterator iterator = danhSachChiTietGioHang.entrySet().iterator();
			while (iterator.hasNext()) {
				Map.Entry mapEntry = (Map.Entry) iterator.next();
				Map<String, Object> chiTietGioHang = (Map<String, Object>)mapEntry.getValue();
				soLuong = Integer.parseInt(mangSoLuong[i]);
				i++;
				
				maSach = mapEntry.getKey().toString();
				donGia = sachDao.getSachTheoMaSach((String)mapEntry.getKey()).getDonGia();
				tongSoLuongDB = sachDao.getSachTheoMaSach((String)mapEntry.getKey()).getSoLuong() + (int)chiTietGioHang.get("SoLuong");
				sachDao.updateSoLuong( tongSoLuongDB - soLuong, maSach);
				ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon(soHD, maSach, soLuong, donGia);
				chiTietHoaDonDao.update(chiTietHoaDon);
				tongTienMoi += soLuong*donGia;
				
				chiTietGioHang.put("SoLuong", soLuong);
				chiTietGioHang.put("SoLuongDB", (int)chiTietGioHang.get("TongSoLuongDB") - soLuong);
			}
			hoaDonDao.updateTongTien(tongTienMoi, soHD);
			resp.sendRedirect("/SachKyAnh/view/user/view/capnhat_donhang.jsp");
		}else {
			resp.sendRedirect("/SachKyAnh/userTrangChu");
		}
	}
}
