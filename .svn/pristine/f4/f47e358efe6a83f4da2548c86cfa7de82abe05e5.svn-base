package com.amazingReader.mapper;

import java.util.Date;
import java.util.List;

import com.amazingReader.entity.PlatformProfit;
import com.amazingReader.entity.utilEntity.PlatformIncome;

public interface PlatformProfitMapper {
	public boolean add(PlatformProfit platformProfit);

	public double countProfit();

	public double countProfitBetween(Date dateBottom, Date dateTop);

	public double countProfitBetweenTimeByType(Date dateBottom, Date dateTop, int Type_id);

	public List<PlatformIncome> totalIncomeByMounthOfyear(int year);//统计某一年份的各个总收入

	public List<PlatformIncome> incomeOfMonthSortInWoman(int yeart);//分男频女频统计某一年每个月份的收入
	public List<PlatformIncome> incomeOfMonthSortInMan(int yeart);
}