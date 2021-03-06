package com.amazingReader.control.Gao;

import com.amazingReader.entity.BookLabel;
import com.amazingReader.entity.BookStyle;
import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/reader")
@RestController
public class RemoveReaderLabelControl {
    @Autowired
    private ReaderService readerService;
    @Autowired
    private BookService bookService;
    @RequestMapping("/removeReaderLabel.action")
    public Boolean removeReaderLabel(Integer hobbyStyleId, HttpServletRequest request, HttpServletResponse response){
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        System.out.println(hobbyStyleId);
        BookStyle bookStyle= bookService.getBookStyle(hobbyStyleId);
        Boolean b=false;
        if (bookStyle!=null) {
            if (readerService.removeHobby(reader.getReaderId(), bookStyle.getBookStyleId())) {
                b = true;
                return b;
            }
        }
       return b;
    }
}
