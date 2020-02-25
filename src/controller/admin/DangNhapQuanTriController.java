package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NhanVienDao;
import model.KhachHang;
import model.NhanVien;
import util.MahoaMD5;

@WebServlet(name = "quantri", urlPatterns = { "/quantri" })
public class DangNhapQuanTriController extends HttpServlet {
	NhanVienDao  nhanVienDao = new NhanVienDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		String email = request.getParameter("Email").trim();
		String matkhau = MahoaMD5.mahoaMD5(request.getParameter("MatKhau").trim());
		
		if( nhanVienDao.kiemTraEmailTonTai(email) == true ) {
			NhanVien nhanvien = nhanVienDao.dangNhap(email, matkhau);
			if( nhanvien != null ) {
				HttpSession session = request.getSession(true);
				session.setAttribute("NhanVien", nhanvien);
				response.sendRedirect("/SachKyAnh/PhanQuyenQuanTri");
			}else {
				request.setAttribute("errorMatkhau", "Mật khẩu không chính xác");
				request.getRequestDispatcher("/view/admin/view/quantri_dangnhap.jsp").forward(request, response);
			}		
		}else {
			request.setAttribute("errorEmail", "Email không tồn tại");
			request.getRequestDispatcher("/view/admin/view/quantri_dangnhap.jsp").forward(request, response);
		}
	}

}
