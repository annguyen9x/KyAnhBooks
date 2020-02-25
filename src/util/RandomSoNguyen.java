package util;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public class RandomSoNguyen {
	public static final int MIN = 1000;
	public static final int MAX = 9999;
	
	public static int randomSoNguyen() {
		int so = ThreadLocalRandom.current().nextInt(MIN, MAX+1);
		return so;//trả về 4 chữ số
	}
}
