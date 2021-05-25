package com.amazingReader.mapper;

import java.util.List;

import com.amazingReader.entity.Reader;
import com.amazingReader.entity.ReportComment;

public interface ReportCommentMapper {
	boolean add(ReportComment reportComment);
	boolean alter(ReportComment reportComment);
	List<ReportComment> getBymanagerId(int managerId);

	List<ReportComment> getToDealReportCommentByManagerId(int managerId);

	ReportComment getById(int reportCommentId);

	List<Reader> getReaderReportedTimes();

    Integer getReaderReportedTimesOfReader(int readerId);
}