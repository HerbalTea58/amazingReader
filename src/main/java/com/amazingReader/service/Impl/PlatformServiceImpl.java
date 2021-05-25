package com.amazingReader.service.Impl;

import com.amazingReader.entity.utilEntity.PlatformIncome;
import com.amazingReader.mapper.PlatformProfitMapper;
import com.amazingReader.service.Interface.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlatformServiceImpl implements PlatformService{
    @Autowired
    private PlatformProfitMapper platformProfitMapper;
    @Override
    public List<PlatformIncome> getTotalIncomeByMonth(int year) {
        return platformProfitMapper.totalIncomeByMounthOfyear(year);
    }

    @Override
    public List<PlatformIncome> getIncomesSortInWoman(int year) {
        return platformProfitMapper.incomeOfMonthSortInWoman(year);
    }

    @Override
    public List<PlatformIncome> getIncomesSortInMan(int year) {
        return platformProfitMapper.incomeOfMonthSortInMan(year);
    }


}
