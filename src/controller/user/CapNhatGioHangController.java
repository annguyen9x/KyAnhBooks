package controller.user;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.sun.corba.se.impl.encoding.OSFCodeSetRegistry.Entry;

@WebServlet(name = "CapNhatGioHang", urlPatterns = { "/CapNhatGioHang" })
public class CapNhatGioHangController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] mangSoLuong = request.getParameterValues("soLuong");

		HttpSession session = request.getSession();
		Map<String, Object> gioHang = (Map<String, Object>)session.getAttribute("GioHang");
		if( gioHang != null && mangSoLuong != null) {
			int i = 0;
			int soLuong= 0;
			Map<String, Object> danhSachChiTietGioHang = (Map<String, Object>)gioHang.get("DanhSachChiTietGioHang");
			Iterator iterator = danhSachChiTietGioHang.entrySet().iterator();
			while (iterator.hasNext()) {
				Map.Entry mapEntry = (Map.Entry) iterator.next();
				Map<String, Object> chiTietGioHang = (Map<String, Object>)mapEntry.getValue();
				soLuong = Integer.parseInt(mangSoLuong[i]);
				i++;
				chiTietGioHang.put("SoLuong", soLuong);
				chiTietGioHang.put("SoLuongDB", (int)chiTietGioHang.get("TongSoLuongDB") - soLuong);
			}
			response.sendRedirect("/SachKyAnh/XemGioHang");
		}else {
			response.sendRedirect("/SachKyAnh/userTrangChu");
		}
	}

}
