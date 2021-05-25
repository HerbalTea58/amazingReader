package com.amazingReader.mapper;

import com.amazingReader.entity.BookLabel;
import com.amazingReader.entity.ScoreLevelInformation;

import java.util.List;

public interface ScoreLevelInformationMapper {
	public List<ScoreLevelInformation> getAllScoreInformation();
	public ScoreLevelInformation getScoreInformationByScoreNum(int scoreNum);
	public ScoreLevelInformation getScoreInformationByScoreLevel(int scoreLevel);



}