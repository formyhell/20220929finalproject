package kr.or.ddit.common.qna.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.qna.vo.QnaReplyVO;

@Mapper
public interface QnaReplyDAO {

	/**
	 * QNA 답변 등록
	 * @param reply
	 * @return
	 */
	public int insertQReply(QnaReplyVO reply);
	
	/**
	 * QNA 답변 수정
	 * @param reply
	 * @return
	 */
	public int updateQReply(QnaReplyVO reply);
	
	/**
	 * QNA 답변 삭제
	 * @param repNo
	 * @return
	 */
	public int deleteQReply(int repNo);
	
	/**
	 * QNA 답변 조회(QNA는 관리자가 답변을 1번만 달 수 있음)
	 * @param repParent
	 * @return
	 */
	public QnaReplyVO selectQReply(int repParent);
}
