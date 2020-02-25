package controller.admin;

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

@WebServlet(name = "AdminThongTinDH", urlPatterns = { "/AdminThongTinDH" })
public class AdminThongTinDHController extends HttpServlet {
	ChiTietHoaDonDao chiTietHoaDonDao = new ChiTietHoaDonDao();
	NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String soHD = request.getParameter("SoHD");
		HttpSession session = request.getSession();
		if( session.getAttribute("ThongTinDonHang") != null) {
			session.removeAttribute("ThongTinDonHang");
		}
		
		if(KiemTraKieuSo.ktKieuSo(soHD) == true ) {
			Map<String, Object> thongTinDonHang = chiTietHoaDonDao.xemThongTinDonHang(Integer.parseInt(soHD));
			
			HoaDon hoaDon = (HoaDon)thongTinDonHang.get("HoaDon");
			int maKH = hoaDon.getMaKH();
			NguoiNhanHang nguoiNhanHang = null;
			if(hoaDon.getThayDoiNN().equals("Co")) {
				nguoiNhanHang = nguoiNhanHangDao.getNguoiNhanHang(Integer.parseInt(soHD));
			}
			else if(hoaDon.getThayDoiNN().equals("Khong")) {
				KhachHangDao khachHangDao= new KhachHangDao();
				KhachHang khachHang = khachHangDao.getKhachHang(maKH);
				String tenNN = khachHang.getTenKH();
				String dienThoai = khachHang.getDienThoai();
				String diaChi = khachHang.getDiaChi();
				nguoiNhanHang = new NguoiNhanHang(Integer.parseInt(soHD), tenNN, dienThoai, diaChi);
			}
			
			thongTinDonHang.put("NguoiNhanHang", nguoiNhanHang);
			session.setAttribute("ThongTinDonHang", thongTinDonHang);
			response.sendRedirect("/SachKyAnh/view/admin/view/admin_xem_thongtin_dh.jsp");
		}
		else {
			response.sendRedirect("/SachKyAnh/view/admin/view/admin_trangchu.jsp");
		}
		
	}

}
