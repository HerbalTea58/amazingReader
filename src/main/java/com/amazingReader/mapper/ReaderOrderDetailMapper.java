package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.ReaderOrderDetail;

public interface ReaderOrderDetailMapper {
	boolean add(ReaderOrderDetail readerOrderDetail);
	boolean alter(ReaderOrderDetail readerOrderDetail);
	boolean remove(int ReaderOrderId);
	List<ReaderOrderDetail> getOrderDetail(int readerId, int orderId);
	ReaderOrderDetail get(int readerId, int bookId,int chapterNum);
	List<ReaderOrderDetail> getOrderDetailByOrderID(int orderId);
	public List<Integer> getChapterNumByOrderId(int orderId);
	/**
	 * 作者订单收入
	 * @param writerId
	 * @return
	 */
	Double getWriterIncome(int writerId);
	/**
	 * 分类记录作者 收入
	 * @param type
	 * @param writerId
	 * @return
	 */
	Integer getWriterIncomeOfType( int type ,int writerId);

	/**
	 * 获取某位作者某月的书籍订阅收入
	 * @param year
	 * @param month
	 * @param writerId
	 * @return
	 */
	Integer getWriterIncomeByYearAndMonth(int year,int month,int writerId);

	Double getWriterIncomeByYearAndMonth2(String year,String month,int writerId);

}