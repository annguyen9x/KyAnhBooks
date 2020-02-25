package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NhanVienDao;
import model.KhachHang;
import model.NhanVien;
import util.GuiMail;
import util.KiemTraNgayThang;
import util.MahoaMD5;
import util.RandomSoNguyen;

@WebServlet(name = "AdminThemTaiKhoanNhanVien", urlPatterns = { "/AdminThemTaiKhoanNhanVien" })
public class AdminThemTaiKhoanNhanVienController extends HttpServlet {
	NhanVienDao nhanVienDao = new NhanVienDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.sendRedirect("/SachKyAnh/view/admin/view/admin_them_taikhoan_nhanvien.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		if( session.getAttribute("LoiThemNhanVien") != null) {
			session.removeAttribute("LoiThemNhanVien");
		}
		
		String tenNV = request.getParameter("hoten").trim();
		String chucVu = request.getParameter("chucvu").trim();
		if("1".equals(chucVu)) {
			chucVu = "Admin";
		}
		else if("2".equals(chucVu)) {
			chucVu = "Kho";
		}
		else if("3".equals(chucVu)) {
			chucVu = "Giao Hàng";
		}
		String email = request.getParameter("email").trim();
		String dienThoai = request.getParameter("dienthoai").trim();
		String gioiTinh = request.getParameter("gioitinh").trim();
		String strNgaySinh =  request.getParameter("namsinh")+ "-" +request.getParameter("thangsinh") + "-" + request.getParameter("ngaysinh") ;
		String diaChi = request.getParameter("diachi").trim();		
		
		if(nhanVienDao.kiemTraEmailTonTai(email) == true || nhanVienDao.kiemTraDienThoaiTonTai(dienThoai) == true ) {
				session.setAttribute("LoiThemNhanVien", "Email hoac dien thoai da ton tai");
				response.sendRedirect("/SachKyAnh/AdminThemTaiKhoanNhanVien");
		}else {
			if( tenNV.length() >= 2 && email.length() > 0 && dienThoai.length() >= 10 && !gioiTinh.equals("") 
				&& KiemTraNgayThang.ktNgayThang(strNgaySinh)== true && !diaChi.equals("")) {
				
				SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
				Date ngaySinh = null;
				try {
					ngaySinh = dateFormat.parse(strNgaySinh);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				String matKhau = MahoaMD5.mahoaMD5("123456");//Pass mac dinh: 123456
				NhanVien nhanVien = new NhanVien(tenNV, chucVu, matKhau, email, dienThoai, gioiTinh, ngaySinh, diaChi);
				
				if( nhanVienDao.insert(nhanVien) == true ) {
					response.sendRedirect("/SachKyAnh/AdminCapNhatTaiKhoan");
					return;
				}else {
					session.setAttribute("LoiThemNhanVien", "Them nhan vien that bai !!!");
					response.sendRedirect("/SachKyAnh/AdminThemTaiKhoanNhanVien");
					return;
				}
			}
			else {
				PrintWriter writer = response.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Thông tin đăng ký không chính xác, vui lòng thử lại !');");
				writer.print("location='AdminThemTaiKhoanNhanVien'");
				writer.print("</script>");
			}
		}
	}

}
