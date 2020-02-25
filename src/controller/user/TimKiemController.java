package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SachDao;
import model.Sach;

@WebServlet(name = "TimKiem", urlPatterns = { "/TimKiem" })
public class TimKiemController extends HttpServlet {
	SachDao sachDao = new SachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String tuKhoa = request.getParameter("timKiem");
		if( tuKhoa.equals("")) {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Vui lòng nhập vào từ khóa để tìm kiếm !');");
			writer.print("location='userTrangChu';");
			writer.print("</script>");
		}else {
			List<Sach> dsSach = sachDao.timKiemSach(tuKhoa );
			request.setAttribute("KetQuaTimKiem", dsSach);
			request.setAttribute("TuKhoa", tuKhoa);
			request.getRequestDispatcher("/view/user/view/tim_kiem.jsp").forward(request, response);
		}
		
	}

}
