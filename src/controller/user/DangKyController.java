package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDao;
import model.KhachHang;
import util.GuiMail;
import util.KiemTraNgayThang;
import util.MahoaMD5;
import util.RandomSoNguyen;

@WebServlet(description = "userDangKy", urlPatterns = { "/userDangKy" })
public class DangKyController extends HttpServlet {
	KhachHangDao khachHangDao = new KhachHangDao();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String tenKH = req.getParameter("hoten").trim();
		String matKhau = MahoaMD5.mahoaMD5(req.getParameter("matkhau").trim());
		String email = req.getParameter("email").trim();
		String dienThoai = req.getParameter("dienthoai").trim();
		String gioiTinh = req.getParameter("gioitinh").trim();
		String strNgaySinh =  req.getParameter("namsinh")+ "-" +req.getParameter("thangsinh") + "-" + req.getParameter("ngaysinh") ;
		String diaChi = req.getParameter("diachi").trim();		
		
		if(khachHangDao.kiemTraEmailTonTai(email) == true || khachHangDao.kiemTraDienThoaiTonTai(dienThoai) == true ) {
			HttpSession sesion = req.getSession();
			if(khachHangDao.kiemTraEmailTonTai(email) == true) {
				sesion.setAttribute("errorEmail", "Email \""+email +"\" đã đăng ký tài khoản, vui lòng nhập email khác !");
			}
			if(khachHangDao.kiemTraDienThoaiTonTai(dienThoai) == true){
				sesion.setAttribute("errorDienthoai", "Điện thoại \""+ dienThoai +"\" đã đăng ký tài khoản, vui lòng chọn số khác !");
			}
			resp.sendRedirect("userDangKy");
		}else {
			if( tenKH.length() >= 2 && matKhau.length() >= 6 && email.length() > 0 && dienThoai.length() >= 10 && !gioiTinh.equals("") 
				&& KiemTraNgayThang.ktNgayThang(strNgaySinh)== true && !diaChi.equals("")) {
				
				SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
				Date ngaySinh = null;
				try {
					ngaySinh = dateFormat.parse(strNgaySinh);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				KhachHang kh = new KhachHang(tenKH, matKhau, email, dienThoai, gioiTinh, ngaySinh, diaChi);
				
				String emailNhan = kh.getEmail();
				String tieuDe = "Xác nhận đăng ký tài khoản tại [kyanhbooks.com]";
				String maXacNhan = String.valueOf(RandomSoNguyen.randomSoNguyen());
				String noiDung = "Mã xác nhận email đăng ký: " + maXacNhan;
				
				if( GuiMail.guiMail(emailNhan, tieuDe, noiDung) == true ) {
					System.out.println("maXacNhanTuServer: " + maXacNhan);
					HttpSession session = req.getSession();	
					session.setAttribute("TaiKhoanDK", kh);
					session.setAttribute("MaXacNhan", maXacNhan);
					resp.sendRedirect("/SachKyAnh/view/user/view/xacthuc_dangky.jsp");
				}else {
					PrintWriter writer = resp.getWriter();
					writer.print("<script type='text/javascript'>");
					writer.print("alert('Lỗi khi gửi mail xác nhận từ server, vui lòng kiểm tra kết nối internet !!!');");
					writer.print("location='userDangKy'");
					writer.print("</script>");
				}
			}
			else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Thông tin đăng ký không chính xác, vui lòng thử lại !');");
				writer.print("location='userDangKy'");
				writer.print("</script>");
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/SachKyAnh/view/user/view/dangky.jsp");
	}
}
