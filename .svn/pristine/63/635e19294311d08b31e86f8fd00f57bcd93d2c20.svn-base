package com.amazingReader.service.Impl;

import com.amazingReader.entity.ScoreLevelInformation;
import com.amazingReader.mapper.ScoreLevelInformationMapper;
import com.amazingReader.service.Interface.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreServiceImpl implements ScoreService{
    @Autowired
    private ScoreLevelInformationMapper scoreLevelInformationMapper;


    @Override
    public List<ScoreLevelInformation> getAllScoreInformation() {
        return scoreLevelInformationMapper.getAllScoreInformation();
    }

    @Override
    public ScoreLevelInformation getScoreInformationByScoreNum(int scoreNum) {
        return scoreLevelInformationMapper.getScoreInformationByScoreNum(scoreNum);
    }

    @Override
    public ScoreLevelInformation getScoreInformationByScoreLevel(int scoreLevel) {
        return scoreLevelInformationMapper.getScoreInformationByScoreLevel(scoreLevel);
    }


}
