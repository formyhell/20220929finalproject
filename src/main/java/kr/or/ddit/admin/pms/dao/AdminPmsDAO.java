package kr.or.ddit.admin.pms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.pms.project.vo.PMSProjectVO;

@Mapper
public interface AdminPmsDAO {
	/**
	 * 페이징을 위한 pms 수
	 * @param map
	 * @return
	 */
	public int selectTotalPms(Map<String, Object> map);
	
	/**
	 * pms 목록 조회
	 * @param map
	 * @return
	 */
	public List<PMSProjectVO> selectPmsList(Map<String, Object> map);
	
	/**
	 * pms 조회
	 * @param projId
	 * @return
	 */
	public PMSProjectVO selectPms(String projId);
	
	/**
	 * pms 상태 변경
	 * @param pms
	 * @return
	 */
	public int updatePms(PMSProjectVO pms);

}
