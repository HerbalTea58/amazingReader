package com.amazingReader.mapper;

import com.amazingReader.entity.Recharge;

import java.util.List;

public interface RechargeMapper {
	boolean add(Recharge recharge);
	List<Recharge> getByReader(int readerID);
	/**
	 * 计算所有用户充值总额，用于计算平台报表
	 * @return
	 */
	double sumUp();
}
