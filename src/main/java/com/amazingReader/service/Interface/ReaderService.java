package com.amazingReader.service.Interface;

import com.amazingReader.entity.*;

import java.util.List;

public interface ReaderService {
	List<Book> getBookShelfByReaderId(int readerId);

	Reader getReaderInfo(int readerId);

	/**
	 *
	 * @param readerId
	 * @return
	 */
	public List<Integer> readerLoveBookStyleIds(int readerId);

	/**
	 * 添加读者爱好标签
	 * @param readerHobbyRelation
	 * @return
	 */
	public boolean addLovesBookStyle(ReaderHobbyRelation readerHobbyRelation);

	/**
	 * 通过读者id获得读者是否选择爱好类型标签
	 * @param readerId
	 * @return
	 */
	public List<BookStyle> getReaderChooseLove(int readerId);

	public List<BookStyle> getAllBookStyle();
	/**
	 * 通过登录信息获得读者信息
	 * @param input
	 * @return
	 */
	public Reader queryReaderByInput(String input);

	/**
	 * 返回值指示是否登录成功
	 * @param reader
	 * @return
	 */
	int login(Reader reader);
	/**
	 * 
	 * @param reader
	 * @return
	 */
	boolean alterInfo(Reader reader);
	/**
	 * 返回注册得到的账号
	 * 若返回-1则标识注册失败
	 * @param reader
	 * @return 
	 */
	int register(Reader reader);

	/**
	 * 判断名字是否被注册
	 * @param name
	 * @return
	 */
	boolean isNameExist(String name);
	/**
	 * 直接阅读使用这个方法
	 * 		返回传入书籍ID的首章
	 * @param bookID
	 * @param readerId
	 * @return
	 */
	Chapter readFirstChapterBy(int bookID, int readerId);
	/**
	 *
	 * 用户输入手机号
	 * 控制control端的验证码发送
	 * @param telNum
	 *
	 * @return
	 */
	boolean ReReaderPass(String telNum);
	/**
	 *
	 * @param comment
	 * @return
	 */
	boolean comment(Comment comment);
	/**
	 * 通过章节ID获得章节内容
	 * 返回null则表示无权查看该章节
	 * 该方法会修改书籍阅读记录至请求章节号位置
	 * @param chapterId
	 * @return
	 */
	Chapter read(int chapterId, int readerId);
	/**
	 * 通过书籍号和章节号获得章节内容
	 * 该方法会修改书籍阅读记录至请求章节号位置
	 * @param bookId
	 * @param chapterNum
	 * @return
	 */
	Chapter readBy(int bookId, int chapterNum, int readerId);
//	/**
//	 * 通过书架看书
//	 */
//	Chapter readBy(ReaderBookRelation readerBookRelation);
	/**
	 * 给出书籍号和读者信息（从session拿）
	 * 把书籍存入书架，章节默认值为1
	 * @param bookId
	 * @param readerId
	 * @return
	 */
	boolean addBookToBookShelf(int bookId, int readerId);
	/**
	 * 传入被举报评论ID，当前读者ID，举报类型ID，以及原因
	 * 其他字段留空
	 * @param reportComment
	 * @return
	 */
	boolean reportComment(ReportComment reportComment);
	/**
	 * 传入被举报章节ID，当前读者ID，举报类型ID，以及原因
	 * 其他字段留空
	 * @param reportChapter
	 * @return
	 */
	boolean reportChapter(ReportChapter reportChapter);
	/**
	 * 获得当前读者发出的评论
	 * @param readerId
	 * @return
	 */
	List<Comment> getCommentsSendBy(int readerId);
	/**
	 * 获得评论当前读者发出的评论的回复
	 * @param readerId
	 * @return
	 */
	List<Comment> readCommentsTo(int readerId);
	
	/**
	 * 充值
	 * 返回充值后余额
	 */
	int recharge(int num, int readerId);
	/**
	 * 获得该用户的首页定制化推荐
	 * @param readerId
	 * @return
	 */
	List<Book> getFirstPageBooks(int readerId);
	/**
	 * 获得活动书籍
	 */
	List<Book> getActivityBooks();

