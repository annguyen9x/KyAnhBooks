package controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HoaDonDao;
import dao.LoaiSachDao;
import dao.NhanVienDao;
import dao.SachDao;
import model.LoaiSach;
import model.NhanVien;
import model.Sach;

@WebServlet(name = "PhanQuyenQuanTri", urlPatterns = { "/PhanQuyenQuanTri" })
public class PhanQuyenQuanTriController extends HttpServlet {
	HoaDonDao hoaDonDao = new HoaDonDao();
	SachDao sachDao = new SachDao();
	LoaiSachDao loaiSachDao = new LoaiSachDao();
	NhanVienDao nhanVienDao = new NhanVienDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		HttpSession session = request.getSession();
		NhanVien nhanvien = (NhanVien)session.getAttribute("NhanVien");
		if(nhanvien != null ) {
			if( "Admin".equals(nhanvien.getChucVu()) ) {
				List<Object> dsDonHangVaKhachHang = hoaDonDao.dsDonHangVaKhachHang();
				List<LoaiSach> dsLoaiSach = loaiSachDao.getDSLoaiSach();
				List<Sach> dsSach = sachDao.dsSach();
				
				session.setAttribute("DsDonHangVaKhachHang", dsDonHangVaKhachHang);
				session.setAttribute("DsLoaiSach", dsLoaiSach);
				session.setAttribute("DsSach", dsSach);
				
				response.sendRedirect("/SachKyAnh/AdminTrangChu");
			}
			else if("Kho".equals(nhanvien.getChucVu()) ) {
				List<Object> dsDonHangVaKhachHang = hoaDonDao.dsDonHangVaKhachHang();
				session.setAttribute("DsDonHangVaKhachHang", dsDonHangVaKhachHang);
				
				String chucVu = "Giao Hàng";
				List<NhanVien> dsNVGiaoHang = nhanVienDao.getDSNhanVienTheoChuVu(chucVu);
				Map<Integer, NhanVien> mapNVGiaoHang = new HashMap();
				for (int i = 0; i < dsNVGiaoHang.size(); i++) {
					NhanVien nhanVien = dsNVGiaoHang.get(i);
					mapNVGiaoHang.put(nhanVien.getMaNV(), nhanVien);
				}
				session.setAttribute("MapNVGiaoHang", mapNVGiaoHang);
				
				response.sendRedirect("/SachKyAnh/KhoTrangChu");
			}
			else if("Giao Hàng".equals(nhanvien.getChucVu()) ) {
				int maNV = nhanvien.getMaNV();
				List<Object> dsDonHangVaKhachHang = hoaDonDao.dsDonHangVaKhachHangTheoNVGiao(maNV);
				session.setAttribute("DsDonHangVaKhachHang", dsDonHangVaKhachHang);
				
				response.sendRedirect("/SachKyAnh/GiaoHangTrangChu");
			}
			else {
				response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
			}
		}
		else {
			response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
		}
	}

}
