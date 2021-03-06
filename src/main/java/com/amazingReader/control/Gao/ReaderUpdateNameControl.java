package com.amazingReader.control.Gao;

import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RequestMapping("/reader")
@RestController
public class ReaderUpdateNameControl {
    @Autowired
    private ReaderService readerService;
    @RequestMapping("/updateReaderNameTrue.action")
    public  Boolean updateReaderNameTrue(String name, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean b = false;
        Reader reader1 = (Reader) request.getSession().getAttribute("reader");
        Reader reader2=new Reader();
        if (reader1!=null) {
            reader2 = readerService.getReaderInfo(reader1.getReaderId());
        }
        if (name != null && !"".equals(name.trim())) {
            readerService.updateReaderName(name, reader2.getReaderId());
            Reader reader=readerService.getReaderInfo(reader2.getReaderId());
            request.setAttribute("reader",reader);
            b=true;
            return b;
        }else{
            return b;
        }
    }
}