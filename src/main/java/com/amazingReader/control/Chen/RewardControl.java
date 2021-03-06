package com.amazingReader.control.Chen;

import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/reward")
@RestController
public class RewardControl {
    @Autowired
    private ReaderService readerService;

    @RequestMapping("/reward.action")
    public boolean rewardWriter(Integer bookId,HttpServletRequest request,HttpServletResponse response){
        Integer price = Integer.parseInt(request.getParameter("price"));
        Integer writerId = Integer.parseInt(request.getParameter("writerId"));
        Reader reader = (Reader) request.getSession().getAttribute("reader");
        return readerService.rewardWriter(reader.getReaderId(),price,writerId,bookId);
    }
}
