package kr.or.ddit.admin.code.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.CommonCodeVO;

public interface AdminCodeService {
	/**
	 * 전체 공통코그 조회
	 * @return
	 */
	public List<CommonCodeVO> retrieveCodeList(Map<String, Object> map);
	
	/**
	 * 공통코드 추가
	 * @param code
	 * @return
	 */
	public ServiceResult createCode(CommonCodeVO code);
	
	/**
	 * 공통코드 수정
	 * @param code
	 * @return
	 */
	public ServiceResult modifyCode(CommonCodeVO code);
	
	/**
	 * 공통코드 삭제
	 * @param codeId
	 * @return
	 */
	public ServiceResult removeCode(String codeId);

}
