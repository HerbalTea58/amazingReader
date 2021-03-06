package com.amazingReader.service.Impl;

import com.amazingReader.entity.*;
import com.amazingReader.mapper.*;
import com.amazingReader.service.Interface.ChapterService;
import com.iflytek.cloud.speech.*;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

@Service
public class ChapterServiceImpl implements ChapterService {
    /**
     *  千字价格6分钱
     */
    private final int thousandWordPrice = 6;
    @Autowired
    private ChapterMapper chapterMapper;
    @Autowired
    private ReportChapterMapper reportChapterMapper;
    @Autowired
    private WriterMapper writerMapper;
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private DealStatusMapper dealStatusMapper;
    @Autowired
    private DraftMapper draftMapper;
    @Autowired
    private ChapterAdditionRemarksMapper chapterAdditionMapper;
    @Autowired
    private ChapterCheckMapper chapterCheckMapper;

    @Override
    public void downShelfChapter(int chapterId) {
        chapterMapper.removeByChapterId(chapterId);
    }

    @Override
    public int calculatePriceOfChapter(int chapterId) {
        return (int)((chapterMapper.getChapterWordsNum(chapterId)/1000.0)*thousandWordPrice);
    }

    @Override
    public int calculatePriceOfChapters(List<Integer> chapters) {
        int tempPrice = 0;
        for(int chapterId : chapters){
            tempPrice += calculatePriceOfChapter(chapterId);
        }
        return tempPrice;
    }
    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @Override
    public List<ReportChapter> getAllReportedChapter(int managerId) {
        List<ReportChapter> reportChapters = reportChapterMapper.getBymanagerId(managerId);
        for (ReportChapter reportChapter : reportChapters){
            reportChapter.setReportedChapter(
                    chapterMapper.getChapterById(
                            reportChapter.getChapterId()
                    )
            );
            reportChapter.setReportedWriter(
                    writerMapper.getWriter(
                            bookMapper.getBookById(
                                    chapterMapper.getChapterById(
                                            reportChapter.getChapterId()
                                    )
                                            .getChapterBookId())
                                    .getBookWriterId()
                    )
            );
            reportChapter.setReportStatuName(
                    dealStatusMapper.getDealStatu(reportChapter.getReportStatuId()).getQuestionDealStatusName()
            );
        }
        reportChapterMapper.setReadFor(managerId);
        return reportChapters;
    }

    @Override
    public List<ReportChapter> getToDealReportedChapter(int managerId) {
        List<ReportChapter> reportChapters = reportChapterMapper.getToDealReportByManagerId(managerId);
        for (ReportChapter reportChapter : reportChapters){
            reportChapter.setReportedChapter(
                    chapterMapper.getChapterById(
                            reportChapter.getChapterId()
                    )
            );
            reportChapter.setReportedWriter(
                    writerMapper.getWriter(
                            bookMapper.getBookById(
                                    chapterMapper.getChapterById(
                                            reportChapter.getChapterId()
                                    ).getChapterBookId()).getBookWriterId()
                    )
            );
            reportChapter.setReportStatuName(
                    dealStatusMapper.getDealStatu(reportChapter.getReportStatuId()).getQuestionDealStatusName()
            );
        }
        reportChapterMapper.setReadFor(managerId);
        return reportChapters;
    }

    @Override
    public Chapter getChapter(int chapterId) {
        return chapterMapper.getChapterById(chapterId);
    }

    @Override
    public Chapter getChapterByChapterNumAndBookId(int chapterNum, int bookId) {
        Chapter chapter=new Chapter();
        if(chapterNum!=0) {
            int chapterId=chapterMapper.getChapterIdBy(bookId, chapterNum);
            if (chapterId!=0) {
                return chapterMapper.getChapterById(
                        chapterId);
            };
        }
            return chapter;
    }

    @Override
    public Integer getNextChapterId(int chapterId) {
        Chapter chapter = chapterMapper.getChapterById(chapterId);
        return chapterMapper.getChapterIdBy(chapter.getChapterBookId(),chapter.getChapterNum()+1);
    }

