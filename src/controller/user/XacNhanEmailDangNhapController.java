package controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDao;
import model.KhachHang;

@WebServlet(name = "XacNhanEmailDangNhap", urlPatterns = { "/XacNhanEmailDangNhap" })
public class XacNhanEmailDangNhapController extends HttpServlet {
	KhachHangDao khachHangDao = new KhachHangDao();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String maXacNhanTuServer = (String)session.getAttribute("MaXacNhanQMK");
		String maXacNhanTuClient = (String) request.getParameter("maXN").trim();
		
		if(maXacNhanTuServer.equals(maXacNhanTuClient)) {
			session.setAttribute("xacNhanDangNhapQMK", "mxnChinhXac");
			
			String email = (String)session.getAttribute("Email");
			KhachHang kh = khachHangDao.getKhachHang(email);
			session.setAttribute("TaiKhoan", kh);
			
			if( session.getAttribute("KiemTraEmailDangNhap") != null ) {
				session.removeAttribute("KiemTraEmailDangNhap");
			}
		}
		else {
			session.setAttribute("xacNhanDangNhapQMK", "mxnSai");
		}
		response.sendRedirect("/SachKyAnh/view/user/view/quen_matkhau.jsp");
	}

}
