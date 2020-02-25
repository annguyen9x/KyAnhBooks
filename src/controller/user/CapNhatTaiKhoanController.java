package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDao;
import model.KhachHang;
import util.KiemTraKieuSo;
import util.KiemTraNgayThang;
import util.MahoaMD5;

@WebServlet(description = "userCapNhatTaiKhoan", urlPatterns = { "/userCapNhatTaiKhoan" })
public class CapNhatTaiKhoanController extends HttpServlet {
	KhachHangDao khachHangDao = new KhachHangDao();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String tenKH = req.getParameter("hoten").trim();
		String matKhau = MahoaMD5.mahoaMD5(req.getParameter("matkhau").trim());
		String email = req.getParameter("email").trim();
		String dienThoai = req.getParameter("dienthoai").trim();
		String gioiTinh = req.getParameter("gioitinh").trim();
		String strNgaySinh =  req.getParameter("namsinh")+ "-" +req.getParameter("thangsinh") + "-" + req.getParameter("ngaysinh") ;
		String diaChi = req.getParameter("diachi").trim();	
		HttpSession session = req.getSession();
		
		if( tenKH.length() >= 2 && matKhau.length() >= 6 && email.length() > 0 && dienThoai.length() >= 10 && !gioiTinh.equals("") 
			&& KiemTraNgayThang.ktNgayThang(strNgaySinh)== true && !diaChi.equals("")) {

			KhachHang khachHang = (KhachHang) session.getAttribute("TaiKhoan");
			int  maKH = khachHang.getMaKH();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			Date ngaySinh = null;
			try {
				ngaySinh = dateFormat.parse(strNgaySinh);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			KhachHang kh = new KhachHang(maKH, tenKH, matKhau, email, dienThoai, gioiTinh, ngaySinh, diaChi);
			if( khachHangDao.update(kh) == true ) {
				session.setAttribute("thanhCong", "Cập nhật thông tin tài khoản thành công.");
				session.setAttribute("TaiKhoan", kh);
			}else {
				session.setAttribute("thatBai", "Cập nhật thông tin tài khoản thất bại !!!");
			}
			resp.sendRedirect("userCapNhatTaiKhoan");
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Thông tin cập nhật không chính xác, vui lòng thử lại !');");
			writer.print("location='userCapNhatTaiKhoan'");
			writer.print("</script>");
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("TaiKhoan") == null ) {
			response.sendRedirect("userTrangChu");
		}else {
			response.sendRedirect("/SachKyAnh/view/user/view/capnhat_taikhoan.jsp");
		}
	}
}
