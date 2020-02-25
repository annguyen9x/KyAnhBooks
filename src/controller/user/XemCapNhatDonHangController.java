package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SachDao;
import model.ChiTietHoaDon;
import model.HoaDon;
import model.KhachHang;
import model.NguoiNhanHang;
import model.Sach;

@WebServlet(name = "XemCapNhatDonHang", urlPatterns = { "/XemCapNhatDonHang" })
public class XemCapNhatDonHangController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		Map<String, Object> gioHang = (Map)session.getAttribute("GioHang");
		if(gioHang != null ) {
			session.removeAttribute("GioHang");
		}
		
		//Đổ dữ liệu từ HoaDon ra GH
		Map<String, Object> thongTinDonHang = (Map<String, Object>)session.getAttribute("ThongTinDonHang");
		if(thongTinDonHang != null ) {
			NguoiNhanHang nguoiNhanHang =  (NguoiNhanHang)thongTinDonHang.get("NguoiNhanHang");
			KhachHang khachHang = (KhachHang)thongTinDonHang.get("KhachHang");
			HoaDon hoaDon = (HoaDon)thongTinDonHang.get("HoaDon");
			List<HashMap> danhSachChiTietHoaDon = (List<HashMap>) thongTinDonHang.get("DanhSachChiTietHoaDon");
			
			Map<String, Object> GioHangMoi = new HashMap<String, Object>();
			Map<String, Object> danhSachChiTietGioHang = new HashMap<String, Object>();
			SachDao sachDao = new SachDao();
			
			for( int i = 0; i < danhSachChiTietHoaDon.size(); i++ ) {
				HashMap hashMapChiTietHoaDon = danhSachChiTietHoaDon.get(i);
				ChiTietHoaDon chiTietHoaDon = (ChiTietHoaDon)hashMapChiTietHoaDon.get("ChiTietHoaDon");
				Sach sach = (Sach)hashMapChiTietHoaDon.get("Sach");
				
				Map<String, Object> chiTietGioHang = new HashMap<String, Object>();
				chiTietGioHang.put("TenSach", sach.getTenSach());
				chiTietGioHang.put("UrlHinh", sach.getUrlHinh());
				chiTietGioHang.put("DonGia", chiTietHoaDon.getDonGia());
				chiTietGioHang.put("SoLuongDB", sachDao.getSachTheoMaSach(sach.getMaSach()).getSoLuong());
				chiTietGioHang.put("TongSoLuongDB", sachDao.getSachTheoMaSach(sach.getMaSach()).getSoLuong() + chiTietHoaDon.getSoLuong());
				chiTietGioHang.put("SoLuong", chiTietHoaDon.getSoLuong());
				
				danhSachChiTietGioHang.put(chiTietHoaDon.getMaSach(), chiTietGioHang);
			}
			GioHangMoi.put("DanhSachChiTietGioHang", danhSachChiTietGioHang);
			GioHangMoi.put("HoaDon", hoaDon);
			GioHangMoi.put("NguoiNhanHang", nguoiNhanHang);
			GioHangMoi.put("KhachHang", khachHang);
			
			session.setAttribute("GioHang", GioHangMoi);
			
			//Xóa session ThongTinDonHang sau khi đổ dữ liệu sang giỏ hàng
			session.removeAttribute("ThongTinDonHang");
		}else {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Không tìm thấy thông tin đơn hàng, vui lòng kiểm tra lại !');");
			writer.print("location='userTrangChu';");
			writer.print("</script>");
		}
		
		//Tạo session để đánh dấu có thể thêm sách vào GH
		session.setAttribute("CapNhatDonHang", "DangCapNhatDH");
		response.sendRedirect("/SachKyAnh/view/user/view/capnhat_donhang.jsp");
	}

}
