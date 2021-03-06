package com.amazingReader.mapper;

import java.util.Date;
import java.util.List;

import com.amazingReader.entity.Book;
import com.amazingReader.entity.utilEntity.WriterBook;

public interface BookMapper {
    public int getMaxIndex();
    public boolean add(Book book);
    public boolean alter(Book book);
    /**
     * 仅将书籍下架
     * @param book
     * @return
     */
     boolean removeBook(Book book);
     boolean removeById(int bookId);
     Book getBookById(int bookId);
     Book getBookByName(String bookName);
     List<Book> getBooksByName(String name);
     Integer getBookByBookId(int bookId);
     List<Book> getBookByWriterId(int writeId);
     List<Book> getBooksByLabelId(int LabelId);
     List<Integer> getBooksByStyleId(int styleId);
     void addRecommendTicket(int tickets, int bookId);
     List<Book> getVisitBookBasic();

    void collect(int bookId);

    List<Book> getActivityBooks();

    Integer getClickNum(int bookId);

    int getWordsNumOfBook(int bookId);

    List<Integer> getBookIdByWriterId(int writerId);
    Book getBook(int writerId,int bookId);
    //男女频书籍
    List<Integer> queryBooksOfMan();
    List<Integer> queryBooksOfWoman();

    //收入榜
    public List<Integer> queryBookForIncome();

    //推荐榜
    public List<Integer> queryBookForRecommend();

    //热销榜
    public List<Integer> queryBookForOrder();

    //收藏榜
    public List<Integer> queryBookForCollect();

    //打赏榜
    public List<Integer> queryBookForReward();

    //新书推荐
    public List<Integer> queryBookForRecentCreate();

    //全本免费专区
    public List<Integer> queryBookForFree();

    //限时免费
    public List<Integer> queryBookForFreeOfTimeLimit();

    //完结专区
    public List<Integer> queryBookForFinished();


    //男频热度排行榜
    public List<Integer> queryBookForHotOfMan();
    //男频推荐排行榜
    public List<Integer> queryBookForRecommendOfMan();
    //男频新书
    public List<Integer> queryBookForRecentCreateOfMan();
    //男频免费
    public List<Integer> queryBookForFreeOfMan();
    //男频完结
    public List<Integer> queryBookForFinishedOfMan();
    //男频收藏榜
    public List<Integer> queryBookForCollectOfMan();
    //男频收入榜
    public List<Integer> queryBookForIncomeOfMan();

    //女频热度排行榜
    public List<Integer> queryBookForHotOfWoman();
    //女频推荐排行榜
    public List<Integer> queryBookForRecommendOfWoman();
    //女频新书
    public List<Integer> queryBookForRecentCreateOfWoman();
    //女频免费
    public List<Integer> queryBookForFreeOfWoman();
    //女频完结
    public List<Integer> queryBookForFinishedOfWoman();
    //女频收藏榜
    public List<Integer> queryBookForCollectOfWoman();
    //女频收入榜
    public List<Integer> queryBookForIncomeOfWoman();

    /**
     * 上面所有的方法的SQL我都把下架书籍给过滤掉了
     */


    /**
     *
     * @param keyWord
     * @return
     */
    //能够拿到下架书籍
    List<Book> getBooksByNameForManager(String keyWord);

    List<Book> getBookByWriterNameLike(String typing);

    List<Book> getAllDownShelfBooks();

    Integer getClickTimesByDate(int bookId, String time);

    Integer getAvgClickTimes(int bookId);

    Integer getMaxClickTimes(int bookId);

    boolean updatePic(int bookId, String imgfile);

    int getBookIdByName(String bookName);

    List<WriterBook> getBookByWriterId2(int writerId);
}