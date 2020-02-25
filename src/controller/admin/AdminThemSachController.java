package controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
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

@WebServlet(name = "AdminThemSach", urlPatterns = { "/AdminThemSach" })
public class AdminThemSachController extends HttpServlet {
	public static final String VITRILUU_HINHANH = "D:/HK119/JAVA/DACN/DACN/code/SachKyAnh/WebContent/view/user/static/img/sanpham";
	SachDao sachDao = new SachDao();
	LoaiSachDao loaiSachDao = new LoaiSachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("LoiThemSach") != null) {
			session.removeAttribute("LoiThemSach");
		}
		response.sendRedirect("/SachKyAnh/view/admin/view/admin_them_sach.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		if( session.getAttribute("LoiThemSach") != null) {
			session.removeAttribute("LoiThemSach");
		}
			
		String maSach = null;
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
						
						if(tenParameter.equals("masach")) {
							maSach = giaTriParameter;
						}
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
						urlHinh = giaTriParameter;//Lưu ảnh sau
						
						boolean kiemTraHinhAnh = false;//Kiểm tra tên ảnh đã tồn tại chưa
						List<Sach> dsSachs = (List<Sach>)session.getAttribute("DsSach");
						for(Sach sach: dsSachs) {
							if(sach.getUrlHinh().equals(urlHinh)) {
								kiemTraHinhAnh = true;
							}
						}
						if(kiemTraHinhAnh == true){
							session.setAttribute("LoiThemSach", "TrungHinhAnh");
							response.sendRedirect("/SachKyAnh/view/admin/view/admin_them_sach.jsp");
							return;
						}
					}
				}
			} catch (Exception ex) {
				log("Loi upload" +ex.toString());
				response.sendRedirect("/SachKyAnh/view/admin/view/admin_them_sach.jsp");
			}
		} else {
			log("Loi khong tim thay duong dan");
			response.sendRedirect("/SachKyAnh/view/admin/view/admin_them_sach.jsp");
		}
			
		//Kiểm tra MaSach đã tồn tại trong DB không để lưu sách
		boolean kiemTraSachDB = sachDao.kiemTraSachTheoMaSach(maSach);
		if( kiemTraSachDB == false ) {
			Sach sach = new Sach(maSach, tenSach, donGia, urlHinh, noiDung, tacGia, namXB, nXB, maLoaiSach);
			if(sachDao.insert(sach)) {
				//Ghi hình ảnh vào thư mục
				File file = new File(VITRILUU_HINHANH + File.separator + urlHinh);
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
		else if( kiemTraSachDB = true ) {
			session.setAttribute("LoiThemSach", "TrungMaSach");
			response.sendRedirect("/SachKyAnh/view/admin/view/admin_them_sach.jsp");
		}
		
	}

}
