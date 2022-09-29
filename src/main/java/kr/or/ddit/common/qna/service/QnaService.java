package kr.or.ddit.common.qna.service;

import java.util.List;

import kr.or.ddit.common.qna.vo.QnaVO;
import kr.or.ddit.common.vo.PagingVO;
/**
 * 문의 게시판 service
 * @author 고혜인
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface QnaService {
	
	/**
	 * 문의글 작성
	 * @param qna
	 */
	public void create(QnaVO qna);

	/**
	 * 문의글 수정
	 * @param qna
	 */
	public void modify(QnaVO qna);
	
	/**
	 * 문의글 삭제
	 * @param qna
	 */
	public void remove(int qnaNO);
	
	/**
	 * 문의글 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<QnaVO> findAll(PagingVO<QnaVO> pagingVO);
	
	/**
	 * 문의글 상세 조회
	 * @param qnaNo
	 * @return
	 */
	public QnaVO findByPK(int qnaNo);
}
