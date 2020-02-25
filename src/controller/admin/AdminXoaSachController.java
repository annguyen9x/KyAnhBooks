package controller.admin;

import java.io.File;
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

import org.apache.commons.fileupload.FileItem;

import dao.LoaiSachDao;
import dao.SachDao;
import model.LoaiSach;
import model.Sach;

@WebServlet(name = "AdminXoaSach", urlPatterns = { "/AdminXoaSach" })
public class AdminXoaSachController extends HttpServlet {
	SachDao sachDao = new SachDao();
	LoaiSachDao loaiSachDao = new LoaiSachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String maSach = request.getParameter("MaSach").trim();
		String urlHinh = (sachDao.getSachTheoMaSach(maSach)).getUrlHinh();
		if( sachDao.delete(maSach) ) {
			//Xoa hinh anh trong folder
			File file = new File(AdminThemSachController.VITRILUU_HINHANH + File.separator + urlHinh);
			file.delete();
			
			//dừng 1,5(s) đợt xóa hình ảnh khỏi folder
			try {
				Thread.sleep(1500);
			} catch (InterruptedException e) {
				log("Loi sleep khi insert sach");
			}
			
			//update lại thông tin
			if( session.getAttribute("MapTenLoaiSachTheoMLS") != null) {
				session.removeAttribute("MapTenLoaiSachTheoMLS");
			}
			if( session.getAttribute("DsSach") != null) {
				session.removeAttribute("DsSach");
			}
			List<Sach> dsSach = sachDao.dsSach();
			session.setAttribute("DsSach", dsSach);
			Map<String, String> mapTenLoaiSachTheoMLS = new HashMap<String, String>();
			SachDao sachDao = new SachDao();
			for (int i = 0; i < dsSach.size(); i++) {
				String maLoaiSachUpdate = ((Sach)dsSach.get(i)).getMaLoaiSach();
				LoaiSach loaiSachDB = loaiSachDao.getLoaiSach(maLoaiSachUpdate);
				String tenLoaiSach = loaiSachDB.getTenLoaiSach();
				mapTenLoaiSachTheoMLS.put(maLoaiSachUpdate, tenLoaiSach);
			}
			session.setAttribute("MapTenLoaiSachTheoMLS", mapTenLoaiSachTheoMLS);
		}
		else {
			session.setAttribute("LoiXoaSach", "LoiKhoaNgoai");
		}
		
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_capnhat_sach.jsp");
	}

}
