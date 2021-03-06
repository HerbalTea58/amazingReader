package com.amazingReader.service.Impl;

import com.amazingReader.entity.*;
import com.amazingReader.entity.utilEntity.WriterData;
import com.amazingReader.entity.utilEntity.WriterOrder;
import com.amazingReader.mapper.*;
import com.amazingReader.service.Interface.WriterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class WriterServiceImpl implements WriterService {
	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private WriterMapper writerMapper;
	@Autowired
	private ChapterMapper chapterMapper;
	@Autowired
	private ChapterAdditionRemarksMapper chapterAdditionRemarksMapper;
	@Autowired
	private ReaderOrderMapper readerOrderMapper;
	@Autowired
	private ReaderOrderDetailMapper readerOrderDetailMapper;
	@Autowired
	private StatuMapper statuMapper;
	@Autowired
	private WriterIncomeMapper writerIncomeMapper;
	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private BookLabelMapper bookLabelMapper;
	@Autowired
	private BookLabelRelationMapper bookLabelRelationMapper;
	@Autowired
	private SigninMapper signinMapper;

	/**
	 * 默认参数中的writer登录信息 封装为 WriterNeckName 和 WriterPassword
	 * @param writer
	 * @return'
	 */
	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public int writerLogin(Writer writer) {
		if (writer!=null){//获得对象不为空
			//当作者昵称存在 或者该手机号存在
			System.out.println("serImpl~~~~"+writer.getWriterNeckName()+"~~"+writer.getWriterPassword());
			Writer trueWriter0=writerMapper.getWriterByName(writer.getWriterNeckName());

			if (trueWriter0!=null){
				System.out.println("~~NAme"+trueWriter0.getWriterNeckName());
				if (writer.getWriterNeckName().equals(trueWriter0.getWriterNeckName())){
					if(writer.getWriterPassword().equals(writerMapper.getWriterByName(writer.getWriterNeckName()).getWriterPassword())){
						return 1;//login success
					}else {
						return 0;//密码错误
					}
				}
			}else {
				Writer trueWriter1=writerMapper.getWriterByTel(writer.getWriterNeckName());
				if (trueWriter1!=null){
					System.out.println("~~NAme"+trueWriter0.getWriterNeckName());
					if(writer.getWriterNeckName().equals(trueWriter1.getWriterTel())){
						if(writer.getWriterPassword().equals(writerMapper.getWriterByTel(writer.getWriterNeckName()).getWriterPassword())){
							return 1;//login success
						}else {
							return 0;//密码错误
						}
					}
				}else{//作者昵称或者手机号不存在
					return 2;
				}

			}

		}
		return -1;
	}

	@Override
	public boolean writerRegister(Writer writer) {
		if (writer!=null){
			writerMapper.add(writer);
			return true;
		}
		return false;
	}

	@Override
	public void createBook(Book book) {
		bookMapper.add(book);
	}

	@Override
	public boolean updateBook(Book book) {
		if(bookMapper.alter(book)){
			return true;
		}
		return false;
	}

	@Override
	public void addChapter(Chapter chapter) {
		chapterMapper.add(chapter);

	}

	@Override
	public boolean updateChapter(Chapter chapter) {
		if (chapterMapper.alter(chapter)){
			return true;
		}
		return false;
	}

	@Override
	public void addChapterAdditionRemarks(ChapterAdditionRemarks chapterAdditionRemarks) {
		chapterAdditionRemarksMapper.add(chapterAdditionRemarks);
	}

	@Override
	public boolean updateChapterAdditionRemarks(ChapterAdditionRemarks chapterAdditionRemarks) {
		if (chapterAdditionRemarksMapper.alter(chapterAdditionRemarks)){
			return true;
		}
		return false;
	}

	@Override
	public void preReadChapterupdated(int chapterId) {
		chapterMapper.getChapterById(chapterId);

	}

	@Override
	public Double getSubscribeIncomeOfType(int typeId, int writerId) {
		return readerOrderDetailMapper.getWriterIncome(writerId);
	}

	@Override
	public Integer getMonthIncomeOf(String year, String month, int writerId) {
		System.out.println(year+"    "+month);
		return writerIncomeMapper.getMonthIncomeOf(year,month,writerId);
	}

	@Override
	public Integer getRewardTypeIncome(int writerId) {
		return readerOrderMapper.getRewardIncomeOfWriter(writerId);
	}

	@Override
	public Chapter getChapterForWriter(int chapterId) {
		return chapterMapper.getChapterById(chapterId);
	}

	/**
	 *
	 * @param chapterId
	 * @return
	 */
	@Override
	public boolean removeChapter(int chapterId) {
		return chapterMapper.removeByChapterId(chapterId);
	}

	@Override
	public boolean alterChapter(Chapter chapter) {
		return chapterMapper.alter(chapter);
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public Writer getWriterInfo(int writerId) {
		Writer writer = writerMapper.getWriter(writerId);
		writer.setStatuName(statuMapper.get(writer.getWriterStatuId()).getStatuName());
		writer.setBookNum(bookMapper.getBookByWriterId(writerId).size());
		return writer;
	}

	@Override
	public boolean isWriterNameExist(String name) {//作者登录名（昵称或者手机号）是否存在
		if(writerMapper.getWriterByName(name)!=null || writerMapper.getWriterByTel(name)!=null){
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean isWriterTelExist(String tel) {
		if (writerMapper.getWriterByTel(tel)!=null){
			return true;
		}
		return false;
	}

	@Override
	public Writer queryWriterByTel(String tel) {
		return writerMapper.getWriterByTel(tel);
	}


	@Override
	public boolean alterWriterInfo(Writer writer) {
		return writerMapper.alter(writer);
	}

	@Override
	public Writer getWriterByName(String writerName) {
		return writerMapper.getWriterByName(writerName);
	}

	@Override
	public List<Writer> getWritersByName(String name) {
		return writerMapper.getWritersByName(name);
	}

	@Override
	public List<WriterIncome> getRewardInfoOfWriter(int writerId) {
		return writerIncomeMapper.getByWriterId(writerId);
	}

	@Override
	public Integer getRewardTimes(int writerId) {
		return writerIncomeMapper.getRewardTimes(writerId);
	}

    @Override
    public Integer getRewardTypeIncome(Integer writerId) {
        return writerIncomeMapper.getWriterRewardIncome(writerId);
    }

    @Override
    public Integer getSubscribeIncome(Integer writerId) {
        return writerIncomeMapper.getWriterSubscribeIncome(writerId);
    }


	@Override
	public boolean addQuestion(Question question) {
		return questionMapper.add(question);
	}

	@Override
	public List<Question> getQuestionByWriterId(int WriterId) {
		return questionMapper.getByWriterId(WriterId);
	}

	@Override
	public int getAllClickTimes(int WriterId) {
		List<Book> bookList = bookMapper.getBookByWriterId(WriterId);
		int sum =0;
		for(Book n:bookList){
			sum = sum + bookMapper.getClickNum(n.getBookId());
		}
		return sum;
	}

	@Override
	public int getAllClickTimesByTime(int WriterId, String Time) {
		List<Book> bookList = bookMapper.getBookByWriterId(WriterId);
		Integer sum1 =0;
		for(Book n:bookList){
			Integer sum2 = bookMapper.getClickTimesByDate(n.getBookId(), Time);
			if (sum2 == null)
				sum2 = 0;
			sum1 = sum1 + sum2;
		}
		return sum1;
	}

	@Override
	public int getAvgClickTimes(int WriterId) {
		List<Book> bookList = bookMapper.getBookByWriterId(WriterId);
		int length = bookList.size();
		int sum =0;
		for(Book n:bookList){
		    Integer sum2 = bookMapper.getAvgClickTimes(n.getBookId());
		    if(sum2 == null)
		        sum2 = 0;
			sum = sum + sum2;
		}
		return sum/length;
	}

	@Override
	public int getMaxClickTimes(int WriterId) {
		List<Book> bookList = bookMapper.getBookByWriterId(WriterId);
		int max =0;
		for(Book n:bookList){
		    Integer num = bookMapper.getMaxClickTimes(n.getBookId());
		    if(num == null)
		        num = 0;
			if(max< num){
				max = bookMapper.getMaxClickTimes(n.getBookId());
			}
		}
		return max;
	}

	@Override
	public int getAvgClickTimesByBook(int bookId) {
		Integer num = bookMapper.getAvgClickTimes(bookId);
		if(num == null){
			num = 0;
		}
		return num;
	}

	@Override
	public int getMaxClickTimesByBook(int bookId) {
		Integer num  = bookMapper.getMaxClickTimes(bookId);
		if(num == null){
			num = 0;
		}
		return num;
	}

	@Override
	public List<WriterOrder> getReaderOrderByWriterId(int WriterId) {
		return null;
	}

	@Override
	public List<WriterOrder> getWriterOrderByWriterIdAndTime(String year, String month, int WriterId) {
		return readerOrderMapper.getOrderByDate(year, month, WriterId);
	}

	@Override
	public List<WriterOrder> getWriterOrderByBookId(int bookId) {
		return readerOrderMapper.getOrderByBookId(bookId);
	}

	@Override
	public Double getIncomeByBookId(int bookId) {
		Double num = readerOrderMapper.getIncomeByBookId(bookId);
		if(num == null)
			num = 0.0;
		return num/100.0;
	}

	@Override
	public double getAllIncome(int WriterId) {
		Double income = readerOrderDetailMapper.getWriterIncome(WriterId);
		if(income == null)
			return 0;
		else
			return (income)/100.0;
	}

	@Override
	public List<WriterOrder> getAllOrder(int WriterId) {
		return readerOrderMapper.getAllOrder(WriterId);
	}

	@Override
	public double getIncomeByDate(String year, String month, int WriterId) {
		Double income = readerOrderDetailMapper.getWriterIncomeByYearAndMonth2(year,month,WriterId);
		if(income == null)
			return 0;
		else
			return income/100.00;
	}

	@Override
	public ChapterAdditionRemarks getChapterAddition(int chapterId) {
		return chapterAdditionRemarksMapper.getChapterAdditionBy(chapterId);
	}

	@Override
	public Integer getClickTimesByDate(int bookId, String time) {
		Integer num = bookMapper.getClickTimesByDate(bookId, time);
		if(num == null){
			num = 0;
		}
		return num;
	}

	@Override
	public List<WriterData> getChapterByWriter(int writerId) {
		return chapterMapper.getChapterByWriter(writerId);
	}

	@Override
	public List<WriterData> getChapterByBook(int bookId) {
		return chapterMapper.getChaptersByBookId1(bookId);
	}

	@Override
	public Integer getByLabelName(String keyWord) {
		return bookLabelMapper.getByLabelName(keyWord);
	}

	@Override
	public boolean insertLabel(String keyWord) {
		return bookLabelMapper.insertLabel(keyWord);
	}

	@Override
	public boolean add(BookLabelRelation bookLabelRelation) {
		return bookLabelRelationMapper.add(bookLabelRelation);
	}

	@Override
	public Double getMoney(int writerId){
		Double num = writerMapper.getMoney(writerId);
		return num;
	}

	@Override
	public Double upMoney(WriterIncome writerIncome) {
		boolean re = writerIncomeMapper.add(writerIncome);
		Double num = writerMapper.getMoney(writerIncome.getWriterId());
		return num;
	}

	@Override
	public double getAllIncomeRead(int WriterId) {
		return readerOrderMapper.getWriterIncomeOfType2(1, WriterId);
	}

	@Override
	public double getAllIncomeReward(int WriterId){
		return readerOrderMapper.getWriterIncomeOfType2(2, WriterId);

	}

	@Override
	public List<WriterOrder> getAllOrderRead(int WriterId) {
		return readerOrderMapper.getAllOrderByType(1, WriterId);
	}

	@Override
	public List<WriterOrder> getAllOrderReward(int WriterId) {
		return readerOrderMapper.getAllOrderByType(2, WriterId);
	}

	@Override
	public List<WriterOrder> getWriterOrderByBookIdAndType(int bookId, int typeId) {
		return readerOrderMapper.getWriterOrderByBookIdAndType(bookId, typeId);
	}

	@Override
	public Double getIncomeByBookIdAndType(int bookId, int typeId) {
		return readerOrderMapper.getIncomeByBookIdAndType(bookId, typeId);
	}

	@Override
	public double getIncomeByDateAndType(String year, String month, int WriterId, int typeId) {
		Double num = readerOrderMapper.getIncomeByDateAndType(year, month, WriterId, typeId);
		if(num == null)
			return 0.0;
		else
			return num/100.00;
	}

	@Override
	public List<WriterOrder> getWriterOrderByWriterIdAndTimeAndType(String year, String month, int WriterId, int typeId) {
		return readerOrderMapper.getWriterOrderByWriterIdAndTimeAndType(year, month, WriterId, typeId);
	}

	@Override
	public List<Integer> getSignin(int writerId) {
		return signinMapper.getSignin(writerId);
	}

	@Override
	public boolean add(Signin signin) {
		return signinMapper.add(signin);
	}

	@Override
	public Integer getNumByYesAndToday(int writerId) throws ParseException {
		Calendar c1 = Calendar.getInstance();
		c1.add(Calendar.DAY_OF_MONTH, -1);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String yes = formatter.format(c1.getTime());
//		Date yesDay = formatter.parse(yes);

		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, 0);
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		String today = formatter1.format(c.getTime());
//		Date today1 = formatter1.parse(today);

		Integer num1 = writerMapper.getNumBydate(yes, writerId);
		Integer num2 = writerMapper.getNumBydate(today, writerId);
		if(num1 == null)
			num1 = 0;
		if(num2 == null)
			num2 = 0;
		return num2-num1;
	}

	@Override
	public boolean ChangePass(int writerId, String password) {
		return writerMapper.ChangePass(writerId, password);
	}


}
