package com.amazingReader.util;

import org.springframework.core.convert.converter.Converter;
import org.springframework.lang.Nullable;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

//这个转化器可以将请求的参数从字符串类型转换为Date类型
public class DateConveter implements Converter<String,Date> {
    @Nullable
    @Override
    public Date convert(String s) {
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        Date date=null;
        try {
            date=format.parse(s);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return date;
    }
}
