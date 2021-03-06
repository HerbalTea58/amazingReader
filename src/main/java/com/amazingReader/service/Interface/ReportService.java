package com.amazingReader.service.Interface;

public interface ReportService {
    /**
     * 下架被举报评论
     * @param reportId
     */
    void removeReportComment(int reportId,int commentId);

    /**
     * 驳回举报评论
     * @param reportId
     */
    void refuseReportComment(int reportId);
    /**
     * 下架被举报章节
     * @param reportId
     */
    boolean downShelfReportChapter(int reportId,int chapterId);

    /**
     * 驳回举报章节
     * @param reportId
     */
    void refuseReportChapter(int reportId);

    /**
     * 下架被举报章节
     * @param bookId
     */
    boolean downShelfReportBook(Integer bookId,Integer reportId);
}
