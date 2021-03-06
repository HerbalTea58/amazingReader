package com.amazingReader.control.Gao;

import com.amazingReader.entity.Reader;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@RequestMapping("/reader")
@Controller
public class ReaderHeadPortraitControl {
    @Autowired
    private ReaderService readerService;
    @RequestMapping("/OtherHeadProtrait.action")
    public void getOtherHeadPortrait(Integer readerId,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Reader reader=readerService.getReaderInfo(readerId);
        request.setAttribute("reader",reader);
        request.getRequestDispatcher("/JSP/head1.jsp").forward(request,response);
    }
    @RequestMapping(value = "/updateHeadPortrait.action",method = RequestMethod.POST)
    public String updateTrue(MultipartFile imgFileUp, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reader reader1= (Reader) request.getSession().getAttribute("reader");
        Reader reader=readerService.getReaderInfo(reader1.getReaderId());
        String filename=imgFileUp.getOriginalFilename();
        String imgFile=request.getServletContext().getRealPath("Images");
        String img=imgFile+"/"+filename;
        File file=new File(img);
        // 创建
        if (!file.exists()){
            file.mkdirs();
        }else {
            file.delete();
            file.mkdirs();
        }
        imgFileUp.transferTo(file); //图片的复制
        reader.setReaderPortrait("Images/"+filename);
        String s="Images/"+filename;
        Boolean a=readerService.updateReaderPortrait(reader.getReaderId(),s);
        int id=reader1.getReaderId();
        return "redirect:/person/personal.action?readerId="+id+"";
    }

}

