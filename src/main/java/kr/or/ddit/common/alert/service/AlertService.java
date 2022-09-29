package kr.or.ddit.common.alert.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.alert.vo.AlertVO;
import kr.or.ddit.common.enumpkg.ServiceResult;

public interface AlertService {
	
	/**
	 * 알림 목록 조회
	 * @param map
	 * @return
	 */
	public List<AlertVO> retrieveAlertList(Map<String, Object> map);
	
	/**
	 * 알림 등록
	 * @param alert
	 * @return
	 */
	public ServiceResult createAlert(AlertVO alert);
	
	/**
	 * 알림 수정
	 * @param alert
	 * @return
	 */
	public ServiceResult modifyAlert(AlertVO alert);
	
	/**
	 * 알림 삭제
	 * @param alert
	 * @return
	 */
	public ServiceResult removeAlert(int alertNo);

}
