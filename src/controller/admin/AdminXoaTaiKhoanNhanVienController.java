package controller.admin;

import java.io.IOException;
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
import dao.SachDao;
import model.LoaiSach;
import model.NhanVien;
import model.Sach;

@WebServlet(name = "AdminXoaTaiKhoanNhanVien", urlPatterns = { "/AdminXoaTaiKhoanNhanVien" })
public class AdminXoaTaiKhoanNhanVienController extends HttpServlet {
	NhanVienDao nhanVienDao = new NhanVienDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		int maNV = Integer.parseInt(request.getParameter("MaNV").trim());
		if( nhanVienDao.delete(maNV) ) {
			
			//update lại thông tin
			List<NhanVien> dsNhanVien = nhanVienDao.getDSNhanVien();
			session.setAttribute("DsNhanVien", dsNhanVien);
		}
		else {
			session.setAttribute("LoiXoaNhanVien", "LoiKhoaNgoai");
		}
		
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_capnhat_taikhoan.jsp");
	}

}
