package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.KhachHangDao;
import model.KhachHang;
//import sun.security.provider.certpath.ResponderId;
import util.MahoaMD5;

@WebServlet(urlPatterns = "/userDangNhap")
public class DangNhapController extends HttpServlet{
	private KhachHangDao khachHangDao = new KhachHangDao(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/view/user/view/dangnhap.jsp").forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String email = request.getParameter("email");
		String matkhau = MahoaMD5.mahoaMD5(request.getParameter("matkhau"));
		
		if( khachHangDao.kiemTraEmailTonTai(email) == true ) {
			KhachHang kh = khachHangDao.dangNhap(email, matkhau);
			if( kh != null ) {
				HttpSession session = request.getSession(true);
				session.setAttribute("TaiKhoan", kh);
				response.sendRedirect("userTrangChu");
			}else {
				request.setAttribute("errorMatkhau", "Mật khẩu không chính xác");
				request.getRequestDispatcher("/view/user/view/dangnhap.jsp").forward(request, response);
			}		
		}else {
			request.setAttribute("errorEmail", "Email không tồn tại");
			request.getRequestDispatcher("/view/user/view/dangnhap.jsp").forward(request, response);
		}
	}
	
}
