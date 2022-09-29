package kr.or.ddit.common.mypage.project.recommendProject.service;

import java.util.List;

import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.common.vo.PagingVO;

public interface RecommendProjectService {
	/**
	 * 추천 프로젝트 리스트 반환
	 * @param projId
	 * @return 추천 프로젝트 리스트
	 */
	public List<ProjectVO> selectProjectList(PagingVO<ProjectVO> pagingVO, String genId);
	
	/**
	 * 메인 최신 프로젝트 반환
	 */
	public List<ProjectVO> mainProjectList();
}
