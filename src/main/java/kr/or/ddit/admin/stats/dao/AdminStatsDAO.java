package kr.or.ddit.admin.stats.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminStatsDAO {
	
	/**
	 * 년월별 회원 수
	 * @param year
	 * @return
	 */
	public List<Map<String, Object>> selectGenJoinList();
	
	public List<Map<String, Object>> selectComJoinList();

	/**
	 * 보유스킬별 회원 수
	 * @return
	 */
	public List<Map<String, Object>> selectSkillList();
	
	/**
	 * 년월별 등록한 프로젝트 수
	 * @return
	 */
	public List<Map<String, Object>> selectOutProjList();
	public List<Map<String, Object>> selectPmsProjList();
	
	/**
	 * 관리자 상단 리스트 (수입, 아웃프젝수, 커뮤니티게시글수, 총회원수)
	 * @return
	 */
	public Map<String, Object> selectTop();

	/**
	 * 처리해야할 커뮤니티 시고건수
	 * @return
	 */
	public Map<String, Object> selectTrep();
	
	

}
