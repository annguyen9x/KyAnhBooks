package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NhapSachDao;
import dao.SachDao;
import model.NhanVien;
import model.NhapSach;
import model.Sach;
import util.KiemTraKieuSo;
import util.KiemTraNgayThang;

@WebServlet(name = "KhoNhapSach", urlPatterns = { "/KhoNhapSach" })
public class KhoNhapSachController extends HttpServlet {
	SachDao sachDao = new SachDao();
	NhapSachDao nhapSachDao = new NhapSachDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Sach> dsSach = sachDao.dsSach();
		session.setAttribute("DsSach", dsSach);
		
		response.sendRedirect("/SachKyAnh/view/admin/view/kho_nhap_sach.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		HttpSession session = request.getSession();
		if(session.getAttribute("KetQuaNhapSach") != null ) {
			session.removeAttribute("KetQuaNhapSach");
		}
		
		String maNS = request.getParameter("manhapsach");
		String maSach = request.getParameter("masach");
		String soLuong = request.getParameter("soluong");
		String ngayNhap = request.getParameter("ngaynhap");
		
		NhapSach ns = nhapSachDao.getNhapSach(maNS);
		if( ns == null ) {
			if(KiemTraKieuSo.ktKieuSo(soLuong) == true && KiemTraNgayThang.ktNgayThang(ngayNhap)== true) {
				NhanVien nhanVien = (NhanVien)session.getAttribute("NhanVien");
				int maNVKho = nhanVien.getMaNV();
				int soLuongNhap = Integer.parseInt(soLuong);
				SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
				Date ngayNhapDate= null;
				try {
					ngayNhapDate = dateFormat.parse(ngayNhap);
				} catch (ParseException e) {
					log("Loi DateFormat: " + e.toString());
				}
				NhapSach nhapSach = new NhapSach(maNS, maNVKho, maSach, soLuongNhap, ngayNhapDate);
				
				if(nhapSachDao.insert(nhapSach)) {
					Sach sachDB = sachDao.getSachTheoMaSach(maSach);
					int soLuongMoi = soLuongNhap + sachDB.getSoLuong();
					sachDao.updateSoLuong(soLuongMoi, maSach);
					
					session.setAttribute("KetQuaNhapSach", "ThanhCong");
				}
				else {
					PrintWriter writer = response.getWriter();
					writer.print("<script type='text/javascript'>");
					writer.print("alert('Lỗi server khi insert, vui lòng thử lại !');");
					writer.print("location='KhoNhapSach'");
					writer.print("</script>");
				}
			}
			else {
				PrintWriter writer = response.getWriter();
				writer.print("<script type='text/javascript'>");
				writer.print("alert('Thông tin nhập sách không chính xác, vui lòng thử lại !');");
				writer.print("location='KhoNhapSach'");
				writer.print("</script>");
			}
		}
		else {
			session.setAttribute("KetQuaNhapSach", "TrungMaNS");
		}
		
		response.sendRedirect("/SachKyAnh/view/admin/view/kho_nhap_sach.jsp");
	}

}