    @Override
    public Integer getPreChapterId(int chapterId) {
        Chapter chapter = chapterMapper.getChapterById(chapterId);
        return chapterMapper.getChapterIdBy(chapter.getChapterBookId(),chapter.getChapterNum()-1);
    }
    public  int getMaxChapterNumOfBook(int bookId){
        return chapterMapper.getMaxChapterNumOfBook(bookId);
    }

    //合成监听器
    private SynthesizerListener mSynListener = new SynthesizerListener(){
        //会话结束回调接口，没有错误时，error为null
        public void onCompleted(SpeechError error) {
            System.out.println(error.toString());
        }

        @Override
        public void onEvent(int i, int i1, int i2, int i3, Object o, Object o1) {

        }

        //缓冲进度回调
        //percent为缓冲进度0~100，beginPos为缓冲音频在文本中开始位置，endPos表示缓冲音频在文本中结束位置，info为附加信息。
        public void onBufferProgress(int percent, int beginPos, int endPos, String info) {}
        //开始播放
        public void onSpeakBegin() {}
        //暂停播放
        public void onSpeakPaused() {}
        //播放进度回调
        //percent为播放进度0~100,beginPos为播放音频在文本中开始位置，endPos表示播放音频在文本中结束位置.
        public void onSpeakProgress(int percent, int beginPos, int endPos) {
            System.out.println(percent);
        }
        //恢复播放回调接口
        public void onSpeakResumed() {}
    };
    @Override
    public void read() {
        SpeechUtility.createUtility( SpeechConstant.APPID +"=5b20f901");
        //1.创建SpeechSynthesizer对象
        SpeechSynthesizer mTts= SpeechSynthesizer.createSynthesizer( );
        //2.合成参数设置，详见《MSC Reference Manual》SpeechSynthesizer 类
        mTts.setParameter(SpeechConstant.VOICE_NAME, "vixl");//设置发音人
        mTts.setParameter(SpeechConstant.SPEED, "60");//设置语速
        mTts.setParameter(SpeechConstant.VOLUME, "100");//设置音量，范围0~100
        //设置合成音频保存位置（可自定义保存位置），保存在“./tts_test.pcm”
        //如果不需要保存合成音频，注释该行代码
//        mTts.setParameter(SpeechConstant.TTS_AUDIO_PATH, "./tts_test.pcm");

        //3.开始合成
        mTts.startSpeaking("语音合成测试程序", mSynListener);
    }

    @Override
    public List<Chapter> updateOrNot(Date dateread, Date datemax, int bookId) {
        return chapterMapper.updateOrNot(dateread,datemax,bookId);
    }

    @Override
    public boolean add(Integer chapterNum, Integer bookId) {
        /**
         * 先添加到章节表，再删除审核表，最后删除草稿箱
         */

        ChapterCheck chapterCheck = chapterCheckMapper.getChapterCheck(chapterNum,bookId);
        Chapter chapter = new Chapter();
            chapter.setChapterContent(chapterCheck.getCheckChapterContent());
            chapter.setChapterBookId(chapterCheck.getCheckChapterBookId());
            chapter.setChapterClickNum(0);
            chapter.setChapterPrice(0.0);
            chapter.setChapterStatu(chapterCheck.getCheckChapterStatu());
            chapter.setChapterDownShelf(true);
            chapter.setChapterNum(chapterCheck.getCheckChapterNum());
            chapter.setChapterWordNum(chapterCheck.getCheckChapterWordNum());
            chapter.setChapterName(chapterCheck.getCheckChapterName());
            chapter.setChapterRefreshTime(chapterCheck.getCheckRefreshTime());
        Boolean flag = chapterMapper.add(chapter);
        chapterCheckMapper.removeChapterCheck(chapterNum,bookId);
        draftMapper.deleteDraftReal(chapterNum,bookId);
        return flag;
    }

    @Override
    public void refuseChaper(Integer chapterNum, Integer bookId) {
        ChapterCheck chapterCheck = chapterCheckMapper.getChapterCheck(chapterNum,bookId);
        chapterCheckMapper.removeChapterCheck(chapterNum,bookId);
        if(!chapterCheck.getCheckChapterFrom()){
            Draft draft = draftMapper.getDraftByBookIdAndDraftNum(bookId,chapterNum);
            draft.setDraftCheckStatu(2);
            draftMapper.updateDraft(draft);
        }
    }

