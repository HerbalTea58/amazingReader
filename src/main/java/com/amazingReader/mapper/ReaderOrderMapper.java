package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ReaderOrder;
import com.amazingReader.entity.ReaderOrderDetail;
import com.amazingReader.entity.utilEntity.WriterOrder;

public interface ReaderOrderMapper {
	int add(ReaderOrder readerOrder);
	boolean alter(ReaderOrder readerOrder);
	boolean remove(int ReaderOrderDetailId);
	/*List<ReaderOrderDetail> getOrderDetail(int orderId);*/
	ReaderOrder getOrderByOrderID(int orderId);

	//添加一个方法：通过读者id 得到该读者的所有订单
	List<ReaderOrder> getOrdersByReaderId(int readerId);

	/**
	 * 获取某位作者的总打赏金额
	 * @param writerId
	 * @return
	 */
	Integer getRewardIncomeOfWriter(int writerId);

	/**
	 * 获取某位作者的某月打赏金额
	 * @param writerId
	 * @return
	 */
	Integer getMonthRewardIncomeOfWriter(int year,int month,int writerId);

	/**
	 * 获取最后插入的Id
	 * @return
	 */
	int getLastInsertId();
	
	/**
	 * 获得作者相关的全部订单
	 * @param WriterId
	 * @return
	 */
	List<WriterOrder> getAllOrder(int WriterId);
	/**
	 * 获得某位作者某月的全部订单
	 */
	List<WriterOrder> getOrderByDate(String year, String month, int WriterId);

	List<WriterOrder> getOrderByBookId(int bookId);

	Double getIncomeByBookId(int bookId);

	List<WriterOrder> getAllOrderByType(int typeId,int WriterId);

	List<WriterOrder> getWriterOrderByBookIdAndType(int bookId, int typeId);

	Double getIncomeByBookIdAndType(int bookId, int typeId);

	Double getIncomeByDateAndType(String year, String month, int WriterId, int typeId);

	List<WriterOrder> getWriterOrderByWriterIdAndTimeAndType(String year, String month, int WriterId, int typeId);

	Double getWriterIncomeOfType2( int type ,int writerId);
}