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

@WebServlet(name = "AdminThemLoaiSach", urlPatterns = { "/AdminThemLoaiSach" })
public class AdminThemLoaiSachController extends HttpServlet {
	LoaiSachDao loaiSachDao = new LoaiSachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("LoiThemLoaiSach") != null) {
			session.removeAttribute("LoiThemLoaiSach");
		}
		
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_them_loaisach.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		if( session.getAttribute("LoiThemLoaiSach") != null) {
			session.removeAttribute("LoiThemLoaiSach");
		}
		
		String maLoaiSach = request.getParameter("maloaisach").trim();
		String tenLoaiSach = request.getParameter("tenloaisach").trim();
		
		//Kiểm tra MaLoaiSach đã có trong DB chưa
		LoaiSach loaiSachDB = loaiSachDao.getLoaiSach(maLoaiSach);
		if( loaiSachDB == null ) {
		
			LoaiSach loaiSach = new LoaiSach(maLoaiSach, tenLoaiSach);
			if(loaiSachDao.insert(loaiSach)) {
				
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
		else if( loaiSachDB != null ){
			session.setAttribute("LoiThemLoaiSach", "TrungMaLoaiSach");
			response.sendRedirect("/SachKyAnh/view/admin/view/admin_them_loaisach.jsp");
		}
	}

}
