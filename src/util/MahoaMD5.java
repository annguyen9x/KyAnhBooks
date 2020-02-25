package util;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MahoaMD5 {
	//MD5 là thuật toán tạo chuỗi băm một chiều, không thể dịch ngược (theo lý thuyết)
	public static String mahoaMD5(String chuoi) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			byte[] mangBam = md.digest(chuoi.getBytes(StandardCharsets.UTF_8));
			BigInteger number = new BigInteger(1,mangBam);
			String kq= number.toString(16);
			
			while(kq.length() < 32 ) {
				kq = "0" + kq;
			}
			
			return kq;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
		
	}
}
