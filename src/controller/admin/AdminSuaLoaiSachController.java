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

@WebServlet(name = "AdminSuaLoaiSach", urlPatterns = { "/AdminSuaLoaiSach" })
public class AdminSuaLoaiSachController extends HttpServlet {
	private String maLoaiSach = null;
	LoaiSachDao loaiSachDao = new LoaiSachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		maLoaiSach = request.getParameter("MaLoaiSach").trim();
		String tenLoaiSach = ((LoaiSach)loaiSachDao.getLoaiSach(maLoaiSach)).getTenLoaiSach();
		
		request.setAttribute("MaLoaiSach", maLoaiSach);
		request.setAttribute("TenLoaiSach", tenLoaiSach);
		request.getRequestDispatcher("/view/admin/view/admin_sua_loaisach.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String tenLoaiSach = request.getParameter("tenloaisach").trim();
		LoaiSach loaiSach = new LoaiSach(maLoaiSach, tenLoaiSach);
				
		if(loaiSachDao.update(loaiSach)) {
			
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