	/**
	 * 购买的单章
	 * @param chapterId
	 * @param price
	 * @param readerId
	 */
	boolean orderChapter(int chapterId, int price, int readerId);

	/**
	 * 多章购买
	 * @param price
	 * @param readerId
	 */
	boolean orderChapters(List<Integer> chapters, int price, int readerId);

	boolean isTelExist(String tel);
	public Reader queryReaderByTel(String tel);

	/**
	 * 获取发送的帖子
	 * @param readerId
	 * @return
	 */
	List<Comment> getPostsSendBy(int readerId);

	boolean isReaderGotChapter(int chapterId, int readerId);

	boolean rewardWriter(int readerId, int price, int writerId, Integer bookId);


	/**
	 * 修改书架 书籍信息
	 * @param readerBookRelation
	 * @return
	 */
	public boolean alter(ReaderBookRelation readerBookRelation);

	/**
	 * 删除书架
	 * @param readerBookRelation
	 * @return
	 */
	public boolean remove(ReaderBookRelation readerBookRelation);

	/**
	 * 获取书架书籍
	 * @param readerId
	 * @return
	 */
	public List<ReaderBookRelation> getByReaderId(int readerId);

	/**
	 * 根据读者id书架的书数量
	 * @param readerId
	 * @return
	 */
	public int countBook(int readerId);

	/**
	 * 根据bookid 获取到有多少人把这本书添加到书架
	 * @param bookId
	 * @return
	 */
	public int countReader(int bookId);
	public List<ReaderBookRelation> getBookShelfBooksByWriterName(String writername, int readerId);
	public ReaderBookRelation getBookShelfBooksByBookName(String bookname, int readerId);

	boolean isReaderCanRead(int chapterId, int readerId);

	boolean isReaderReadingBook(int bookId, int readerId);

	int getChapterNumIfReaderIsReadingBook(int bookId,int readerId);
	List<ReaderReadingRecord> getReaderReadingRecord(int readerId);
	public int getReaderLevel(int readerId);
	List<ReaderOrder> getOrdersByReaderId(int readerId);
	ReaderOrderType getReaderOrderType(ReaderOrder readerOrder);
	List<ReaderOrderDetail> getReaderOrderDetail(ReaderOrder readerOrder);
	List<ReaderHobbyRelation> getReaderHobby(Reader reader);
	public  Boolean updateReaderPortrait(int readerId,String picture);
	Statu get(int statuId);
	public Boolean updateReaderName(String name,int readerId);
	public boolean removeHobby(int readerId, int labelId);
	public Boolean removeReaderBookRelationByBookIdAndReaderId(int bookid,int readerId);

    /**
     * 获取未读评论条数
     * @param readerId
     * @return
     */
	Integer getToReadCommentNum(int readerId);
	public boolean alterReaderPassword(String password,int readerId);
	boolean updateBalance(int balance,int readerId);
	public Integer getReaderBalance(int readerId);
	public Boolean addRecord(ReaderRecommendTicketsRecord readerRecommendTicketsRecord);
	public Boolean updateRecord(int tickets,int bookId,int readerId);
	public Boolean removeRecord(int recordId);
	public List<ReaderRecommendTicketsRecord> getRecordsByReaderId(int readerId);
	public int getUsedRecommendTicketsNumByReaderId(int readerId);
	public int getUsedRecommendTicketsNumByBookId(int bookId);
	public int getRecommendTicketsByRecordId(int recordId);
	List<ReaderOrderDetail> getOrderDetail(int readerId, int orderId);
	public boolean insertRecord(ReaderRechargeRecord readerRechargeRecord);
	public boolean removeRecordByRecordId(int recordId);
	public boolean removeRecordByReaderId(int readerId);
	public List<ReaderRechargeRecord> getAllRechargeRecord();
	boolean recommentBook(Integer num, Integer readerId, Integer bookId);
	List<ReaderOrderDetail> getOrderDetailByOrderID(int orderId);
	public List<Integer> getChapterNumByOrderId(int orderId);
}
