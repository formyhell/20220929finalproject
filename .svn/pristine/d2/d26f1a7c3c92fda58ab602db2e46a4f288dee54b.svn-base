package kr.or.ddit.common.star.dao;
/**
 * @author 윤지영
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 24.      윤지영       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.star.vo.StarToGenVO;


@Mapper
public interface StarDAO {
	/**
	 * 기업 일반회원 구분
	 * @param genId
	 * @return
	 */
	public int checkGenOrCom(String genId);
	/**
	 * 평점 저장
	 * @param rating 새로운 평점
	 * @return 성공여부
	 */
	public boolean updateRating(Map<String,Object> map);
	
	/**
	 * 해당 회원의 평점 불러오기
	 * @param genId 회원 아이디
	 * @return 평점
	 */
	public int selectRating(String genId);
	
	/** 일반회원
	 * 완료한 프로젝트 수
	 * @param genId 회원아이디
	 * @return 완료한 프로젝트 수
	 */
	public int genDoneProj(String genId);
	
	/** 일반회원
	 * 진행중인 프로젝트 수
	 * @param genId 회원아이디
	 * @return 진행중인 프로젝트 수
	 */
	public int genProgressProj(String genId);
	
	/**
	 * 별점을 줄 회원 리스트
	 * @param map genId 오너아이디 projId 완료된 프로젝트 아이디
	 * @return StarToGenVO
	 */
	public List<StarToGenVO> workerList(Map<String,Object> map);
	
	/** 기업회원
	 * 완료한 프로젝트 수
	 * @param genId 회원아이디
	 * @return 완료한 프로젝트 수
	 */
	public int comDoneProj(String comId);
	/** 기업회원
	 * 진행중인 프로젝트 수
	 * @param genId 회원아이디
	 * @return 진행중인 프로젝트 수
	 */
	public int comProgressProj(String comId);
	
}
