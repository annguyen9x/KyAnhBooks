package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoaiSachDao;
import dao.SachDao;
import model.LoaiSach;
import model.Sach;

@WebServlet(name = "ChiTietSach", urlPatterns = { "/ChiTietSach" })
public class ChiTietSachController extends HttpServlet {
	SachDao sachDao  = new SachDao();
	LoaiSachDao loaiSachDao = new LoaiSachDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String maSach = request.getParameter("MaSach");
		Sach sach = sachDao.getSachTheoMaSach(maSach);
		if(sach != null) {
			List<Sach> dsSachCungTen = sachDao.dsSachTheoTenSach(sach.getTenSach());
			LoaiSach loaiSach = loaiSachDao.getLoaiSach(sach.getMaLoaiSach());
			request.setAttribute("DsSachCungTen", dsSachCungTen);
			request.setAttribute("LoaiSach", loaiSach);
			
			request.getRequestDispatcher("/view/user/view/chitiet_sp.jsp").forward(request, response);
		}else {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Mã sách không tồn tại, vui lòng kiểm tra lại !');");
			writer.print("location='userTrangChu';");
			writer.print("</script>");
		}
	}

}
