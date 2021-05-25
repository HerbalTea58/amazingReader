package com.amazingReader.control;

import com.amazingReader.entity.utilEntity.PlatformIncome;
import com.amazingReader.service.Interface.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("manager")
@RestController
public class PlatformIncomeControl {
    @Autowired
    private PlatformService platformService;
    @RequestMapping("/platformIncome.action")
    public Map<String, double[]> showPlatformIncomeByYear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得需要展示的年份
        int year=Integer.parseInt(request.getParameter("showYear"));
        //获得该年份的女频各月收入
        List<PlatformIncome> totalIncomeOfWoman=platformService.getIncomesSortInWoman(year);
        List<PlatformIncome> totalIncomeOfMan=platformService.getIncomesSortInMan(year);

        double[] manIncome=new double[12];
        double[] WomanIncome=new double[12];
        for(PlatformIncome income : totalIncomeOfMan ){
            manIncome[income.getThisMonth()-1] = income.getTotalIncome();
        }
        for(PlatformIncome income : totalIncomeOfWoman ){
            WomanIncome[income.getThisMonth()-1] = income.getTotalIncome();
        }

       /* Double[] manIncome={12.0,33.0,44.0,33.0,33.0,87.0,89.0,88.0,90.0,87.0,23.0,344.0};
        Double[] WomanIncome={12.0,33.0,44.0,33.0,33.0,87.0,89.0,88.0,90.0,87.0,23.0,344.0};*/
        Map<String,double[]> map=new HashMap<>();
        map.put("man",manIncome);
        map.put("woman",WomanIncome);

        return map;

    }

    @RequestMapping("platformIncomeOfYear.action")
    public double[] showPlatformIncomeOfYear(HttpServletRequest request,HttpServletResponse response){
        //获得需要展示的年份
        int year=Integer.parseInt(request.getParameter("showYear"));
        //获得该年份的各月收入
        List<PlatformIncome> totalIncomeByYear=platformService.getTotalIncomeByMonth(year);
        System.out.println(totalIncomeByYear.toString());
        double[] incomeByYearOfMonth=new double[12];
        for(PlatformIncome income : totalIncomeByYear ){
            incomeByYearOfMonth[income.getThisMonth()-1] = income.getTotalIncome();
        }
        return incomeByYearOfMonth;
    }


}
