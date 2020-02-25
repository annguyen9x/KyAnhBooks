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

import org.eclipse.jdt.internal.compiler.parser.RecoveredRequiresStatement;

import dao.SachDao;
import model.LoaiSach;
import model.Sach;

@WebServlet(name = "AdminCapNhatLoaiSach", urlPatterns = { "/AdminCapNhatLoaiSach" })
public class AdminCapNhatLoaiSachController extends HttpServlet {
	SachDao sachDao = new SachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session  = request.getSession();
		List<LoaiSach> dsLoaiSach = (List<LoaiSach>)session.getAttribute("DsLoaiSach");
		Map<String, Integer> mapSlSachThuocLoai = new HashMap<String, Integer>();
		for (int i = 0; i < dsLoaiSach.size(); i++) {
			String maLoaiSach = ((LoaiSach)dsLoaiSach.get(i)).getMaLoaiSach();
			List<Sach> dsSachDB = sachDao.dsSachTheoLoaiSach(maLoaiSach);
			int soLuong = dsSachDB.size();
			mapSlSachThuocLoai.put(maLoaiSach, soLuong);
		}
		session.setAttribute("MapSlSachThuocLoai", mapSlSachThuocLoai);
		
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_capnhat_loaisach.jsp");
	}

}
