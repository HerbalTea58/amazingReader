package com.amazingReader.service.Interface;

import com.amazingReader.entity.ScoreLevelInformation;

import java.util.List;

public interface ScoreService {
    public List<ScoreLevelInformation> getAllScoreInformation();
    public ScoreLevelInformation getScoreInformationByScoreNum(int scoreNum);
    public ScoreLevelInformation getScoreInformationByScoreLevel(int scoreLevel);
}
