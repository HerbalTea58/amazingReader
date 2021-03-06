package com.amazingReader.service.Interface;

import com.amazingReader.entity.*;
import com.amazingReader.entity.utilEntity.WriterData;
import com.amazingReader.entity.utilEntity.WriterOrder;
import com.amazingReader.mapper.WriterMapper;

import java.text.ParseException;
import java.util.List;

public interface WriterService {
	/**
	 * 作者登录
	 * @param writer
	 * @return
	 */
	public int writerLogin(Writer writer);

	/**
	 * 注册
	 * @param writer
	 * @return
	 */
	public boolean writerRegister(Writer writer);

	/**
	 * 创作新书
	 * @param book
	 */
	public void createBook(Book book);

	/**
	 * 修改书籍的基本信息
	 * @param book
	 * @return
	 */
	public boolean updateBook(Book book);

	/**
	 * 更新章节
	 */
	public void addChapter(Chapter chapter);
	/**
	 * 修改章节内容
	 */
	public boolean updateChapter(Chapter chapter);

	/**
	 * 添加每一章的作者有话说
	 * @param chapterAdditionRemarks
	 */
	public void addChapterAdditionRemarks(ChapterAdditionRemarks chapterAdditionRemarks);

	/**
	 * 修改作者有话说
	 * @param chapterAdditionRemarks
	 * @return
	 */
	public boolean updateChapterAdditionRemarks(ChapterAdditionRemarks chapterAdditionRemarks);

	/**
	 * 作者预览更新的章节内容
	 * @param chapterId
	 */
	public void preReadChapterupdated(int chapterId);


	 // 作者收入管理功能

	/**
	 * 查看订阅收入
	 * @param typeId
	 * @param writerId
	 * @return
	 */
	public Double getSubscribeIncomeOfType(int typeId,int writerId);

	/**
	 * 包月收入
	 * @param year
	 * @param month
	 * @param writerId
	 * @return
	 */
	public Integer getMonthIncomeOf(String year, String month, int writerId);

	/**
	 * 打赏收入
	 * @param writerId
	 * @return
	 */
	public Integer getRewardTypeIncome(int writerId);

	/**
	 * 此方法给作者使用，不判断会员等信息
	 * 读者禁用
	 * @param chapterId
	 * @return
	 */
	Chapter getChapterForWriter(int chapterId);

	boolean removeChapter(int chapterId);
	
	boolean alterChapter(Chapter chapter);

	Writer getWriterInfo(int writerId);

	boolean isWriterNameExist(String name);
	boolean isWriterTelExist(String tel);
	Writer queryWriterByTel(String tel);
	boolean alterWriterInfo(Writer writer);
	Writer getWriterByName(String writerName);
	List<Writer> getWritersByName(String name);
	List<WriterIncome> getRewardInfoOfWriter(int writerId);

	Integer getRewardTimes(int writerId);

	Integer getRewardTypeIncome(Integer writerId);

    Integer getSubscribeIncome(Integer writerId);

    boolean addQuestion(Question question);

	List<Question> getQuestionByWriterId(int WriterId);

	int getAllClickTimes(int WriterId);

	int getAllClickTimesByTime(int WriterId, String Time);

	int getAvgClickTimes(int WriterId);

	int getMaxClickTimes(int WriterId);


	int getAvgClickTimesByBook(int bookId);

	int getMaxClickTimesByBook(int bookId);


	/**
	 * 通过作者id得到消费订单
	 * @param WriterId
	 * @return
	 */
	List<WriterOrder> getReaderOrderByWriterId(int WriterId);

	/**
	 * 获得某月的订单
	 * @param year
	 * @param month
	 * @param WriterId
	 * @return
	 */
	List<WriterOrder> getWriterOrderByWriterIdAndTime(String year, String month, int WriterId);

	/**
	 * 获得某本书的全部订单
	 * @param bookId
	 * @return
	 */
	List<WriterOrder> getWriterOrderByBookId(int bookId);

	/**
	 * 得到某本书的全部收入
	 * @param bookId
	 * @return
	 */
	Double getIncomeByBookId(int bookId);


	/**
	 * 获得作者的全部收入
	 * @param WriterId
	 * @return
	 */
	double getAllIncome(int WriterId);

	/**
	 * 获得作者的全部相关订单
	 * @param WriterId
	 * @return
	 */
	List<WriterOrder> getAllOrder(int WriterId);

	double getIncomeByDate(String year, String month, int WriterId);

	ChapterAdditionRemarks getChapterAddition(int chapterId);

	Integer getClickTimesByDate(int bookId, String time);

	List<WriterData> getChapterByWriter(int writerId);

	List<WriterData> getChapterByBook(int bookId);


	Integer getByLabelName(String keyWord);

	boolean insertLabel(String keyWord);

	public boolean add(BookLabelRelation bookLabelRelation);

	public Double getMoney(int writerId);

	public Double upMoney(WriterIncome writerIncome);


	double getAllIncomeRead(int WriterId);

	double getAllIncomeReward(int WriterId);


	List<WriterOrder> getAllOrderRead(int WriterId);

	List<WriterOrder> getAllOrderReward(int WriterId);

	List<WriterOrder> getWriterOrderByBookIdAndType(int bookId, int typeId);

	Double getIncomeByBookIdAndType(int bookId, int typeId);

	double getIncomeByDateAndType(String year, String month, int WriterId, int typeId);

	List<WriterOrder> getWriterOrderByWriterIdAndTimeAndType(String year, String month, int WriterId, int typeId);

	List<Integer> getSignin(int writerId);

	boolean add(Signin signin);

	Integer getNumByYesAndToday(int writerId) throws ParseException;

	boolean ChangePass(int writerId, String password);

}
