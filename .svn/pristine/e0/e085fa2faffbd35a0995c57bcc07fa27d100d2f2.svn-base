package com.amazingReader.control.Gao;

import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ReaderRechargeRecord;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@RequestMapping("/reader")
@RestController
public class ReaderRechargeControl {
    @Autowired
    private ReaderService readerService;
    @RequestMapping("/readerRecharge.action")
    public Integer getReaderRecharge(String money, HttpServletRequest request, HttpServletResponse response){
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=new Reader();
        if (reader1!=null) {
            reader = readerService.getReaderInfo(reader1.getReaderId());
        }
        ReaderRechargeRecord readerRechargeRecord=new ReaderRechargeRecord();
        char[] a=money.trim().toCharArray();
        String rechargeMoney=a[1]+""+a[2];
        Integer money1=Integer.parseInt(rechargeMoney);
        readerService.updateBalance(money1*100,reader.getReaderId());
        int money2=readerService.getReaderBalance(reader.getReaderId());
        readerRechargeRecord.setRechargeMoney(money1);
        readerRechargeRecord.setRechargeTime(new Date());
        readerRechargeRecord.setRechargeReaderId(reader.getReaderId());
        readerService.insertRecord(readerRechargeRecord);
        return money2;
    }
}
