package kr.or.ddit.common.qna.service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.qna.vo.QnaReplyVO;

/**
 * 문의 댓글(관리자만 가능)
 * @author 고혜인
 * @since 2022. 8. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 16.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface QnaReplyService {

	/**
	 * 답변 작성
	 * @param reply
	 */
	public ServiceResult createReply(QnaReplyVO reply);
	
	/**
	 * 답변 수정
	 * @param reply
	 */
	public ServiceResult modifyReply(QnaReplyVO reply);
	
	/**
	 * 답변 삭제
	 * @param reply
	 */
	public ServiceResult removeReply(int repParent);
	
	/**
	 * 답변 조회
	 * @param repParent
	 * @return
	 */
	public QnaReplyVO reply(int repParent);
}
