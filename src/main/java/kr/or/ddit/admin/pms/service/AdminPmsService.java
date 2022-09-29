package kr.or.ddit.admin.pms.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.pms.project.vo.PMSProjectVO;

public interface AdminPmsService {
	
	/**
	 * pms 목록 조회
	 * @param map
	 * @return
	 */
	public List<PMSProjectVO> retrievePmsList(Map<String, Object> map);
	
	/**
	 * pms 상태 변경
	 * @param pms
	 * @return
	 */
	public ServiceResult modifyPms(PMSProjectVO pms);

}
