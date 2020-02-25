package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Map;

@WebServlet(name = "XoaGioHang", urlPatterns = { "/XoaGioHang" })
public class XoaGioHangController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String MaSach = request.getParameter("MaSach");
		
		HttpSession session = request.getSession();
		Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
		if(gioHang != null ) {
			if( MaSach != null && MaSach.equals("XoaTatCa") ) {
				session.removeAttribute("GioHang");
			}
			else if( MaSach != null && !MaSach.equals("XoaTatCa") ){
				Map<String, Object> danhSachChiTietGioHang = (Map<String, Object>)gioHang.get("DanhSachChiTietGioHang");
				if( danhSachChiTietGioHang != null && MaSach != null) {
					danhSachChiTietGioHang.remove(MaSach);
					if( danhSachChiTietGioHang.size() == 0 ) {
						session.removeAttribute("GioHang");
					}
				}
			}
			response.sendRedirect("/SachKyAnh/XemGioHang");
		}
		else {
			response.sendRedirect("/SachKyAnh/userTrangChu");
		}
	}

}
