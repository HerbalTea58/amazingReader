package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.ReportChapter;

public interface ReportChapterMapper {
	boolean add(ReportChapter reportChapter);
	boolean alter(ReportChapter reportChapter);
	List<ReportChapter> getBymanagerId(int managerId);

	List<ReportChapter> getToDealReportByManagerId(int managerId);

	ReportChapter getById(int reportChapterId);

	/**
	 * 批量为某个管理员处理信息修改为已阅状态
	 * @param managerId
	 */
	void setReadFor(int managerId);

}