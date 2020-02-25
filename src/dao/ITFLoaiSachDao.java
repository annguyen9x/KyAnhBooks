package dao;

import java.util.List;

import model.LoaiSach;

public interface ITFLoaiSachDao {
	
	boolean insert(LoaiSach ls);
	
	boolean update(LoaiSach ls);
	
	boolean delete(String maLoaiSach);
	
	LoaiSach getLoaiSach(String maLS);
	
	List<LoaiSach> getDSLoaiSach();
	
	List<LoaiSach> hienThiMenuDoc();
}
