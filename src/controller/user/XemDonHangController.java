package controller.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChiTietHoaDonDao;
import dao.KhachHangDao;
import dao.NguoiNhanHangDao;
import model.HoaDon;
import model.KhachHang;
import model.NguoiNhanHang;
import util.KiemTraKieuSo;

@WebServlet("/XemDonHang")
public class XemDonHangController extends HttpServlet {
	ChiTietHoaDonDao chiTietHoaDonDao = new ChiTietHoaDonDao();
	KhachHangDao khachHangDao = new KhachHangDao();
	NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		HttpSession session = request.getSession();
		if( session.getAttribute("ThongTinDonHang") != null ) {
			session.removeAttribute("ThongTinDonHang");
		}
		if( session.getAttribute("TrangThai") != null ) {
			session.removeAttribute("TrangThai");
		}
		response.sendRedirect("/SachKyAnh/view/user/view/xem_donhang.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String maDH = req.getParameter("maDH").trim();
		HttpSession session = req.getSession();
		
		if( session.getAttribute("ThongTinDonHang") != null ) {
			session.removeAttribute("ThongTinDonHang");
		}
		if( session.getAttribute("TrangThai") != null ) {
			session.removeAttribute("TrangThai");
		}
		
		if( maDH != null ) {
			if(KiemTraKieuSo.ktKieuSo(maDH) == true) {
				Map<String, Object> thongTinDonHang =  chiTietHoaDonDao.xemThongTinDonHang(Integer.parseInt(maDH));
				if( thongTinDonHang != null && thongTinDonHang.size() > 0) {
					HoaDon hoaDon = (HoaDon)thongTinDonHang.get("HoaDon");
					KhachHang khachHang = khachHangDao.getKhachHang(hoaDon.getMaKH());
					thongTinDonHang.put("KhachHang", khachHang);
					
					NguoiNhanHang nguoiNhanHang = null;
					if( hoaDon.getThayDoiNN().equals("Co") ) {
						nguoiNhanHang = nguoiNhanHangDao.getNguoiNhanHang(hoaDon.getSoHD());
					}
					else if( hoaDon.getThayDoiNN().equals("Khong") ) {
						nguoiNhanHang = new NguoiNhanHang(hoaDon.getSoHD(), khachHang.getTenKH(), khachHang.getDienThoai(), khachHang.getDiaChi());
					}
					thongTinDonHang.put("NguoiNhanHang", nguoiNhanHang);
				}
				session.setAttribute("ThongTinDonHang", thongTinDonHang);
			}
			session.setAttribute("TrangThai", "DaTimKiemDH");
		}
		req.getRequestDispatcher("/view/user/view/xem_donhang.jsp").forward(req, resp);
	}
}
