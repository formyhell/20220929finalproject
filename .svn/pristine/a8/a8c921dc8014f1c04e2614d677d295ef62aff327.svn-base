package kr.or.ddit.common.mypage.memInfo.service;

import java.util.Map;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.MemberVO;

public interface PWService {
	
	/**
	 * 비밀번호 변경
	 * @param map
	 * @return
	 */
	public ServiceResult modifyGenPW(Map<String, Object> map);
	
	public ServiceResult modifyComPW(Map<String, Object> map);
	
	/**
	 * 비밀번호 변경(비밀번호 찾기용 임시 비밀번호)
	 * @param map
	 * @return
	 */
	public int findGenPw(Map<String, Object> map);
	
	public int findComPw(Map<String, Object> map);
}
