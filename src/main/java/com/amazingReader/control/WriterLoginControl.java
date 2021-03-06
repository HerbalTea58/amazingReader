package com.amazingReader.control;

import com.amazingReader.entity.Signin;
import com.amazingReader.entity.Writer;
import com.amazingReader.service.Interface.WriterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

@RequestMapping("/Writer")
@Controller
public class WriterLoginControl {
    @Autowired
    private  WriterService writerService;
    @RequestMapping("/login.action")
    public void writerLogin(Writer writer, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        String ck=request.getParameter("rem");
        System.out.println(writer+"~~~~~control");
        int info=writerService.writerLogin(writer);
        System.out.println(info+"~~~~control");
        request.getSession().setAttribute("a","a");
        if (info==1){//验证信息正确
            Cookie[] cookies = request.getCookies();
            if("checked".equals(ck)) {
                boolean f = false;
                if (cookies != null) {
                    for (int i = 0; i < cookies.length; i++) {
                        if (cookies[i].getName().equals("writerloginInfo")) {
                            f = true;
                            break;
                        }
                    }
                    if (!f) {
                        // 构造Cookie对象
                        Cookie cookie = new Cookie("writerloginInfo", writer.getWriterNeckName() + "-" + writer.getWriterPassword());
                        // 设置过期时间
                        cookie.setMaxAge(60 * 60);
                        // 存储
                        cookie.setPath("/");

                        response.addCookie(cookie);
                    }
                }
            }

            Writer LoginWriter = writerService.getWriterByName(writer.getWriterNeckName());
            HttpSession session = request.getSession();
            //把登录作者的信息存到session中
            session.setAttribute("LoginWriter", LoginWriter);
            List<Integer> signins = writerService.getSignin(LoginWriter.getWriterId());
            request.setAttribute("signins", signins);
            Integer num = writerService.getNumByYesAndToday(LoginWriter.getWriterId());
            request.setAttribute("wordnum", num);
            request.getRequestDispatcher("/JSP/writer_home.jsp").forward(request,response);
        }else{
            request.setAttribute("uname",writer.getWriterNeckName());
            // request.setAttribute("Info",info);
            request.getRequestDispatcher("/JSP/login_writer.jsp?Info="+info).forward(request,response);
        }
    }

    @RequestMapping("/loginCheck.action")
    public @ResponseBody
    boolean getReaderName(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name=request.getParameter("name");
        System.out.println(name+"~~~loginCheck");
        if (writerService.isWriterNameExist(name)){
            return true;
        }else {
            return false;
        }
    }

    @RequestMapping("/register.action")
    public void readerRegister(Writer writer, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        writerService.writerRegister(writer);
        request.getRequestDispatcher("/JSP/login_writer.jsp").forward(request,response);
    }


    @RequestMapping("/registerCheckTel.action")
    public @ResponseBody boolean getReaderTelExist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String tel=request.getParameter("tel");
        System.out.println(tel);
        //当数据库存在该手机号码时 readerService.isTelExist(tel)为true ；取非为false 那么可使用该手机号注册
        if (writerService.isWriterTelExist(tel)){
            return false;

        }else {
            return true;
        }
    }
    @RequestMapping("/findPass.action")//重置密码
    public @ResponseBody boolean findPass(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String phone=request.getParameter("phone");
        String code=request.getParameter("code");
        String pass=request.getParameter("repass");
        System.out.println(phone+","+code+","+pass);
        if (writerService.isWriterTelExist(phone)){
            if((new Date().getTime()-((Date)request.getSession().getAttribute("time")).getTime()) < 5*60*1000 && request.getSession().getAttribute("code").equals(code)){
                //System.out.println(getMessageCode.getCode(phone));
                //通过电话号码查询该用户
                Writer writer= writerService.queryWriterByTel(phone);
                //修改密码
                writer.setWriterPassword(pass);

                System.out.println(writer+"***");
                writerService.alterWriterInfo(writer);
                request.getRequestDispatcher("/JSP/login_writer.jsp").forward(request,response);

            }
            return true;
        }else {
            return false;
        }
    }

    @RequestMapping("/checkIdentifyCode.action")
    public  @ResponseBody boolean checkIdentifyCode(HttpServletRequest request,HttpServletResponse response){
        String phone = request.getParameter("phone");
        String code = request.getParameter("code");
        if (writerService.isWriterTelExist(phone)) {
            if ((new Date().getTime() - ((Date) request.getSession().getAttribute("time")).getTime()) < 5 * 60 * 1000 && request.getSession().getAttribute("code").equals(code)) {
                return true;
            }else {
                return false;
            }

        } else {
            return false;
        }

    }




}
