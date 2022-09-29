package kr.or.ddit.common.star.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.star.vo.StarToGenVO;

public interface StarService {
	/**
	 * 기존평점에 새로운 평점 추가
	 * @param newRating
	 * @return 성공여부
	 */
	public boolean newRating(String genId,int newRating);
	/**
	 * 평점 확인
	 * @param genId
	 * @return
	 */
	public double checkRating(String genId);
	/**
	 * 함께 프로젝트를 진행한 회원리스트
	 * @param genId 프로젝트 종료한 회원아이디
	 * @param projId 완료한 프로젝트 아이디
	 * @return 사원리스트
	 */
	public List<StarToGenVO> workerList(String genId,String projId);
}
