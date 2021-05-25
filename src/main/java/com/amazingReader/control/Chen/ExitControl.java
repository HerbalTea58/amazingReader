package com.amazingReader.control.Chen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class ExitControl {
    @RequestMapping("/exit.action")
    public void exit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath()+"/JSP/login_reader.jsp");
    }

    @RequestMapping("/managerExit.action")
    public void managerExit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath()+"/JSP/managerLogin.jsp");
    }
}
