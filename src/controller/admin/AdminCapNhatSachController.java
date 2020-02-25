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

import dao.LoaiSachDao;
import model.LoaiSach;
import model.Sach;

@WebServlet(name = "AdminCapNhatSach", urlPatterns = { "/AdminCapNhatSach" })
public class AdminCapNhatSachController extends HttpServlet {
	LoaiSachDao loaiSachDao = new LoaiSachDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session  = request.getSession();
		if( session.getAttribute("LoiXoaSach") != null) {
			session.removeAttribute("LoiXoaSach");
		}
		
		List<Sach> dsSach = (List<Sach>)session.getAttribute("DsSach");
		Map<String, String> mapTenLoaiSachTheoMLS = new HashMap();
		for (int i = 0; i < dsSach.size(); i++) {
			String maLoaiSach = ((Sach)dsSach.get(i)).getMaLoaiSach();
			LoaiSach loaiSachDB = loaiSachDao.getLoaiSach(maLoaiSach);
			String tenLoaiSach = loaiSachDB.getTenLoaiSach();
			mapTenLoaiSachTheoMLS.put(maLoaiSach, tenLoaiSach);
		}
		session.setAttribute("MapTenLoaiSachTheoMLS", mapTenLoaiSachTheoMLS);
		
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_capnhat_sach.jsp");
	}

}
