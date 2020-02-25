package dao;

import model.NhapSach;

public interface ITFNhapSachDao {
	
	boolean insert(NhapSach nhapSach);
	
	boolean update(NhapSach nhapSach);
	
	boolean delete(NhapSach nhapSach);
	
	NhapSach getNhapSach(String maNS);
}
