package kr.or.ddit.common.mypage.project.interestProject.service;
/**
 * @author 윤지영
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. ?.      306-06       최초작성
 * 2022. 8. 23.      306-06      페이징 처리
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

import java.util.List;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.mypage.project.interestProject.vo.InterestProjectVO;
import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.common.vo.PagingVO;

public interface InterestProjectService { 
	/**
	 * 관심 체크 추가
	 * @param interest
	 * @return 성공여부
	 */
	public boolean cheakInterest(InterestProjectVO interest);
	/**
	 * 관심 체크 프로젝트 목록 가져오기
	 * @return 관심 프로젝트 목록
	 */
	public List<ProjectVO> cheakedInterestList(PagingVO<ProjectVO> pagingVO, String genId); //insert
	/**
	 * 관심 프로젝트 삭제하기
	 * @param interest (현제 로그인중인 회원아이디, 삭제하고자하는 관심 프로젝트 아이디)
	 * @return 성공여부 (true:성공, false: 실패)
	 */
	public boolean uncheakedInterest(InterestProjectVO interest); //delete
	/**
	 * 회원 삭제시 해당 회원관련 관심프로젝트 삭제
	 * @param genId
	 * @return 성공여부(ture:성공, false:실패)
	 */
	public boolean deleteAllInterestFromGen(String genId);
	/**
	 * 게시물 삭제시 해당 게시물관련 관심프로젝트 삭제
	 * @param projId
	 * @return 성공여부(ture:성공, false:실패)
	 */
	public boolean deleteAllInterestFromProj(String projId);
	/**
	 * 게시물 중복 체크 여부
	 * @param interest
	 * @return 
	 */
	public InterestProjectVO duplicateCheck (InterestProjectVO interest);
	
	// 지원 프로젝트
	/**
	 * 지원 프로젝트 리스트
	 * @param pagingMap
	 * @return
	 */
	public List<ProjectVO> retrieveApplyProjectList(PagingVO<ProjectVO> pagingVO, String genId);
	
	/**
	 * 프로젝트 지원 삭제
	 * @param genId
	 * @return
	 */
	public ServiceResult removeApplyProject(String applyId);
	
}
