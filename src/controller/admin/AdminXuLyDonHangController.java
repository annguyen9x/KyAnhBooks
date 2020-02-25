package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HoaDonDao;
import dao.NhanVienDao;
import model.NhanVien;
import util.KiemTraKieuSo;

@WebServlet(name = "AdminXuLyDonHang", urlPatterns = { "/AdminXuLyDonHang" })
public class AdminXuLyDonHangController extends HttpServlet {
	NhanVienDao nhanVienDao = new NhanVienDao();
	HoaDonDao hoaDonDao = new HoaDonDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String chucVu = "Giao Hàng";
		List<NhanVien> dsNhanVienGiaoHang = nhanVienDao.getDSNhanVienTheoChuVu(chucVu);
		HttpSession session = request.getSession();
		if( session.getAttribute("DsDHXLloi") != null) {
			session.removeAttribute("DsDHXLloi");
		}
		if( session.getAttribute("TrangThaiXuLy") != null) {
			session.removeAttribute("TrangThaiXuLy");
		}
		
		session.setAttribute("DsNhanVienGiaoHang", dsNhanVienGiaoHang);
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_xl_donhang.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		if( session.getAttribute("DsDHXLloi") != null) {
			session.removeAttribute("DsDHXLloi");
		}
		if( session.getAttribute("TrangThaiXuLy") != null) {
			session.removeAttribute("TrangThaiXuLy");
		}
		
		String[] dsMaNV = request.getParameterValues("NVGiaoHang");
		String[] dsSoHD = request.getParameterValues("SoHD");
		List DsDHXLloi = new ArrayList<>();
		
		if( dsSoHD == null ) {
			response.sendRedirect("/SachKyAnh/view/admin/view/admin_trangchu.jsp");
		}
		else
		{
			for(int i=0; i < dsSoHD.length; i++) {
				int soHD = Integer.parseInt(dsSoHD[i]);
				int maNVGiao = Integer.parseInt(dsMaNV[i]);
				String tinhTrangDH = "Đang chuẩn bị hàng";
				
				if( maNVGiao != -1 ) {
					if(hoaDonDao.xulyDonHang(soHD, maNVGiao, tinhTrangDH) == false) {
						DsDHXLloi.add(soHD);
					}
				}
				session.setAttribute("TrangThaiXuLy", "DaXuLyDH");
			}
			
			//update lại thông tin
			if( session.getAttribute("DsDonHangVaKhachHang") != null) {
				session.removeAttribute("DsDonHangVaKhachHang");
			}
			List<Object> dsDonHangVaKhachHang = hoaDonDao.dsDonHangVaKhachHang();
			session.setAttribute("DsDonHangVaKhachHang", dsDonHangVaKhachHang);
			
			if(DsDHXLloi.size() > 0) {
				session.setAttribute("DsDHXLloi", DsDHXLloi);
			}
			
			response.sendRedirect("/SachKyAnh/view/admin/view/admin_xl_donhang.jsp");
		}
		
	}

}
