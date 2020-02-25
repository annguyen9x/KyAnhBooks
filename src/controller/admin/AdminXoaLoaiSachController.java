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
import dao.SachDao;
import model.LoaiSach;
import model.Sach;

@WebServlet(name = "AdminXoaLoaiSach", urlPatterns = { "/AdminXoaLoaiSach" })
public class AdminXoaLoaiSachController extends HttpServlet {
	LoaiSachDao loaiSachDao = new LoaiSachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String maLoaiSach = request.getParameter("MaLoaiSach").trim();
		if( loaiSachDao.delete(maLoaiSach) ) {
			
			//update lại thông tin
			if( session.getAttribute("MapSlSachThuocLoai") != null) {
				session.removeAttribute("MapSlSachThuocLoai");
			}
			if( session.getAttribute("DsLoaiSach") != null) {
				session.removeAttribute("DsLoaiSach");
			}
			
			List<LoaiSach> dsLoaiSach = loaiSachDao.getDSLoaiSach();
			session.setAttribute("DsLoaiSach", dsLoaiSach);
			
			Map<String, Integer> mapSlSachThuocLoai = new HashMap<String, Integer>();
			SachDao sachDao = new SachDao();
			for (int i = 0; i < dsLoaiSach.size(); i++) {
				String maLoaiSachUpdate = ((LoaiSach)dsLoaiSach.get(i)).getMaLoaiSach();
				List<Sach> dsSachDB = sachDao.dsSachTheoLoaiSach(maLoaiSachUpdate);
				int soLuong = dsSachDB.size();
				mapSlSachThuocLoai.put(maLoaiSachUpdate, soLuong);
			}
			session.setAttribute("MapSlSachThuocLoai", mapSlSachThuocLoai);
		}
		
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_capnhat_loaisach.jsp");
	}

}
