package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDao;
import util.GuiMail;
import util.RandomSoNguyen;

@WebServlet("/QuenMatKhau")
public class QuenMatKhauController extends HttpServlet {
	KhachHangDao khachHangDao = new KhachHangDao();
			
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/SachKyAnh/view/user/view/quen_matkhau.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email").trim();
		
		HttpSession session = request.getSession();
		if( session.getAttribute("KiemTraEmailDangNhap") != null ) {
			session.removeAttribute("KiemTraEmailDangNhap");
		}
		if( session.getAttribute("xacNhanDangNhapQMK") != null ) {
			session.removeAttribute("xacNhanDangNhapQMK");
		}
		if( session.getAttribute("Email") != null ) {
			session.removeAttribute("Email");
		}
		
		if( khachHangDao.kiemTraEmailTonTai(email) == true) {
			
			String emailNhan = email;
			String tieuDe = "Xác nhận đăng nhập tài khoản tại [kyanhbooks.com] khi quên mật khẩu";
			String maXacNhan = String.valueOf(RandomSoNguyen.randomSoNguyen());
			String noiDung = "Mã xác nhận email đăng nhập: " + maXacNhan;
			
			if( GuiMail.guiMail(emailNhan, tieuDe, noiDung) == true ) {
				System.out.println("maXacNhanTuServerQMK: " + maXacNhan);
				session.setAttribute("MaXacNhanQMK", maXacNhan);
				session.setAttribute("Email", email);
				session.setAttribute("KiemTraEmailDangNhap", "EmailTonTai");
			}else {
				PrintWriter writer = response.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Lỗi khi gửi mail xác nhận từ server, vui lòng kiểm tra kết nối internet !!!');");
				writer.print("location='QuenMatKhau'");
				writer.print("</script>");
			}
		}else {
			session.setAttribute("KiemTraEmailDangNhap", "EmailKhongTonTai");
		}
		response.sendRedirect("/SachKyAnh/view/user/view/quen_matkhau.jsp");
	}

}
