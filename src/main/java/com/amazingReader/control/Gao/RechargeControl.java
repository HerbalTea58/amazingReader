package com.amazingReader.control.Gao;

import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RequestMapping("/recharge")
@Controller
public class RechargeControl {
    @Autowired
    private ReaderService readerService;
    @RequestMapping("/recharge.action")
    public void  getChargePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        request.setAttribute("reader",reader);
        request.getRequestDispatcher("/JSP/recharge.jsp").forward(request,response);
    }
}
