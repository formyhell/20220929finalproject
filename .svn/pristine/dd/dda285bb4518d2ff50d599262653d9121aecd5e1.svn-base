package kr.or.ddit.common.community.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.community.vo.CommunityReplyVO;
import kr.or.ddit.common.enumpkg.ServiceResult;

/**
 * 커뮤니티 댓글
 * @author 고혜인
 * @since 2022. 8. 29.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 29.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface CommunityReplyService {

	/**
	 * 댓글 작성
	 * @param reply
	 * @return
	 */
	public ServiceResult createCmntReply(CommunityReplyVO reply);
	
	/**
	 * 댓글 수정
	 * @param reply
	 * @return
	 */
	public ServiceResult modifyCmntReply(CommunityReplyVO reply);
	
	/**
	 * 댓글 삭제
	 * @param repNo
	 * @return
	 */
	public ServiceResult removeCmntReply(int repNo);
	
	/**
	 * 댓글 리스트 조회
	 * @param cmntMap
	 * @return
	 */
	public List<CommunityReplyVO> retrieveCmntReplyList(Map<String, Object> cmntMap);
	
	/**
	 * 댓글 조회
	 * @param repNo
	 * @return
	 */
	public CommunityReplyVO retrieveCmntReply(int repNo);
	
}
