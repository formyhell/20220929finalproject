package kr.or.ddit.common.mypage.memInfo.service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.MemberVO;

public interface AuthenticateService {
	/**
	 * id와 password 기반의 인증 로직
	 * @param inputData id와 password를 가진 VO
	 * @return 존재하지 않을때(NOTEXIST), 비번오류(INVALIDPASSWORD), 성공(OK)
	 */
	public ServiceResult authenticate(MemberVO inputData);
}
