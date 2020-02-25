package controller.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HoaDonDao;
import model.NhanVien;
import util.KiemTraNgayThang;

@WebServlet(name = "GiaoHangXuLyCapNhatTTDH", urlPatterns = { "/GiaoHangXuLyCapNhatTTDH" })
public class GiaoHangXuLyCapNhatTTDHController extends HttpServlet {
	HoaDonDao hoaDonDao = new HoaDonDao();

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
		if( dsSoHD == null ) {
			response.sendRedirect("/SachKyAnh/view/admin/view/giaohang_trangchu.jsp");
		}
		else {
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			String ngayGiao = "";
			Date ngayHienTai = Calendar.getInstance().getTime();
			List DsDHCNTTDHloi = new ArrayList<>();
			
			for(int i=0; i < dsSoHD.length; i++) {
				int soHD = Integer.parseInt(dsSoHD[i]);
				String tinhTrangDH =  request.getParameter("TinhTrangDH"+soHD);
				
				if( "1".equals(tinhTrangDH)) {
					tinhTrangDH = "Đang giao hàng";
					ngayGiao = dateFormat.format(ngayHienTai);
				}
				if( "2".equals(tinhTrangDH)) {
					tinhTrangDH = "Trả lại hàng";
					Date ngayGiaoDB = hoaDonDao.getHoaDon(soHD).getNgayGiao();
					if( ngayGiaoDB == null) {
						ngayGiao = dateFormat.format(ngayHienTai);
					}
					else {
						ngayGiao = dateFormat.format(ngayGiaoDB);
					}
				}
				if( "3".equals(tinhTrangDH)) {
					tinhTrangDH = "Giao hàng thành công";
					Date ngayGiaoDB = hoaDonDao.getHoaDon(soHD).getNgayGiao();
					if( ngayGiaoDB == null) {
						ngayGiao = dateFormat.format(ngayHienTai);
					}
					else {
						ngayGiao = dateFormat.format(ngayGiaoDB);
					}
				}
				
				if(hoaDonDao.updateTinhTrangDonHang(soHD, tinhTrangDH, ngayGiao) == false) {
					DsDHCNTTDHloi.add(soHD);
				}
				session.setAttribute("TrangThaiXuLyCapNhatTTDH", "DaCapNhatTTDH");
			}
			
			//update lại thông tin
			if( session.getAttribute("DsDonHangVaKhachHang") != null) {
				session.removeAttribute("DsDonHangVaKhachHang");
			}
			NhanVien nhanvien = (NhanVien)session.getAttribute("NhanVien");
			int maNV = nhanvien.getMaNV();
			List<Object> dsDonHangVaKhachHang = hoaDonDao.dsDonHangVaKhachHangTheoNVGiao(maNV);
			session.setAttribute("DsDonHangVaKhachHang", dsDonHangVaKhachHang);
			
			if(DsDHCNTTDHloi.size() > 0) {
				session.setAttribute("DsDHCNTTDHloi", DsDHCNTTDHloi);
			}
			
			response.sendRedirect("/SachKyAnh/view/admin/view/giaohang_cn_tinhtrang_dh.jsp");
		}
	}

}
