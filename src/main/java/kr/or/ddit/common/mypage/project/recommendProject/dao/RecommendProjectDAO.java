package kr.or.ddit.common.mypage.project.recommendProject.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.common.mypage.project.recommendProject.vo.RecommendProjectVO;

@Mapper
public interface RecommendProjectDAO {
	/**
	 * 각 프로젝트에 점수 부여
	 * @param genId 회원아이디
	 * @return 점수가 부여된 프로젝트 리스트
	 */
	public List<RecommendProjectVO> checkProj(String genId);
	/**
	 * 프로젝트 상세정보
	 * @param projIds 프로젝트 아이디들('projId','projId'...)
	 * @return 프로젝트 상세정보가 담긴 리스트
	 */
	public List<ProjectVO> getProj(Map<String,Object> pagingMap);
	
	/**
	 * 메인 프로젝트 최신 프로젝트 추천
	 * @return 최근에 올라온 프로젝트 목록
	 */
	public List<ProjectVO> recommendProjToMain();
}

