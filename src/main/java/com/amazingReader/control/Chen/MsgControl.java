package com.amazingReader.control.Chen;

import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("/msg")
@RestController
public class MsgControl {
    @Autowired
    private ReaderService readerService;
    @RequestMapping("/toReadCommentNum.action")
    public Integer toReadCommentNum(HttpServletRequest request){
        Reader reader = (Reader)request.getSession().getAttribute("reader");
        return readerService.getToReadCommentNum(reader.getReaderId());
    }
}
