package kr.or.ddit.common.alert.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.alert.vo.AlertVO;

@Mapper
public interface AlertDAO {
	
	/**
	 * 알림 목록 조회
	 * @param map
	 * @return
	 */
	public List<AlertVO> selectAlertList(Map<String, Object> map);
	
	/**
	 * 알림 조회
	 * @param map
	 * @return
	 */
	public AlertVO selectAlert(int alertNo);
	
	/**
	 * 알림 등록
	 * @param alert
	 * @return
	 */
	public int insertAlert(AlertVO alert);
	
	/**
	 * 알림 수정
	 * @param alert
	 * @return
	 */
	public int updateAlert(AlertVO alert);
	
	/**
	 * 알림 삭제
	 * @param alert
	 * @return
	 */
	public int deleteAlert(int alertNo);
	

}
