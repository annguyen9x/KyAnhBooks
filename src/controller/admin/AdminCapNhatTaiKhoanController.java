package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NhanVienDao;
import model.LoaiSach;
import model.NhanVien;
import model.Sach;
import util.KiemTraNgayThang;
import util.MahoaMD5;

@WebServlet(name = "AdminCapNhatTaiKhoan", urlPatterns = { "/AdminCapNhatTaiKhoan" })
public class AdminCapNhatTaiKhoanController extends HttpServlet {
	NhanVienDao nhanVienDao = new NhanVienDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session  = request.getSession();
		if( session.getAttribute("LoiXoaNhanVien") != null) {
			session.removeAttribute("LoiXoaNhanVien");
		}
		
		List<NhanVien> dsNhanVien = nhanVienDao.getDSNhanVien();
		session.setAttribute("DsNhanVien", dsNhanVien);
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_capnhat_taikhoan.jsp");
	}

}
