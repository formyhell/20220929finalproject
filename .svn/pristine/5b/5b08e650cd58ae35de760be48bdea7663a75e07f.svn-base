package kr.or.ddit.common.qna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.qna.vo.QnaVO;
import kr.or.ddit.common.vo.PagingVO;

@Mapper
public interface QnaDAO {
	
	/**
	 * 문의글 작성
	 * @param qna
	 * @return 
	 */
	public int insertQna(QnaVO qna);

	/**
	 * 검색 조건에 일치하는 문의글 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectQnaCount(PagingVO<QnaVO> pagingVO);
	
	/**
	 * 검색 조건에 일치하는 문의글의 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<QnaVO> selectQnaList(PagingVO<QnaVO> pagingVO);
	
	/**
	 * 문의글 상세 조회
	 * @param qnaNo
	 * @return
	 */
	public QnaVO selectQna(int qnaNo);
	
	/**
	 * 문의글 수정
	 * @param qna
	 * @return
	 */
	public int updateQna(QnaVO qna);
	
	/**
	 * 문의글 삭제
	 * @param qnaNo
	 * @return
	 */
	public int deleteQna(int qnaNO);
	
	/**
	 * 답글 달린 QNA
	 * @param qnaNo
	 * @return
	 */
	public int updateRep(int qnaNo);
	
	/**
	 * 답글 지워진 QNA
	 * @param qnaNo
	 * @return
	 */
	public int deleteRep(int qnaNo);
	
	
}
