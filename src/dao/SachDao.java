package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.LoaiSach;
import model.Sach;

public class SachDao implements ITFSachDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	
	@Override
	public boolean insert(Sach sach) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Insert into Sach(MaSach, TenSach, DonGia, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaLoaiSach) "
					+ "Values(?,?,?,?,?,?,?,?,?,?)";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, sach.getMaSach());
			pStatement.setString(2, sach.getTenSach());
			pStatement.setFloat(3, sach.getDonGia());
			pStatement.setInt(4, 0);
			pStatement.setString(5, sach.getUrlHinh());
			pStatement.setString(6, sach.getNoiDung());
			pStatement.setString(7, sach.getTacGia());
			pStatement.setInt(8, sach.getNamXB());
			pStatement.setString(9, sach.getnXB());
			pStatement.setString(10, sach.getMaLoaiSach());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi insert Sach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		
		return false;
	}

	@Override
	public boolean update(Sach sach) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update Sach Set TenSach=?, DonGia=?, UrlHinh=?, NoiDung=?, TacGia=?, NamXB=?, NXB=?, MaLoaiSach=?  "
						+ "Where MaSach= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, sach.getTenSach());
			pStatement.setFloat(2, sach.getDonGia());
			pStatement.setString(3, sach.getUrlHinh());
			pStatement.setString(4, sach.getNoiDung());
			pStatement.setString(5, sach.getTacGia());
			pStatement.setInt(6, sach.getNamXB());
			pStatement.setString(7, sach.getnXB());
			pStatement.setString(8, sach.getMaLoaiSach());
			pStatement.setString(9, sach.getMaSach());
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update Sach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		
		return false;
	}
	
	@Override
	public boolean updateSoLuong(int soLuong, String maSach) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Update Sach Set SoLuong=? Where MaSach= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, soLuong);
			pStatement.setString(2, maSach);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi update soLuong Sach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		
		return false;
	}

	@Override
	public boolean delete(String maSach) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Delete From Sach Where MaSach= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maSach);
			int rows = pStatement.executeUpdate();
			conn.commit();
			if( rows > 0 ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi delete Sach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		
		return false;
	}
	

	@Override
	public boolean kiemTraSachTheoMaSach(String maSach) {
		ketNoiDatabase = new KetNoiDatabase();
		Sach sach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select * " + 
						 "From Sach " + 
						 "Where MaSach= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maSach);
			rs = pStatement.executeQuery();
			conn.commit();
			if( rs.next() ) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Loi truy van Sach trong table Sach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
	
		return false;
	}
	
	@Override
	public Sach getSachTheoMaSach(String maSach) {
		ketNoiDatabase = new KetNoiDatabase();
		Sach sach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaSach, TenSach, DonGia, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaLoaiSach " + 
						 "From Sach " + 
						 "Where MaSach= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maSach);
			rs = pStatement.executeQuery();
			sach = new Sach ();
			if( rs.next() ) {
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGia(rs.getFloat("DonGia"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));
			}
			conn.commit();
			return sach;
		} catch (SQLException e) {
			System.out.println("Loi truy van Sach trong table Sach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
	
		return null;
	}
	
	@Override
	public List<Sach> dsSach() {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaSach, TenSach, DonGia, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaLoaiSach " + 
						 "From Sach " + 
						 "Order By MaSach DESC ";
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			dsSach = new ArrayList();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGia(rs.getFloat("DonGia"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				
				dsSach.add(sach);
			}
			conn.commit();
			return dsSach;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach Sach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
	
		return null;
	}

	@Override
	public List<Sach> dsSachNoiBat(int soLuong) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSachNoiBat = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select Top "+ soLuong +" MaSach, TenSach, DonGia, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaLoaiSach " + 
						 "From Sach " + 
						 "Order By DonGia DESC ";
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			dsSachNoiBat = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGia(rs.getFloat("DonGia"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				
				dsSachNoiBat.add(sach);
			}
			conn.commit();
			return dsSachNoiBat;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach SachNoiBat: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
	
		return null;
	}

	@Override
	public List<Sach> dsSachMoi(int soLuong) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSachMoi = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select Top "+ soLuong +" MaSach, TenSach, DonGia, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaLoaiSach " + 
						 "From Sach " + 
						 "Order By NamXB DESC ";
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			dsSachMoi = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGia(rs.getFloat("DonGia"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				
				dsSachMoi.add(sach);
			}
			conn.commit();
			return dsSachMoi;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach SachMoi: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
	
		return null;
	}

	@Override
	public List<Sach> dsSachTheoLoaiSach(String maLoaiSach) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSachTheoLoaiSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaSach, TenSach, DonGia, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaLoaiSach " + 
						 "From Sach " + 
						 "Where MaLoaiSach= ? ";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maLoaiSach);
			rs = pStatement.executeQuery();
			dsSachTheoLoaiSach = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGia(rs.getFloat("DonGia"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));

				dsSachTheoLoaiSach.add(sach);
			}
			conn.commit();
			return dsSachTheoLoaiSach;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach SachTheoLoaiSach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
	
		return null;
	}
	
	@Override
	public List<Sach> dsTenSachTheoLoaiSach(String maLoaiSach) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsTenSachTheoLoaiSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select TenSach " + 
						 "From Sach " + 
						 "Where MaLoaiSach= ? "+
						 "Group By TenSach";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maLoaiSach);
			rs = pStatement.executeQuery();
			dsTenSachTheoLoaiSach = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setTenSach(rs.getNString("TenSach"));

				dsTenSachTheoLoaiSach.add(sach);
			}
			conn.commit();
			return dsTenSachTheoLoaiSach;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach TenSachTheoLoaiSach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
	
		return null;
	}

	@Override
	public List<Sach> dsSachTheoTenSach(String tenSach) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSachTheoTenSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaSach, TenSach, DonGia, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaLoaiSach " + 
						 "From Sach " + 
						 "Where TenSach=? " +
						 "Order By DonGia ASC";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, tenSach);
			rs = pStatement.executeQuery();
			dsSachTheoTenSach = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGia(rs.getFloat("DonGia"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				
				dsSachTheoTenSach.add(sach);
			}
			conn.commit();
			return dsSachTheoTenSach;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach SachTheoTenSach: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
	
		return null;
	}
	
	@Override
	public Map<Integer, List<Sach>> hienThiSachTheoLoaiSach(String maLoaiSach) {
		
		List<Sach> sTen = this.dsTenSachTheoLoaiSach(maLoaiSach);
		if( sTen != null ) {
			Map<Integer, List<Sach>> mapSach = new HashMap<>();
			for(int i = 0; i < sTen.size(); i++ ) {
				List<Sach> sChiTiet = this.dsSachTheoTenSach(sTen.get(i).getTenSach());
				if(sChiTiet != null) {
					
					List<Sach> listSach = new ArrayList<>();
					for(int j = 0; j < sChiTiet.size(); j++) {
						Sach sach = new Sach();
						sach.setMaSach(sChiTiet.get(j).getMaSach());
						sach.setTenSach(sChiTiet.get(j).getTenSach());
						sach.setDonGia(sChiTiet.get(j).getDonGia());
						sach.setSoLuong(sChiTiet.get(j).getSoLuong());
						sach.setUrlHinh(sChiTiet.get(j).getUrlHinh());
						sach.setNoiDung(sChiTiet.get(j).getNoiDung());
						sach.setTacGia(sChiTiet.get(j).getTacGia());
						sach.setNamXB(sChiTiet.get(j).getNamXB());
						sach.setnXB(sChiTiet.get(j).getnXB());
						sach.setMaLoaiSach(sChiTiet.get(j).getMaLoaiSach());
						
						listSach.add(sach);
					}
					mapSach.put(i, listSach);
				}
			}
			return mapSach;
		}
		return null;
	}

	@Override
	public List<Sach> timKiemSach(String tenSach) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaSach, TenSach, DonGia, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaLoaiSach " + 
						 "From Sach " + 
						 "Where TenSach like ? ";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1,"%"+ tenSach +"%");
			rs = pStatement.executeQuery();
			dsSach = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGia(rs.getFloat("DonGia"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));

				dsSach.add(sach);
			}
			conn.commit();
			return dsSach;
		} catch (SQLException e) {
			System.out.println("Loi truy van sach TimKiem: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
	
		return null;
	}

}
