package controller.admin;

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

import dao.NhanVienDao;
import model.NhanVien;
import util.KiemTraNgayThang;
import util.MahoaMD5;

@WebServlet(name = "KhoCapNhatTaiKhoan", urlPatterns = { "/KhoCapNhatTaiKhoan" })
public class KhoCapNhatTaiKhoanController extends HttpServlet {
	NhanVienDao nhanVienDao = new NhanVienDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/SachKyAnh/view/admin/view/kho_capnhat_taikhoan.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String tenNV = request.getParameter("hoten").trim();
		String matKhau = MahoaMD5.mahoaMD5(request.getParameter("matkhau").trim());
		String email = request.getParameter("email").trim();
		String dienThoai = request.getParameter("dienthoai").trim();
		String gioiTinh = request.getParameter("gioitinh").trim();
		String strNgaySinh =  request.getParameter("namsinh")+ "-" +request.getParameter("thangsinh") + "-" + request.getParameter("ngaysinh") ;
		String diaChi = request.getParameter("diachi").trim();		
		HttpSession session = request.getSession();
		
		if( tenNV.length() >= 2 && matKhau.length() >= 6 && email.length() > 0 && dienThoai.length() >= 10 && !gioiTinh.equals("") 
			&& KiemTraNgayThang.ktNgayThang(strNgaySinh)== true && !diaChi.equals("")) {
			
			NhanVien nhanVien = (NhanVien) session.getAttribute("NhanVien");
			int  maNV = nhanVien.getMaNV();
			String chucVu = nhanVien.getChucVu();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			Date ngaySinh = null;
			try {
				ngaySinh = dateFormat.parse(strNgaySinh);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			NhanVien nv = new NhanVien(maNV, tenNV, chucVu, matKhau, email, dienThoai, gioiTinh, ngaySinh, diaChi);
			if( nhanVienDao.update(nv) == true ) {
				session.setAttribute("thanhCong", "Cập nhật thông tin tài khoản thành công.");
				session.setAttribute("NhanVien", nv);
			}else {
				session.setAttribute("thatBai", "Cập nhật thông tin tài khoản thất bại !!!");
			}
			response.sendRedirect("/SachKyAnh/KhoCapNhatTaiKhoan");
		}else {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Thông tin cập nhật không chính xác, vui lòng thử lại !');");
			writer.print("location='KhoCapNhatTaiKhoan'");
			writer.print("</script>");
		}
	}

}
