package kr.or.ddit.admin.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;

public interface AdminMemberService {
	
	/**
	 * 회원 목록 조회
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> retrieveMemList(Map<String,Object> map);
	
	/**
	 * 회원 정지
	 * @param memId
	 * @return
	 */
	public ServiceResult modifyDisGenMem(String memId);
	public ServiceResult modifyDisComMem(String memId);
	
	/**
	 * 활동 활성화
	 * @param memId
	 * @return
	 */
	public ServiceResult modifyEnGenMem(String memId);
	public ServiceResult modifyEnComMem(String memId);
 
}
