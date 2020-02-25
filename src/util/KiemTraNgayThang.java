package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class KiemTraNgayThang {
	public static final String DATE_FORMAT = "yyyy-MM-dd";
	
	public static boolean ktNgayThang(String ngay){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORMAT);
        simpleDateFormat.setLenient(false);
        try{
            Date date = simpleDateFormat.parse(ngay.trim());
            return true;
        }catch(Exception e){
        	 return false;
        }
    }
}
