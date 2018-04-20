package com.blog.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String NowDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
}
