package kr.or.ddit.common.mypage.project.interestProject.dao;
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
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.common.mypage.project.interestProject.vo.InterestProjectVO;
import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.outsourcing.vo.ApplicantVO;

@Mapper
public interface InterestProjectDAO {
	/**
	 * 관심 체크 시 추가
	 * @param interest 
	 * @return 성공여부
	 */
	public boolean insertInterest(InterestProjectVO interest);
	/**
	 * 검색 조건에 일치하는 게시글 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectProjectCount(String genId);
	/**
	 * 회원이 관심을 가진 프로젝트 정보
	 * @param genId 일반회원 아이디
	 * @return 프로젝트 정보 목록
	 */
	public List<ProjectVO> selectProjectList(Map<String,Object> pagingMap);
	/**
	 * 관심 해제시 1개 삭제
	 * @param interest
	 * @return 성공 여부
	 */
	public boolean deleteInterest(InterestProjectVO interest);
	/**
	 * 회원 삭제시 해당 아이디가 가진 내역 전체 삭제
	 * @param genId 회원 아이디
	 * @return 성공여부
	 */
	public boolean deleteGen(String genId);
	/**
	 * 게시물 삭제시 전체 삭제
	 * @param projId 게시물 아이디
	 * @return 성공여부
	 */
	public boolean deleteProj(String projId);
	/**
	 * 찜 중복 체크 확인
	 * @param interest
	 * @return 
	 */
	public InterestProjectVO getByProjWithGen(InterestProjectVO interest);
	
	// 지원 프로젝트
	/**
	 * 페이징을 위한 지원 프로젝트 전체 수
	 * @param genId
	 * @return
	 */
	public int selectApplyProjectCount(String genId);
	
	/**
	 * 지원 프로젝트 리스트
	 * @param pagingMap
	 * @return
	 */
	public List<ProjectVO> selectApplyProjectList(Map<String,Object> pagingMap);
	
	/**
	 * 지원 프로젝트 조회
	 * @param applyId
	 * @return
	 */
	public ApplicantVO selectApplyProject(String applyId);
	
	/**
	 * 지원 프로젝트 삭제
	 * @param genId
	 * @return
	 */
	public int deleteApplyProject(String applyId);
	
}
