package controller.user;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import dao.LoaiSachDao;
import dao.SachDao;
import model.LoaiSach;
import model.Sach;

@WebServlet({ "/userTrangChu" })
public class TrangChuController extends HttpServlet {
	LoaiSachDao loaiSachDao = new LoaiSachDao();
	SachDao sachDao = new SachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		List<LoaiSach> loaiSach = loaiSachDao.hienThiMenuDoc();
		LoaiSach loaiSachVanHoc = loaiSachDao.getLoaiSach("LS06");
		List<Sach> sachNoiBat = sachDao.dsSachNoiBat(2);
		List<Sach> sachMoi = sachDao.dsSachMoi(8);
		Map<Integer,List<Sach>> sachTheoLoaiSach = sachDao.hienThiSachTheoLoaiSach("LS06");

		this.getServletContext().setAttribute("DSLoaiSach", loaiSach);
		this.getServletContext().setAttribute("LoaiSachVanHoc", loaiSachVanHoc);
		this.getServletContext().setAttribute("SachNoiBat", sachNoiBat);
		this.getServletContext().setAttribute("SachMoi", sachMoi);
		this.getServletContext().setAttribute("SachTheoLoaiSach", sachTheoLoaiSach);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/user/view/trangchu.jsp");
		requestDispatcher.forward(request, response);
	}

}
