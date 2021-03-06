package com.amazingReader.service.Impl;

import com.amazingReader.entity.*;
import com.amazingReader.mapper.*;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ReaderServiceImpl implements ReaderService {
    @Autowired
    private RechargeMapper rechargeMapper;
    @Autowired
    private ReaderMapper readerMapper;
    @Autowired
    private ChapterMapper chapterMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private ReaderReadingRecordMapper readerReadingRecordMapper;
    @Autowired
    private ReaderBookRelationMapper readerBookRelationMapper;
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private ReaderOrderDetailMapper readerOrderDetailMapper;
    @Autowired
    private ReportChapterMapper reportChapterMapper;
    @Autowired
    private ReportCommentMapper reportCommentMapper;
    @Autowired
    private ChapterAdditionRemarksMapper chapterAdditionRemarksMapper;
    @Autowired
    private ReaderOrderMapper readerOrderMapper;
    @Autowired
    private BookStyleMapper bookStyleMapper;
    @Autowired
    private ReaderHobbyRelationMapper readerHobbyRelationMapper;
    @Autowired
    private WriterIncomeMapper writerIncomeMapper;
    @Autowired
    private ScoreLevelInformationMapper scoreLevelInformationMapper;
    @Autowired
    private ReaderOrderTypeMapper readerOrderTypeMapper;
    @Autowired
    private StatuMapper statuMapper;
    @Autowired
    private PlatformProfitMapper platformProfitMapper;
    @Autowired
    private WriterMapper writerMapper;
    @Autowired
    private ReaderRecommendTicketsRecordMapper readerRecommendTicketsRecordMapper;
    @Autowired
    private ReaderRechargeRecordMapper readerRechargeRecordMapper;

    @Override
    public List<Book> getBookShelfByReaderId(int readerId){
        List<ReaderBookRelation> bookShelfInfo = readerBookRelationMapper.getByReaderId(readerId);
        List<Book> shelf = new ArrayList<>();
        for (ReaderBookRelation relation : bookShelfInfo){
            shelf.add(bookMapper.getBookById(relation.getReaderBookBookId()));
        }
        return shelf;
    }

    @Override
    public Reader getReaderInfo(int readerId) {
        return readerMapper.getReader(readerId);
    }

    @Override
    public List<Integer> readerLoveBookStyleIds(int readerId) {
        return readerMapper.selectStyleIdsByReaderId(readerId);
    }

    @Override//??????????????????
    public boolean addLovesBookStyle(ReaderHobbyRelation readerHobbyRelation) {
        return readerHobbyRelationMapper.add(readerHobbyRelation);
    }

    @Override
    public List<BookStyle> getReaderChooseLove(int readerId) {
        return readerMapper.getReaderLabelByID(readerId);
    }

    @Override
    public List<BookStyle> getAllBookStyle() {
        return bookStyleMapper.getAllBookStyle();
    }

    /**
     * ??????reader?????????????????????????????????????????????readerId???????????????readerNeckName
     */
    @Override
    public int login(Reader reader) {

        if (reader != null) {
            //login by tel
            Reader trueReader = readerMapper.getReaderByTel(reader.getReaderNeckName());
            if (trueReader != null) {
                if(trueReader.getReaderStatuId() == -1)
                    return -1;//?????????
                if (trueReader.getReaderPassword().equals(reader.getReaderPassword())) {
                    return 1;
                } else {
                    return 0;//????????????
                }
            } else {
                //login by readerName
                Reader trueReader0 = readerMapper.getReaderByName(reader.getReaderNeckName());

                if (trueReader0 != null) {
                    if(trueReader0.getReaderStatuId() == -1)
                        return -1;//?????????
                    if (trueReader0.getReaderStatuId() != -1 && trueReader0.getReaderPassword().equals(reader.getReaderPassword())) {
                        return 1;//login success
                    } else {
                    return 0;//????????????

                }
            } else {
                    return 2;//?????????????????????????????????
                }
            }

        }
        return -1;
    }
    @Override
    public boolean alterInfo(Reader reader) {
        if (reader.getReaderId() != 0) {
            return readerMapper.alter(reader);
        }
        return false;
    }

    @Override
    public int register(Reader reader) {
        if (reader != null) {
            readerMapper.add(reader);
            return readerMapper.getReaderByName(reader.getReaderNeckName()).getReaderId();
        }
        return -1;
    }
    @Override
    public boolean isNameExist(String name) {
        //??????????????????
        if(readerMapper.getReaderByName(name)!=null){
            return true;
        }
        return false;
    }
    @Override
    public boolean isTelExist(String tel){
        //?????????????????????
        if (readerMapper.getReaderByTel(tel)!=null){
            return true;
        }
        return false;
    }

    @Override
    public Reader queryReaderByTel(String tel) {
      Reader reader=readerMapper.getReaderByTel(tel);
      return reader;

    }

    @Override
    public List<Comment> getPostsSendBy(int readerId) {
        List<Comment> comments = commentMapper.getAllPostSendBy(readerId);
        return comments;
    }

    @Override
    public Reader queryReaderByInput(String input) {
        Reader reader;
        if (readerMapper.getReaderByTel(input)!=null){
            reader=readerMapper.getReaderByTel(input);
        }else{
            reader=readerMapper.getReaderByName(input);
        }

        return reader;

    }

    /**
     *
     * @param bookID
     * @param readerId
     * @return
     */

    @Override
    public Chapter readFirstChapterBy(int bookID, int readerId) {
        int chapterId = chapterMapper.getFirstChapterIdOf(bookID);
        Chapter chapter = this.readChapter(chapterId, readerId);
        return chapter;
    }

    /**
     * ????????????????????????????????????????????????????????????1??????????????????????????????2 ???
     *
     * @param chapterId
     * @param readerId
     * @return
     */
    private Chapter readChapter(int chapterId, int readerId) {
        Chapter chapter = chapterMapper.getChapterById(chapterId);//??????????????????
        if(chapter != null) {
            if (chapter.getChapterAddition()) {
                chapter.setChapterAdditionRemarks(chapterAdditionRemarksMapper.getChapterAdditionBy(chapterId));
            }
            if(chapter.getChapterDownShelf() ) {
                if (bookMapper.getBookById(chapter.getChapterBookId()).getBookDownShelf() || //??????????????????
                        bookMapper.getBookById(chapter.getChapterBookId()).getBookActivityStatu() ||//??????????????????
                        chapter.getChapterStatu() ||//??????????????????
                        readerMapper.getReader(readerId).getReaderStatuId() == 2 ||//??????????????????
                        isReaderGotChapter(chapterId, readerId)//??????????????????
                        ) {
                    //??????????????????
                    ReaderReadingRecord readerReadingRecord = new ReaderReadingRecord();
                    readerReadingRecord.setBookId(chapter.getChapterBookId());
                    readerReadingRecord.setChapterNum(chapter.getChapterNum());
                    readerReadingRecord.setReaderId(readerId);
                    readerReadingRecord.setRecordTime(new Date());
                    //?????????????????????????????????????????????????????????
                    ReaderReadingRecord readerReadingRecordBefore = readerReadingRecordMapper.getByBookIdAndReaderId(readerId,
                            chapter.getChapterBookId());
                    if (readerReadingRecordBefore == null) {
                        //????????????????????????
                        readerReadingRecordMapper.add(readerReadingRecord);//??????????????????
                    } else {
                        //??????????????????
                        readerReadingRecord.setRecordId(readerReadingRecordBefore.getRecordId());
                        readerReadingRecord.setChapterNum(chapter.getChapterNum());
                        readerReadingRecord.setRecordTime(new Date());
                        readerReadingRecordMapper.alter(readerReadingRecord);
                    }
                    chapterMapper.click(chapterId);//?????????++
                } else {
                    //??????????????????????????????????????????
                    chapter.setChapterContent(null);
                    return chapter;
                }
            }else {
                //???????????????????????????????????????
                chapter.setChapterContent("??????????????????");
                return chapter;
            }
        }
        return chapter;
    }

    public boolean isReaderGotChapter(int chapterId, int readerId) {
        Chapter chapter = chapterMapper.getChapterById(chapterId);
        if (readerOrderDetailMapper.get(readerId, chapter.getChapterBookId(), chapter.getChapterNum()) == null) {
            return false;
        }
        return true;

    }

    @Override
    public boolean rewardWriter(int readerId, int price, int writerId, Integer bookId) {
        Reader reader = getReaderInfo(readerId);
        if(reader.getReaderBalance() >= price) {
            //??????????????????
            ReaderOrder readerOrder = new ReaderOrder();
                readerOrder.setReaderId(readerId);
                readerOrder.setReaderOrderObjectId(bookId);
                readerOrder.setReaderOrderTime(new Date());
                readerOrder.setReaderOrderTypeId(2);
                readerOrder.setReaderOrderPrice(price);
                readerOrder.setReaderOrderDetail(false);
            readerOrderMapper.add(readerOrder);

            int readerOrderId = readerOrderMapper.getLastInsertId();
            //????????????
            PlatformProfit profit = new PlatformProfit();
                profit.setOrderId(readerOrderId);
                profit.setProfitTime(new Date());
                Double platformProfit = Math.ceil(price*BookService.platformProfitPercentage);
                profit.setProfitPrice(platformProfit);
                profit.setProfitTypeId(2);
            //????????????
            WriterIncome writerIncome = new WriterIncome();
                writerIncome.setReaderId(readerId);
                writerIncome.setWriterId(writerId);
                writerIncome.setWriterIncomeDate(new Date());
                writerIncome.setWriterIncomeTotal(price-platformProfit.intValue());
                writerIncome.setWriterIncomeTypeId(2);
            //??????????????????
            reader.setReaderBalance(reader.getReaderBalance() - price);
            readerMapper.alter(reader);
            //????????????????????????????????????
            platformProfitMapper.add(profit);
            writerIncomeMapper.add(writerIncome);
            return true;
        }
        return false;
    }

    @Override
    public boolean ReReaderPass(String telNum) {

      return false;
    }

    @Override
    public boolean comment(Comment comment) {
        return commentMapper.add(comment);
    }

    @Override
    public Chapter read(int chapterId, int readerId) {
        return this.readChapter(chapterId, readerId);
    }

    @Override
    public Chapter readBy(int bookId, int chapterNum, int readerId) {
        int chapterId = chapterMapper.getChapterIdBy(bookId, chapterNum);
        return this.readChapter(chapterId, readerId);
    }

    @Override
    public boolean addBookToBookShelf(int bookId, int readerId) {
        ReaderBookRelation readerBookRelation = new ReaderBookRelation();
            readerBookRelation.setReaderBookAddTime(new Date());
            readerBookRelation.setReaderBookBookId(bookId);
            readerBookRelation.setReaderId(readerId);
            readerBookRelation.setReaderBookReadingChapterNum(1);
        if(readerBookRelationMapper.getByReaderId(readerId).contains(readerBookRelation)){
            readerBookRelationMapper.alter(readerBookRelation);
            return false;
        }else{
            bookMapper.collect(bookId);//???????????????++
            return readerBookRelationMapper.add(readerBookRelation);
        }
    }

    @Override
    public boolean reportComment(ReportComment reportComment) {
        try {
            reportCommentMapper.add(reportComment);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean reportChapter(ReportChapter reportChapter) {
        return reportChapterMapper.add(reportChapter);
    }

    @Override
    public List<Comment> getCommentsSendBy(int readerId) {
        List<Comment> comments = commentMapper.getCommentsByReaderId(readerId);
        for(Comment comment : comments){
            comment.setCommentedReader(readerMapper.getReader(comment.getCommentCommentedId()));
        }
        return comments;
    }

    @Override
    public List<Comment> readCommentsTo(int readerId) {
        return commentMapper.getCommentsToReaderId(readerId);
    }

    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @Override
    public int recharge(int price, int readerId) {
        //??????????????????
        Recharge recharge = new Recharge();
        recharge.setRechargePrice(null);
        recharge.setRechargeReaderId(readerId);
        recharge.setRechargeTime(new Date());
        rechargeMapper.add(recharge);
        //????????????
        Reader reader = readerMapper.getReader(readerId);
        reader.setReaderBalance(reader.getReaderBalance() + price);
        readerMapper.alter(reader);

        return reader.getReaderBalance();
    }

    @Override
    public List<Book> getFirstPageBooks(int readerId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Book> getActivityBooks() {
        return bookMapper.getActivityBooks();
    }

    /*@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)*/
    @Override
    public boolean orderChapter(int chapterId, int price, int readerId) {
        Reader reader = readerMapper.getReader(readerId);
        Chapter chapter = chapterMapper.getChapterById(chapterId);
        if(price <= reader.getReaderBalance()) {
            //??????????????????
            ReaderOrder readerOrder = new ReaderOrder();
                readerOrder.setReaderId(readerId);
                readerOrder.setReaderOrderObjectId(chapter.getChapterBookId());
                readerOrder.setReaderOrderTime(new Date());
                readerOrder.setReaderOrderTypeId(1);
                readerOrder.setReaderOrderPrice(price);
                readerOrder.setReaderOrderDetail(true);
            readerOrderMapper.add(readerOrder);

            int readerOrderId = readerOrderMapper.getLastInsertId();

            //????????????????????????
            ReaderOrderDetail readerOrderDetail  =new ReaderOrderDetail();
                readerOrderDetail.setReaderId(readerId);
                readerOrderDetail.setReaderOrderId(readerOrderId);
                readerOrderDetail.setReaderOrderDetailChapterNum(chapter.getChapterNum());
                readerOrderDetail.setReaderOrderDetailPrice(price);
                readerOrderDetail.setReaderOrderDetailBookId(chapter.getChapterBookId());
            readerOrderDetailMapper.add(readerOrderDetail);
            //????????????
            PlatformProfit profit = new PlatformProfit();
                profit.setOrderId(readerOrderId);
                profit.setProfitTime(new Date());
                Double platformProfit = Math.ceil(price*BookService.platformProfitPercentage);
                profit.setProfitPrice(platformProfit);
                profit.setProfitTypeId(1);
            //????????????
            WriterIncome writerIncome = new WriterIncome();
                writerIncome.setReaderId(readerId);
                writerIncome.setWriterId(writerMapper.getWriter(bookMapper.getBookById(chapter.getChapterBookId()).getBookWriterId()).getWriterId());
                writerIncome.setWriterIncomeDate(new Date());
                writerIncome.setWriterIncomeTotal(price-platformProfit.intValue());
                writerIncome.setWriterIncomeTypeId(1);
            //????????????
            reader.setReaderBalance(reader.getReaderBalance()-price);
            readerMapper.updateBalance(-price,reader.getReaderId());
            //?????????
            writerIncomeMapper.add(writerIncome);
            platformProfitMapper.add(profit);
            return true;
        }
        return false;
    }

    @Override
    public boolean orderChapters(List<Integer> chapters,int price,int readerId) {
        Reader reader = readerMapper.getReader(readerId);
        List<Chapter> chapterList = new ArrayList<>();
        for(Integer chapterId : chapters)
             chapterList.add(chapterMapper.getChapterById(chapterId));
        if(price <= reader.getReaderBalance()) {
            //??????????????????
            ReaderOrder readerOrder = new ReaderOrder();
            readerOrder.setReaderId(readerId);
            readerOrder.setReaderOrderObjectId(chapterList.get(0).getChapterBookId());
            readerOrder.setReaderOrderTime(new Date());
            readerOrder.setReaderOrderTypeId(1);
            readerOrder.setReaderOrderPrice(price);
            readerOrder.setReaderOrderDetail(true);
            readerOrderMapper.add(readerOrder);

            int readerOrderId = readerOrderMapper.getLastInsertId();

            //????????????????????????
            for(Chapter chapter : chapterList) {
                ReaderOrderDetail readerOrderDetail = new ReaderOrderDetail();
                readerOrderDetail.setReaderId(readerId);
                readerOrderDetail.setReaderOrderId(readerOrderId);
                readerOrderDetail.setReaderOrderDetailChapterNum(chapter.getChapterNum());
                readerOrderDetail.setReaderOrderDetailPrice((int)((chapterMapper.getChapterWordsNum(chapter.getChapterId())/1000.0)*BookService.thousandWordsPrice));
                readerOrderDetail.setReaderOrderDetailBookId(chapter.getChapterBookId());
                readerOrderDetailMapper.add(readerOrderDetail);
            }
            //????????????
            PlatformProfit profit = new PlatformProfit();
                profit.setOrderId(readerOrderId);
                profit.setProfitTime(new Date());
                Double platformProfit = Math.ceil(price*BookService.platformProfitPercentage);
                profit.setProfitPrice(platformProfit);
                profit.setProfitTypeId(1);
            //????????????
            WriterIncome writerIncome = new WriterIncome();
            writerIncome.setReaderId(readerId);
            writerIncome.setWriterId(writerMapper.getWriter(bookMapper.getBookById(chapterList.get(0).getChapterBookId()).getBookWriterId()).getWriterId());
            writerIncome.setWriterIncomeDate(new Date());
            writerIncome.setWriterIncomeTotal(price-platformProfit.intValue());
            writerIncome.setWriterIncomeTypeId(1);
            //????????????
            reader.setReaderBalance(reader.getReaderBalance()-price);
            readerMapper.updateBalance(-price,reader.getReaderId());
            //?????????
            writerIncomeMapper.add(writerIncome);
            platformProfitMapper.add(profit);
            return true;
        }
        return false;
    }

    @Override
    public boolean alter(ReaderBookRelation readerBookRelation) {
        return readerBookRelationMapper.alter(readerBookRelation);
    }

    @Override
    public boolean remove(ReaderBookRelation readerBookRelation) {
        return readerBookRelationMapper.remove(readerBookRelation);
    }

    @Override
    public List<ReaderBookRelation> getByReaderId(int readerId) {
        return readerBookRelationMapper.getByReaderId(readerId);
    }

    @Override
    public int countBook(int readerId) {
        return readerBookRelationMapper.countBook(readerId);
    }

    @Override
    public int countReader(int bookId) {
        return readerBookRelationMapper.countReader(bookId);
    }

    @Override
    public List<ReaderBookRelation> getBookShelfBooksByWriterName(String writername, int readerId) {
        return readerBookRelationMapper.getBookShelfBooksByWriterName(writername,readerId);
    }

    @Override
    public ReaderBookRelation getBookShelfBooksByBookName(String bookname, int readerId) {
        return readerBookRelationMapper.getBookShelfBooksByBookName(bookname,readerId);
    }

    public boolean isReaderCanRead(int chapterId ,int readerId){
        Chapter chapter = chapterMapper.getChapterById(chapterId);
        Boolean bookDownFlag = bookMapper.getBookById(chapter.getChapterBookId()).getBookDownShelf();
        Boolean chapterDownFlag = !chapter.getChapterDownShelf();
        Boolean bookActivityFlag = bookMapper.getBookById(chapter.getChapterBookId()).getBookActivityStatu();
        Boolean readerVipFlag = readerMapper.getReader(readerId).getReaderStatuId() == 2;
        Boolean buyFlag = isReaderGotChapter(chapterId, readerId);

        System.out.println("??????????????????:"+bookDownFlag);
        System.out.println("??????????????????:"+chapterDownFlag);
        System.out.println("??????????????????:"+bookActivityFlag );
        System.out.println("??????????????????:"+chapter.getChapterStatu());
        System.out.println("??????????????????:"+readerVipFlag);
        System.out.println("??????????????????:"+buyFlag);

        return bookDownFlag || //??????????????????
                chapterDownFlag ||  //??????????????????
                bookActivityFlag ||//??????????????????
                chapter.getChapterStatu() ||//??????????????????
                readerVipFlag ||//??????????????????
                buyFlag;//??????????????????
    }

    @Override
    public boolean isReaderReadingBook(int bookId,int readerId) {
        if(readerReadingRecordMapper.getByBookIdAndReaderId(readerId,bookId) != null)
            return true;//??????
        return false;//???????????????
    }

    public int getChapterNumIfReaderIsReadingBook(int bookId,int readerId){
        ReaderReadingRecord readerReadingRecord = readerReadingRecordMapper.getByBookIdAndReaderId(readerId,bookId);
        if(readerReadingRecord == null){
            return -1;
        }
        return readerReadingRecord.getChapterNum();
    }

    @Override
    public List<ReaderReadingRecord> getReaderReadingRecord(int readerId) {
        return readerReadingRecordMapper.getReaderReadingRecord(readerId);
    }

    @Override
    public int getReaderLevel(int readerId) {

        Reader reader=readerMapper.getReader(readerId);
        int score=reader.getReaderScore();
        int scorelevel=1;
        List<ScoreLevelInformation> scoreLevelInformationList=scoreLevelInformationMapper.getAllScoreInformation();
        for(int i=1;i<scoreLevelInformationList.size()-1;i++){
            if(score< scoreLevelInformationList.get(i).getScoreNum()){
                scorelevel=scoreLevelInformationList.get(i).getScoreLevel()-1;
                break;
            }
        }
        return scorelevel;
    }

    @Override
    public List<ReaderOrder> getOrdersByReaderId(int readerId) {
        return readerOrderMapper.getOrdersByReaderId(readerId);
    }

    @Override
    public ReaderOrderType getReaderOrderType(ReaderOrder readerOrder) {
        return readerOrderTypeMapper.get(readerOrder.getReaderOrderTypeId());
    }

    @Override
    public List<ReaderOrderDetail> getReaderOrderDetail(ReaderOrder readerOrder) {
        return readerOrderDetailMapper.getOrderDetailByOrderID(readerOrder.getReaderOrderId());
    }

    @Override
    public List<ReaderHobbyRelation> getReaderHobby(Reader reader) {
        return readerHobbyRelationMapper.getHobbyBy(reader.getReaderId());
    }

    @Override
    public Boolean updateReaderPortrait(int readerId, String picture) {
        return readerMapper.updateReaderPortrait(readerId,picture);
    }

    @Override
    public Statu get(int statuId) {
        return statuMapper.get(statuId);
    }

    @Override
    public Boolean updateReaderName(String name, int readerId) {
        return readerMapper.updateReaderName(name,readerId);
    }

    /**
     * ????????????????????????
     * @param readerId
     * @return
     */
    @Override
    public Integer getToReadCommentNum(int readerId) {
        List<Comment> commentsToMe = commentMapper.getCommentsToReaderId(readerId);
        Integer toReadCommentNum = 0;
        for (Comment comment : commentsToMe){
            if (!comment.isCommentIsRead()){
                toReadCommentNum++;
            }
        }
        return toReadCommentNum;
    }

    @Override
    public boolean alterReaderPassword(String password, int readerId) {
        return readerMapper.alterReaderPassword(password,readerId);
    }

    @Override
    public boolean updateBalance(int balance, int readerId) {
        return readerMapper.updateBalance(balance,readerId);
    }

    @Override
    public Integer getReaderBalance(int readerId) {
        return readerMapper.getReaderBalance(readerId);
    }

    @Override
    public Boolean addRecord(ReaderRecommendTicketsRecord readerRecommendTicketsRecord) {
        return readerRecommendTicketsRecordMapper.addRecord(readerRecommendTicketsRecord);
    }

    @Override
    public Boolean updateRecord(int tickets, int bookId, int readerId) {
        return readerRecommendTicketsRecordMapper.updateRecord(tickets,bookId,readerId);
    }

    @Override
    public Boolean removeRecord(int recordId) {
        return readerRecommendTicketsRecordMapper.removeRecord(recordId);
    }

    @Override
    public List<ReaderRecommendTicketsRecord> getRecordsByReaderId(int readerId) {
        return readerRecommendTicketsRecordMapper.getRecordsByReaderId(readerId);
    }

    @Override
    public int getUsedRecommendTicketsNumByReaderId(int readerId) {
        return readerRecommendTicketsRecordMapper.getUsedRecommendTicketsNumByReaderId(readerId);
    }

    @Override
    public int getUsedRecommendTicketsNumByBookId(int bookId) {
        return readerRecommendTicketsRecordMapper.getUsedRecommendTicketsNumByBookId(bookId);
    }

    @Override
    public int getRecommendTicketsByRecordId(int recordId) {
        return readerRecommendTicketsRecordMapper.getRecommendTicketsByRecordId(recordId);
    }

    @Override
    public List<ReaderOrderDetail> getOrderDetail(int readerId, int orderId) {
        return readerOrderDetailMapper.getOrderDetail(readerId,orderId);
    }

    @Override
    public boolean insertRecord(ReaderRechargeRecord readerRechargeRecord) {
        return readerRechargeRecordMapper.insertRecord(readerRechargeRecord);
    }

    @Override
    public boolean removeRecordByRecordId(int recordId) {
        return readerRechargeRecordMapper.removeRecordByRecordId(recordId);
    }

    @Override
    public boolean removeRecordByReaderId(int readerId) {
        return readerRechargeRecordMapper.removeRecordByRecordId(readerId);
    }

    @Override
    public List<ReaderRechargeRecord> getAllRechargeRecord() {
        return readerRechargeRecordMapper.getAllRechargeRecord();
    }

    @Override
    public boolean recommentBook(Integer num, Integer readerId, Integer bookId) {
        Reader reader =  readerMapper.getReader(readerId);
        if(num <= reader.getReaderRecommendTicket()){
            ReaderRecommendTicketsRecord readerRecommendTicketsRecord = new ReaderRecommendTicketsRecord();
                readerRecommendTicketsRecord.setBookId(bookId);
                readerRecommendTicketsRecord.setReaderId(readerId);
                readerRecommendTicketsRecord.setRecordPushTime(new Date());
                readerRecommendTicketsRecord.setTicketNum(num);
            readerRecommendTicketsRecordMapper.addRecord(readerRecommendTicketsRecord);
            Book book = bookMapper.getBookById(bookId);
            book.setBookRecommendTicket(book.getBookRecommendTicket()+num);
            bookMapper.alter(book);
            reader.setReaderRecommendTicket(reader.getReaderRecommendTicket()-num);
            readerMapper.alter(reader);
            return true;
        }
        return false;
    }

    @Override
    public List<ReaderOrderDetail> getOrderDetailByOrderID(int orderId) {
        return readerOrderDetailMapper.getOrderDetailByOrderID(orderId);
    }

    @Override
    public List<Integer> getChapterNumByOrderId(int orderId) {
        return readerOrderDetailMapper.getChapterNumByOrderId(orderId);
    }


    @Override
    public boolean removeHobby(int readerId, int labelId) {
        return readerHobbyRelationMapper.remove(readerId,labelId);
    }

    @Override
    public Boolean removeReaderBookRelationByBookIdAndReaderId(int bookid, int readerId) {
        return readerBookRelationMapper.removeReaderBookRelationByBookIdAndReaderId(bookid,readerId);
    }


}
