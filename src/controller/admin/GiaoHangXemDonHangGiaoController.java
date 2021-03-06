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

import dao.NhanVienDao;
import model.NhanVien;

@WebServlet(name = "GiaoHangXemDonHangGiao", urlPatterns = { "/GiaoHangXemDonHangGiao" })
public class GiaoHangXemDonHangGiaoController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/SachKyAnh/view/admin/view/giaohang_xem_dh_giao.jsp");
	}

}