    @Override
    public boolean alterChapter(Integer chapterNum, Integer bookId) {
        Chapter chapter = chapterMapper.getChapterById(chapterMapper.getChapterIdBy(bookId,chapterNum));
        ChapterCheck chapterCheck = chapterCheckMapper.getChapterCheck(chapterNum,bookId);
            chapter.setChapterStatu(chapterCheck.getCheckChapterStatu());
            chapter.setChapterPrice(chapterCheck.getCheckChapterPrice()+0.0);
            chapter.setChapterRefreshTime(chapterCheck.getCheckRefreshTime());
            chapter.setChapterName(chapterCheck.getCheckChapterName());
            chapter.setChapterContent(chapterCheck.getCheckChapterContent());
            chapter.setChapterWordNum(chapterCheck.getCheckChapterWordNum());
        Boolean flag = chapterMapper.alter(chapter);
        chapterCheckMapper.removeChapterCheck(chapterNum,bookId);
        draftMapper.deleteDraftReal(chapterNum,bookId);
        return flag;
    }


    @Override
    public int getMaxDraftNumOfBook(int bookId) {
        Integer num = draftMapper.getMaxDraftNumOfBook(bookId);
        if (num == null)
            num = 0;
        return num;
    }

    @Override
    public int calculatePriceByChapterNum(int wordnum) {
        return (wordnum/1000)*thousandWordPrice;
    }

	@Override
    public List<Draft> getDraftByBookId(int bookId){
		 return draftMapper.getDraftByBookId(bookId);
	 }

    @Override
    public List<Draft> getDraftByBookIdForDelete(int bookId) {
        return draftMapper.getDraftByBookIdForDelete(bookId);
    }

    @Override
    public boolean addDraft(Draft draft) {
        return draftMapper.addDraft(draft);
    }

    @Override
    public Draft getDraftByBookIdAndDraftNum(int bookId, int draftNum) {
        return draftMapper.getDraftByBookIdAndDraftNum(bookId, draftNum);
    }

    @Override
    public boolean updateDraft(Draft draft) {
        return draftMapper.updateDraft(draft);
    }

    @Override
    public boolean updateDraftNum(int newNum, int oldNum, int bookId) {
        return draftMapper.updateDraftNum(newNum, oldNum, bookId);
    }

    @Override
    public boolean deleteDraft(int num, int bookId) {
        return draftMapper.deleteDraft(num, bookId);
    }

    @Override
    public boolean reDraft(int num, int bookId) {
        return draftMapper.reDraft(num, bookId);
    }

    @Override
    public List<Chapter> getChapters(int bookId) {
        return draftMapper.getChapters(bookId);
    }

    @Override
    public int getChapterIdBy(int bookId, int chapterNum) {
        return chapterMapper.getChapterIdBy(bookId, chapterNum);
    }

    @Override
    public boolean deleteDraftReal(int num, int bookId) {
        return draftMapper.deleteDraftReal(num, bookId);
    }

    @Override
    public boolean alterChapter(Chapter chapter) {
        return chapterMapper.alterChapter(chapter);
    }

    @Override
    public boolean addChapterAddition(ChapterAdditionRemarks chapterAdditionRemarks) {
        return chapterAdditionMapper.add(chapterAdditionRemarks);
    }

    @Override
    public boolean alterChpaterAddition(ChapterAdditionRemarks chapterAdditionRemarks) {
        return chapterAdditionMapper.alter(chapterAdditionRemarks);
    }

    @Override
    public ChapterAdditionRemarks getChapterAdditionBy(int bookChapterId) {
        return chapterAdditionMapper.getChapterAdditionBy(bookChapterId);
    }

    @Override
    public boolean addChapterCheck(ChapterCheck chapterCheck) {
        return chapterCheckMapper.add(chapterCheck);
    }

    @Override
    public boolean upDraft(int num, int bookid) {
        return draftMapper.upDraft(num, bookid);
    }

    @Override
    public ChapterCheck getToCheckChapter(Integer bookId, Integer chapterNum) {
        return chapterCheckMapper.getChapterCheck(chapterNum,bookId);
    }


}
