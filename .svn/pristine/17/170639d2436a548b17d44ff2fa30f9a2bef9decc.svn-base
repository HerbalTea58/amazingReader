package com.amazingReader.control.Gao;

import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/reader")
@RestController
public class UpdatePasswordControl {
    @Autowired
    private ReaderService readerService;
    @RequestMapping("/updatePassword.action")
    public Boolean updatePassword(String password,HttpServletRequest request, HttpServletResponse response){
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        Boolean b=false;
        if(readerService.alterReaderPassword(password,reader.getReaderId())){
            b=true;
            return b;
        }
        return b;
    }
}
