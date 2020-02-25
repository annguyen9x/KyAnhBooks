package util;

public class KiemTraKieuSo {
	public static boolean ktKieuSo(String so){
       try{
    	   int s  = Integer.parseInt(so.trim());
           return true;
       }catch(NumberFormatException e){
    	   return false; 
       }
    }
}
