package com.amazingReader.control.Chen;

import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.ReaderService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.CookieStore;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;

@RequestMapping("/reader")
@RestController
public class ReaderActionControl {
    private static final Integer signInScore = 5;
    @Autowired
    private ReaderService readerService;

    @RequestMapping("/signIn.action")
    public Integer signIn(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cookies = request.getCookies();
        Boolean signInFlag = false;
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("signed")) {
                    signInFlag = true;
                    break;
                }
            }
        }
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        if (!signInFlag){
            Cookie cookie = new Cookie("signed",true+"");
            cookie.setMaxAge(getRestSeconds());
            response.addCookie(cookie);
            reader = readerService.getReaderInfo(reader.getReaderId());
            reader.setReaderScore(reader.getReaderScore()+signInScore);
            readerService.alterInfo(reader);
            return signInScore;
        }
        return 0;
    }

    /**
     * 获取今天还剩下多少秒
     * @return
     */
    private int getRestSeconds(){
        Calendar curDate = Calendar.getInstance();
        Calendar tommorowDate = new GregorianCalendar(curDate
                .get(Calendar.YEAR), curDate.get(Calendar.MONTH), curDate
                .get(Calendar.DATE) + 1, 0, 0, 0);
        return (int)(tommorowDate.getTimeInMillis() - curDate .getTimeInMillis()) / 1000;
    }
}
