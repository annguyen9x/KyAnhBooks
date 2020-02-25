package controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MenuNgang")
public class MenuNgangController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noidung = request.getParameter("NoiDung");
		
		if(noidung.equals("gt")) {
			response.sendRedirect("/SachKyAnh/view/user/view/gioi_thieu.jsp");
		}
		else if(noidung.equals("dv")) {
			response.sendRedirect("/SachKyAnh/view/user/view/dich_vu.jsp");
		}
		else if(noidung.equals("hdmh")) {
			response.sendRedirect("/SachKyAnh/view/user/view/huongdan_muahang.jsp");
		}
		else if(noidung.equals("lh")) {
			response.sendRedirect("/SachKyAnh/view/user/view/lien_he.jsp");
		}
	}

}
