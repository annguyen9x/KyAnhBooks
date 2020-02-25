package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoaiSachDao;
import dao.SachDao;
import model.LoaiSach;
import model.Sach;

@WebServlet("/SachTheoLoaiSach")
public class SachTheoLoaiSachController extends HttpServlet {
	SachDao sachDao = new SachDao();
	LoaiSachDao loaiSachDao = new LoaiSachDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String maLoaiSach = request.getParameter("MaLoaiSach");
		LoaiSach loaiSach = loaiSachDao.getLoaiSach(maLoaiSach);
		if( loaiSach == null ) {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Loại sách không tồn tại, vui lòng thử lại !');");
			writer.print("location='userTrangChu';");
			writer.print("</script>");
		}else {
			Map<Integer,List<Sach>> sachTheoLoaiSach = sachDao.hienThiSachTheoLoaiSach(maLoaiSach);
			request.setAttribute("SachTheoLoaiSach", sachTheoLoaiSach);
			request.setAttribute("LoaiSach", loaiSach);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/user/view/sp_cungloai.jsp");
			requestDispatcher.forward(request, response);
		}
	}
	
}
