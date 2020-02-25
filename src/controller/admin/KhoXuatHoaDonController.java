package controller.admin;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HoaDonDao;
import dao.KhachHangDao;
import dao.NguoiNhanHangDao;
import model.HoaDon;
import model.KhachHang;
import model.NguoiNhanHang;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

@WebServlet("/KhoXuatHoaDon")
public class KhoXuatHoaDonController extends HttpServlet {
	protected static Connection conn;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String soHD = request.getParameter("soHD").trim();
		String TenNN = null;
		String DiaChi = null;
		String DienThoai = null;
		
		HoaDonDao hoaDonDao = new HoaDonDao();
		HoaDon hoaDon = hoaDonDao.getHoaDon(Integer.parseInt(soHD));
		if(hoaDon.getThayDoiNN().equals("Co")) {
			NguoiNhanHangDao nguoiNhanHangDao = new NguoiNhanHangDao();
			NguoiNhanHang nguoiNhanHang = nguoiNhanHangDao.getNguoiNhanHang(Integer.parseInt(soHD));
			TenNN = nguoiNhanHang.getTenNN();
			DiaChi = nguoiNhanHang.getDiaChi();
			DienThoai = nguoiNhanHang.getDienThoai();
		}
		else if(hoaDon.getThayDoiNN().equals("Khong")) {
			KhachHangDao khachHangDao = new KhachHangDao();
			KhachHang khachHang = khachHangDao.getKhachHang(hoaDon.getMaKH());
			TenNN = khachHang.getTenKH();
			DiaChi = khachHang.getDiaChi();
			DienThoai = khachHang.getDienThoai();
		}
		
		
		String nam = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
		String thang = String.valueOf(Calendar.getInstance().get(Calendar.MONTH) + 1);
		String ngay = String.valueOf(Calendar.getInstance().get(Calendar.DAY_OF_MONTH));
		
		try {
			String user = "sa";
			String password = "123456";
			String url = "jdbc:sqlserver://localhost:1433; databaseName=SachKyAnh";
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(url, user, password);

			JasperReport jasperReport = null;
			JasperDesign jasperDesign = null;
			
			Map parameters = new HashMap();
			parameters.put("soHD", soHD);
			parameters.put("TenNN", TenNN);
			parameters.put("DiaChi", DiaChi);
			parameters.put("DienThoai", DienThoai);
			parameters.put("nam", nam);
			parameters.put("thang", thang);
			parameters.put("ngay", ngay);
	
			String path = getServletContext().getRealPath("/WEB-INF/");
			jasperDesign = JRXmlLoader.load(path + "/HoaDon.jrxml");
			jasperReport = JasperCompileManager.compileReport(jasperDesign);
			byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, parameters, conn);
			OutputStream outStream = response.getOutputStream();
			response.setContentType("application/pdf");
			response.setContentLength(byteStream.length);
			outStream.write(byteStream, 0, byteStream.length);
			
		} catch (ClassNotFoundException e) {
			System.out.println("Loi load driver: " + e.toString());
		} catch (SQLException e) {
			 System.out.println("Loi duong dan sqlserver: " + e.toString());
		} catch (JRException e) {
			e.printStackTrace();
		}
	}

}
