package controller.admin;

import java.io.File;
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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import dao.LoaiSachDao;
import dao.SachDao;
import model.LoaiSach;
import model.Sach;

@WebServlet(name = "AdminSuaSach", urlPatterns = { "/AdminSuaSach" })
public class AdminSuaSachController extends HttpServlet {
	private String maSach = null;
	private String urlHinhTruocUpdate = null;
	SachDao sachDao = new SachDao();
	LoaiSachDao loaiSachDao = new LoaiSachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("LoiSuaSach") != null) {
			session.removeAttribute("LoiSuaSach");
		}
		if( session.getAttribute("Sach") != null) {
			session.removeAttribute("Sach");
		}
		
		maSach = request.getParameter("MaSach");
		Sach sach = sachDao.getSachTheoMaSach(maSach);
		urlHinhTruocUpdate =sach.getUrlHinh();
		
		session.setAttribute("Sach", sach);
		request.getRequestDispatcher("/view/admin/view/admin_sua_sach.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		if( session.getAttribute("LoiSuaSach") != null) {
			session.removeAttribute("LoiSuaSach");
		}
		
		String tenSach = null;
		Float donGia = 0.0F;
		String urlHinh = null;
		String noiDung = null;
		String tacGia = null;
		int namXB = 0;
		String nXB = null;
		String maLoaiSach = null;
		
		List<FileItem> items = null;
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String tenParameter= null;
				String giaTriParameter= null;
				for(FileItem item: items) {
					if( item.isFormField() ) {//du lieu text, number,...
						tenParameter = item.getFieldName();
						giaTriParameter = (item.getString("UTF-8")).trim();
						
						if(tenParameter.equals("tensach")) {
							tenSach = giaTriParameter;
						}
						if(tenParameter.equals("dongia")) {
							donGia = Float.parseFloat(giaTriParameter.trim());
						}
						if(tenParameter.equals("noidungsach")) {
							noiDung = giaTriParameter;
						}
						if(tenParameter.equals("tacgia")) {
							tacGia = giaTriParameter;
						}
						if(tenParameter.equals("namxuatban")) {
							namXB = Integer.parseInt(giaTriParameter.trim());
						}
						if(tenParameter.equals("nxb")) {
							nXB = giaTriParameter;
						}
						if(tenParameter.equals("maloaisach")) {
							maLoaiSach = giaTriParameter;
						}
					}
					else {//du lieu file
						tenParameter = item.getFieldName();
						giaTriParameter = FilenameUtils.getName(item.getName());
						urlHinh = giaTriParameter.trim();//Lưu ảnh sau
						
						boolean kiemTraHinhAnh = false;//Kiểm tra tên ảnh đã tồn tại chưa
						List<Sach> dsSachs = (List<Sach>)session.getAttribute("DsSach");
						
						for(Sach sach: dsSachs) {
							if(sach.getUrlHinh().equals(urlHinh)) {
								kiemTraHinhAnh = true;
							}
						}
						if(kiemTraHinhAnh == true){
							session.setAttribute("LoiSuaSach", "TrungHinhAnh");
							response.sendRedirect("/SachKyAnh/view/admin/view/admin_sua_sach.jsp");
							return;
						}
					}
				}
			} catch (Exception ex) {
				log("Loi upload" +ex.toString());
				response.sendRedirect("/SachKyAnh/view/admin/view/admin_sua_sach.jsp");
			}
		} else {
			log("Loi khong tim thay duong dan");
			response.sendRedirect("/SachKyAnh/view/admin/view/admin_sua_sach.jsp");
		}
		
		boolean isUrlHinhMoi = true;
		if(urlHinh.equals("")) {
			urlHinh = urlHinhTruocUpdate;
			isUrlHinhMoi = false;
		}
		
		Sach sach = new Sach(maSach, tenSach, donGia, urlHinh, noiDung, tacGia, namXB, nXB, maLoaiSach);
		if(sachDao.update(sach)) {
			if(isUrlHinhMoi==true) {
				//Xóa ảnh cũ trước khi lưu ảnh mới
				File fileCu = new File(AdminThemSachController.VITRILUU_HINHANH + File.separator + urlHinhTruocUpdate);
				fileCu.delete();
				//dừng 1,5(s) đợt xóa hình ảnh khỏi folder
				try {
					Thread.sleep(1500);
				} catch (InterruptedException e) {
					log("Loi sleep khi insert sach");
				}
				
				File file = new File(AdminThemSachController.VITRILUU_HINHANH + File.separator + urlHinh);
				//Ghi hình ảnh vào thư mục
				for(FileItem item: items) {
					if( !item.isFormField() ) {
						try {
							item.write(file);
						} catch (Exception e) {
							log("Loi luu file: " + e.toString());
						}
					}
				}
				
				//dừng 3(s) đợt update hình ảnh vào folder
				try {
					Thread.sleep(3000);
				} catch (InterruptedException e) {
					log("Loi sleep khi insert sach");
				}
			}
			
			//Xóa session Sách
			if( session.getAttribute("Sach") != null) {
				session.removeAttribute("Sach");
			}
			
			//update lại thông tin
			if( session.getAttribute("MapTenLoaiSachTheoMLS") != null) {
				session.removeAttribute("MapTenLoaiSachTheoMLS");
			}
			if( session.getAttribute("DsSach") != null) {
				session.removeAttribute("DsSach");
			}
			List<Sach> dsSach = sachDao.dsSach();
			session.setAttribute("DsSach", dsSach);
			Map<String, String> mapTenLoaiSachTheoMLS = new HashMap<String, String>();
			SachDao sachDao = new SachDao();
			for (int i = 0; i < dsSach.size(); i++) {
				String maLoaiSachUpdate = ((Sach)dsSach.get(i)).getMaLoaiSach();
				LoaiSach loaiSachDB = loaiSachDao.getLoaiSach(maLoaiSachUpdate);
				String tenLoaiSach = loaiSachDB.getTenLoaiSach();
				mapTenLoaiSachTheoMLS.put(maLoaiSachUpdate, tenLoaiSach);
			}
			session.setAttribute("MapTenLoaiSachTheoMLS", mapTenLoaiSachTheoMLS);
		}
		
		response.sendRedirect("/SachKyAnh/AdminCapNhatSach");
	}

}
