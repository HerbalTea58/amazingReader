package com.amazingReader.service.Impl;

import java.util.List;

import com.amazingReader.entity.Chapter;
import com.amazingReader.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.amazingReader.entity.Manager;
import com.amazingReader.entity.ReportChapter;
import com.amazingReader.entity.ReportComment;
import com.amazingReader.service.Interface.ManagerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerMapper managerMapper;
	@Autowired
	private ReportChapterMapper reportChapterMapper;
	@Autowired
	private ReportCommentMapper reportCommentMapper;
	@Autowired
	private ChapterMapper chapterMapper;
	@Autowired
	private CommentMapper commentMapper;

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public int login(Manager manager) {
		if(manager != null){
			try {
				Manager queryManager = managerMapper.get(Integer.parseInt(manager.getManagerNeckname()));
				//用户id登录
				if(queryManager!=null){
					if (manager.getManagerPassword().equals(queryManager.getManagerPassword())){
						return 0;//成功
					}else {
						return 1;//密码错误
					}
				}
			}catch (NumberFormatException e){
				Manager queryManager1 = managerMapper.getByName(manager.getManagerNeckname());
				//昵称登录
				if(queryManager1!=null){
					if (manager.getManagerPassword().equals(queryManager1.getManagerPassword())){
						return 4;//成功
					}else{
						return 1;//密码错误
					}
				}else {
					return 2;//登录账号不存在
				}
			}

		}
		return -1;
	}
	@Override
	public boolean register(Manager manager) {
		return managerMapper.add(manager);
	}

	@Override
	public List<ReportChapter> getReportChapter(int managerID) {
		return reportChapterMapper.getBymanagerId(managerID);
	}

	@Override
	public List<ReportComment> getReportComment(int managerID) {
		return reportCommentMapper.getBymanagerId(managerID);
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public void acepteReportChapter(int reportId) {
		ReportChapter reportChapter = new ReportChapter();
		reportChapter.setReportId(reportId);
		reportChapter.setReportStatuId(2);
		reportChapterMapper.alter(reportChapter);
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public void acepteReportComment(int reportId) {
		ReportComment reportComment = new ReportComment();
		reportComment.setReportId(reportId);
		reportComment.setReportStatuId(2);
		reportCommentMapper.alter(reportComment);
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public void refuseReportChapter(int reportId) {
		ReportChapter reportChapter = new ReportChapter();
		reportChapter.setReportId(reportId);
		reportChapter.setReportStatuId(4);
		reportChapterMapper.alter(reportChapter);
		
	}

	@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
	@Override
	public void refuseReportComment(int reportId) {
		ReportComment reportComment = new ReportComment();
		reportComment.setReportId(reportId);
		reportComment.setReportStatuId(4);
		reportCommentMapper.alter(reportComment);
	}



	@Override
	public void dealReportChapter(int reportId,String reportSolution) {
		ReportChapter reportChapter = reportChapterMapper.getById(reportId);
		reportChapter.setReportStatuId(4);
		reportChapter.setReportSolution(reportSolution);
		reportChapterMapper.alter(reportChapter);
		chapterMapper.alterDowmShelf(reportChapter.getChapterId(), false);
	}

	@Override
	public void dealReportComment(int reportId,String reportSolution) {
		ReportComment reportComment = reportCommentMapper.getById(reportId);
		reportComment.setReportStatuId(4);
		reportComment.setReportSolution(reportSolution);
		reportCommentMapper.alter(reportComment);
		commentMapper.alterStatu(reportComment.getCommentId(), false);
	}

	@Override
	public Manager getManagerInfo(int managerId) {
		return managerMapper.get(managerId);
	}

	@Override
	public int getMaxIndex() {
		return managerMapper.getMaxIndex();
	}

	@Override
	public Manager getManagerInfo(String name) {
		return managerMapper.getByName(name);
	}




}
