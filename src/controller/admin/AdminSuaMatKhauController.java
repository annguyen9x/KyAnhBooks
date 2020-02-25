package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NhanVienDao;
import model.NhanVien;
import util.MahoaMD5;

@WebServlet(name = "AdminSuaMatKhau", urlPatterns = { "/AdminSuaMatKhau" })
public class AdminSuaMatKhauController extends HttpServlet {
	NhanVienDao nhanVienDao = new NhanVienDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_sua_matkhau.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String matKhau = MahoaMD5.mahoaMD5(request.getParameter("matkhau").trim());

		HttpSession session = request.getSession();
		if (session.getAttribute("KetQuaDoiMatKhau") != null) {
			session.removeAttribute("KetQuaDoiMatKhau");
		}

		if (matKhau.length() >= 6) {
			NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
			int maNV = nhanVien.getMaNV();
			if( nhanVienDao.updatePassWord(maNV,matKhau)) {
				NhanVien nhanVien2 = nhanVienDao.getNhanVien(maNV);
				session.setAttribute("NhanVien", nhanVien2);
				session.setAttribute("KetQuaDoiMatKhau", "thanhCong");
			}
			else {
				session.setAttribute("KetQuaDoiMatKhau", "thatBai");
			}
			response.sendRedirect("/SachKyAnh/view/admin/view/admin_sua_matkhau.jsp");
		} else {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Thông tin cập nhật không chính xác, vui lòng thử lại !');");
			writer.print("location='AdminSuaMatKhau'");
			writer.print("</script>");
		}
	}

}
