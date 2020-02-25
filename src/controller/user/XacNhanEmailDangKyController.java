package controller.user;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.KhachHangDao;
import model.KhachHang;
import util.GuiMail;
import util.RandomSoNguyen;

@WebServlet("/XacNhanEmailDangKy")
public class XacNhanEmailDangKyController extends HttpServlet {
	KhachHangDao khachHangDao = new KhachHangDao();
			
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			KhachHang khachHang = (KhachHang)session.getAttribute("TaiKhoanDK");
			String maXacNhanTuServer = (String)session.getAttribute("MaXacNhan");
			String maXacNhanTuClient = (String) request.getParameter("maXN").trim();
			
			HttpSession sessionKQ = request.getSession();
			if (maXacNhanTuServer.equals(maXacNhanTuClient)) {
				if( khachHangDao.insert(khachHang) == true ) {
					sessionKQ.setAttribute("dKThanhCong", "Đăng ký tài khoản khách hàng thành công.");
				}else {
					sessionKQ.setAttribute("dKThatBai", "Đăng ký tài khoản khách hàng thất bại !!!");
				}
				session.removeAttribute("TaiKhoanDK");
				session.removeAttribute("MaXacNhan");
			}else {
				sessionKQ.setAttribute("maXacNhanDKSai", "Mã xác nhận không chính xác, mời nhập lại !");
			}
			response.sendRedirect("/SachKyAnh/view/user/view/xacthuc_dangky.jsp");
	}
	
}
