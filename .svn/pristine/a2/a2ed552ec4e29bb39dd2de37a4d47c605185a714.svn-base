package kr.or.ddit.common.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.qna.dao.QnaDAO;
import kr.or.ddit.common.qna.vo.QnaVO;
import kr.or.ddit.common.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 
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
@Slf4j
@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService{

	private final QnaDAO qnaDao;

	@Override
	public void create(QnaVO qna) {
		qnaDao.insertQna(qna);	
	}

	@Override
	public void modify(QnaVO qna) {
		qnaDao.selectQna(qna.getQnaNo()); //게시글 존재여부 확인
		
		qnaDao.updateQna(qna);
		
	}

	@Override
	public void remove(int qnaNO) {
		qnaDao.selectQna(qnaNO); //게시글 존재여부 확인

		qnaDao.deleteQna(qnaNO);
		
	}

	@Override
	public List<QnaVO> findAll(PagingVO<QnaVO> pagingVO) {
		pagingVO.setTotalRecord(qnaDao.selectQnaCount(pagingVO));
		List<QnaVO> qnaList = qnaDao.selectQnaList(pagingVO);
		pagingVO.setDataList(qnaList);
		
		return qnaList;
	}

	@Override
	public QnaVO findByPK(int qnaNo) {
		QnaVO qna = qnaDao.selectQna(qnaNo);
		
		if(qna == null) {
			throw new RuntimeException("없는 문의글입니다");
		}
		return qna;
	}
	
}