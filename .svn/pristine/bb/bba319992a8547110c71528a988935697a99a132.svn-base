package com.amazingReader.control.Gao;

import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ReaderRechargeRecord;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequestMapping("/reader")
@Controller
public class ReaderRechargeRecordControl {
    @Autowired
    private ReaderService readerService;
    @RequestMapping("/readerRechargeRecord.action")
    public void getReaderReachargeRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=readerService.getReaderInfo(reader1.getReaderId());
        List<ReaderRechargeRecord> readerRechargeRecords=readerService.getAllRechargeRecord();
        request.setAttribute("readerRechargeRecords",readerRechargeRecords);
        request.setAttribute("reader",reader);
        request.getRequestDispatcher("/JSP/rechargeRecord.jsp").forward(request,response);
    }
}
