package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "GiaoHangCapNhatTTDH", urlPatterns = { "/GiaoHangCapNhatTTDH" })
public class GiaoHangCapNhatTTDHController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("DsDonHangChon") != null ) {
			session.removeAttribute("DsDonHangChon");
		}
		response.sendRedirect("/SachKyAnh/view/admin/view/giaohang_cn_tinhtrang_dh.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		String dsDonHangChon = (String)request.getParameter("DsDonHangChon");
		HttpSession session = request.getSession();
		if( session.getAttribute("DsDHCNTTDHloi") != null) {
			session.removeAttribute("DsDHCNTTDHloi");
		}
		if( session.getAttribute("TrangThaiXuLyCapNhatTTDH") != null) {
			session.removeAttribute("TrangThaiXuLyCapNhatTTDH");
		}
		
		if( session.getAttribute("DsDonHangChon") != null ) {
			session.removeAttribute("DsDonHangChon");
		}
		session.setAttribute("DsDonHangChon", dsDonHangChon);
		
		response.sendRedirect("/SachKyAnh/view/admin/view/giaohang_cn_tinhtrang_dh.jsp");
	}

}
