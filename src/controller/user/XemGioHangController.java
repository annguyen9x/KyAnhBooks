package controller.user;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SachDao;
import model.Sach;

@WebServlet(name = "XemGioHang", urlPatterns = { "/XemGioHang" })
public class XemGioHangController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("CapNhatDonHang") != null ) {
			response.sendRedirect("/SachKyAnh/view/user/view/capnhat_donhang.jsp");
		}else {
			response.sendRedirect("/SachKyAnh/view/user/view/gio_hang.jsp");
		}
	}

}
