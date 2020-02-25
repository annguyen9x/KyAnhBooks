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

import dao.LoaiSachDao;
import dao.NhanVienDao;
import dao.SachDao;
import model.NhanVien;
import model.Sach;
import util.KiemTraNgayThang;
import util.MahoaMD5;

@WebServlet(name = "AdminSuaTaiKhoanNhanVien", urlPatterns = { "/AdminSuaTaiKhoanNhanVien" })
public class AdminSuaTaiKhoanNhanVienController extends HttpServlet {
	private int maNV = -1;
	private String matKhau = null;
	NhanVienDao nhanVienDao = new NhanVienDao();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("LoiSuaNhanVien") != null) {
			session.removeAttribute("LoiSuaNhanVien");
		}
		
		maNV = Integer.parseInt(request.getParameter("MaNV"));
		NhanVien nhanVien = nhanVienDao.getNhanVien(maNV);
		matKhau = nhanVien.getMatKhau();
		session.setAttribute("NhanVienSua", nhanVien);
		
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_sua_taikhoan.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
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
		HttpSession session = request.getSession();
		
		if( tenNV.length() >= 2 && email.length() > 0 && dienThoai.length() >= 10 && !gioiTinh.equals("") 
			&& KiemTraNgayThang.ktNgayThang(strNgaySinh)== true && !diaChi.equals("")) {
			
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			Date ngaySinh = null;
			try {
				ngaySinh = dateFormat.parse(strNgaySinh);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			NhanVien nv = new NhanVien(maNV, tenNV, chucVu, matKhau, email, dienThoai, gioiTinh, ngaySinh, diaChi);
			
			if( nhanVienDao.update(nv) == true ) {
				NhanVien nhanVienSessio = (NhanVien)session.getAttribute("NhanVien");
				if( maNV== nhanVienSessio.getMaNV()) {
					session.setAttribute("NhanVien", nv);
				}
				if( session.getAttribute("NhanVienSua") != null) {
					session.removeAttribute("NhanVienSua");
				}
				
				response.sendRedirect("/SachKyAnh/AdminCapNhatTaiKhoan");
				return;
			}else {
				session.setAttribute("LoiSuaNhanVien", "Loi sua nhan vien");
				response.sendRedirect("/SachKyAnh/view/admin/view/admin_sua_taikhoan.jsp");
				return;
			}
		}else {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Thông tin cập nhật không chính xác, vui lòng thử lại !');");
			writer.print("location='AdminSuaTaiKhoanNhanVien'");
			writer.print("</script>");
		}
	}

}
