package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.HoaDon;
import model.KhachHang;
import model.NguoiNhanHang;
import util.GuiMail;
import util.RandomSoNguyen;

@WebServlet(name = "XacNhanEmailDatHang", urlPatterns = { "/XacNhanEmailDatHang" })
public class XacNhanEmailDatHangController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		Map<String, Object> thongTinDonHang = (Map<String, Object>)session.getAttribute("ThongTinDonHang");
		
		if(thongTinDonHang != null && thongTinDonHang.size() > 0 ) {
			if( session.getAttribute("xacNhanEmailDatHang") != null ) {
				session.removeAttribute("xacNhanEmailDatHang");
			}
			
			HoaDon hoaDon = (HoaDon)thongTinDonHang.get("HoaDon");
			KhachHang khachHang = (KhachHang)thongTinDonHang.get("KhachHang");
			String emailNhan = null;
			if( khachHang != null ) {
				emailNhan = khachHang.getEmail();
			}
			String tieuDe = "Xác nhận email đã đặt hàng tại [kyanhbooks.com] để cập nhật đơn hàng";
			String maXacNhan = String.valueOf(RandomSoNguyen.randomSoNguyen());
			String noiDung = "Mã xác nhận email đã đặt đơn hàng số " + hoaDon.getSoHD() + " là:"+ maXacNhan;
			
			if( GuiMail.guiMail(emailNhan, tieuDe, noiDung) == true ) {
				System.out.println("maXacNhanTuServer: " + maXacNhan);
				session = request.getSession();	
				session.setAttribute("MaXacNhan", maXacNhan);
				response.sendRedirect("/SachKyAnh/view/user/view/xacnhan_email_dathang.jsp");
			}else {
				PrintWriter writer = response.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Lỗi khi gửi mail xác nhận từ server, vui lòng kiểm tra kết nối internet !!!');");
				writer.print("location='userTrangChu'");
				writer.print("</script>");
			}
		}else {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Đã có lỗi khi lấy thông tin đơn hàng, vui lòng thử lại !');");
			writer.print("location='userTrangChu';");
			writer.print("</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String maXacNhanTuServer = (String)session.getAttribute("MaXacNhan");
		String maXacNhanTuClient = (String) request.getParameter("maXN").trim();
		
		if( session.getAttribute("xacNhanEmailDatHang") != null ) {
			session.removeAttribute("xacNhanEmailDatHang");
		}
		
		if(maXacNhanTuServer.equals(maXacNhanTuClient)) {
			response.sendRedirect("/SachKyAnh/XemCapNhatDonHang");
		}else {
			session.setAttribute("xacNhanEmailDatHang", "mxnSai");
			response.sendRedirect("/SachKyAnh/view/user/view/xacnhan_email_dathang.jsp");
		}
	}

}
