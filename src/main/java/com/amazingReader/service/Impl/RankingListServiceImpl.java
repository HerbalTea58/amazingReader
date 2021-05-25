package com.amazingReader.service.Impl;

import com.amazingReader.entity.Book;
import com.amazingReader.mapper.BookMapper;
import com.amazingReader.service.Interface.BookService;
import com.amazingReader.service.Interface.RankingListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class RankingListServiceImpl implements RankingListService {
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private  BookService bookService;


    public List<Book> queryBookForIncome() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForIncome());
    }

    public List<Book> queryBookForRecommend() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForRecommend());
    }

    public List<Book> queryBookForOrder() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForOrder());
    }

    public List<Book> queryBookForCollect() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForCollect());
    }

    public List<Book> queryBookForReward() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForReward());
    }

    public List<Book> queryBookForRecentCreate() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForRecentCreate());
    }

    public List<Book> queryBookForFree() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForFree());
    }

    public List<Book> queryBookForFreeOfTimeLimit() {
        return null;
    }

    public List<Book> queryBookForFinished() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForFinished());
    }

    @Override
    public List<Book> queryBookForHotOfWoman() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForHotOfWoman());
    }

    @Override
    public List<Book> queryBookForRecommendOfWoman() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForRecommendOfWoman());
    }

    @Override
    public List<Book> queryBookForRecentCreateOfWoman() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForRecentCreateOfWoman());
    }

    @Override
    public List<Book> queryBookForFreeOfWoman() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForFreeOfWoman());
    }

    @Override
    public List<Book> queryBookForFinishedOfWoman() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForFinishedOfWoman());
    }

    @Override
    public List<Book> queryBookForCollectOfWoman() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForCollectOfWoman());
    }

    @Override
    public List<Book> queryBookForIncomeOfWoman() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForIncomeOfWoman());
    }

    @Override
    public List<Book> queryBookForHotOfMan() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForHotOfMan());
    }

    @Override
    public List<Book> queryBookForRecommendOfMan() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForRecommendOfMan());
    }

    @Override
    public List<Book> queryBookForRecentCreateOfMan() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForRecentCreateOfMan());
    }

    @Override
    public List<Book> queryBookForFreeOfMan() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForFreeOfMan());
    }

    @Override
    public List<Book> queryBookForFinishedOfMan() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForFinishedOfMan());
    }

    @Override
    public List<Book> queryBookForCollectOfMan() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForCollectOfMan());
    }

    @Override
    public List<Book> queryBookForIncomeOfMan() {
        return bookService.getBasicInfoOfBooks(bookMapper.queryBookForIncomeOfMan());
    }
}
