package kr.or.ddit.common.community.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.community.vo.CommunityRecVO;
import kr.or.ddit.common.community.vo.CommunityTrepVO;
import kr.or.ddit.common.community.vo.CommunityVO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.PagingVO;

/**
 * 
 * @author 고혜인
 * @since 2022. 8. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 27.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface CommunityService {
	
	/**
	 * 커뮤니티 글 등록
	 * @param cmnt
	 * @return
	 */
	public ServiceResult createCmnt(CommunityVO cmnt);
	
	/**
	 * 커뮤니티 글 수정
	 * @param cmnt
	 * @return
	 */
	public ServiceResult modifyCmnt(CommunityVO cmnt);
	
	/**
	 * 커뮤니티 글 삭제
	 * @param cmnt
	 * @return
	 */
	public ServiceResult removeCmnt(CommunityVO cmnt);
	
	/**
	 * 커뮤니티 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<CommunityVO> findAllCmnt(PagingVO<CommunityVO> pagingVO);
	
	/**
	 * 커뮤니티 글 상세조회
	 * @param cmntNo
	 * @return
	 */
	public CommunityVO retrieveCmnt(int cmntNo);
	
	/**
	 * 관리자 커뮤니티 글 상세조회
	 * @param cmntNo
	 * @return
	 */
	public CommunityVO adminRetrieveCmnt(int cmntNo);
	
	/**
	 * 커뮤니티 글 신고
	 * @param cmntNo
	 * @return
	 */
	public ServiceResult reportCmnt(CommunityTrepVO trep);
	
	/**
	 * 커뮤니티 신고내역 조회
	 * @param trep
	 * @return
	 */
	public List<CommunityTrepVO> selectReportCmnt(int cmntNo);
	
	/**
	 * 커뮤니티 신고 내역 조회
	 * @param trepMap
	 * @return
	 */
	public List<CommunityTrepVO> selectRepMemList(Map<String, Object> trepMap);
	
	/**
	 * 관리자 커뮤니티 글 삭제
	 * @param cmntNo
	 * @return
	 */
	public ServiceResult adminDeleteCmnt(CommunityVO cmnt);

	/**
	 * 관리자 커뮤니티 글 수정(상태: 삭제 > 되돌리기)
	 * @param cmnt
	 * @return
	 */
	public ServiceResult adminUpdateCmnt(CommunityVO cmnt);
	/**
	 * 커뮤니티 게시글 추천 내역 조회
	 * @param recMap
	 * @return
	 */
	public List<CommunityRecVO> selectRecCmnt(int recCmnt);
	
	/**
	 * 커뮤니티 게시글 추천
	 * @param cmntNo
	 * @return
	 */
	public ServiceResult inRecCmnt(CommunityRecVO rec);
	
	/**
	 * 커뮤니티 게시글 추천 취소
	 * @param cmntNo
	 * @return
	 */
	public ServiceResult deRecCmnt(CommunityRecVO rec);
	
	/**
	 * 신고된 커뮤니티 글 리스트(관리자)
	 * @param pagingVO
	 * @return
	 */
	public List<CommunityVO> adminCmntList(PagingVO<CommunityVO> pagingVO);
	
}
