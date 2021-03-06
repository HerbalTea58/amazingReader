package com.amazingReader.entity.utilEntity;

import com.amazingReader.entity.Book;
import org.omg.CORBA.INTERNAL;

import java.util.List;

public class PageInfos<T> {
    private List<T> list;
    private Integer curPage;
    private Integer nextPage;
    private Integer prePage;
    private Integer total;
    private Integer pageNum;

    public Integer getFirstPage(){
        return 1;
    }

    public Integer getLastPage(){
        return pageNum==0?1:pageNum;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public boolean getIsFirstPage() {
        return curPage==1;
    }

    public boolean getIsLastPage() {
        return curPage==pageNum;
    }

    private Integer calculatePageNum(Integer size){
        if(total%size==0)
            return total/size;
        else {
            return (total/size)+1;
        }
    }
    public PageInfos(Integer total, Integer curPage, List<T> list, Integer perPageNum){
        this.total = total;
        this.curPage = curPage;
        this.prePage = curPage!=1?curPage-1:curPage;
        this.list = list;
        this.pageNum = calculatePageNum(perPageNum);
        this.nextPage = getIsLastPage()?1:curPage+1;
    }

    public Integer getCurPage() {
        return curPage;
    }

    public void setCurPage(Integer curPage) {
        this.curPage = curPage;
    }

    public Integer getNextPage() {
        return nextPage;
    }

    public void setNextPage(Integer nextPage) {
        this.nextPage = nextPage;
    }

    public Integer getPrePage() {
        return prePage;
    }

    public void setPrePage(Integer prePage) {
        this.prePage = prePage;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    @Override
    public String toString() {
        return "PageInfos{" +
                ", curPage=" + curPage +
                ", nextPage=" + nextPage +
                ", prePage=" + prePage +
                ", total=" + total +
                ", pageNum=" + pageNum +
                '}';
    }


}
