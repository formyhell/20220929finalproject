package kr.or.ddit.common.member.service;

import java.util.Map;

import org.springframework.validation.Errors;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;

/**
 * @author 김유진
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.       김유진              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface MemService {
	
	/**
	 * 일반 회원가입
	 * @param genMember
	 * @return PKDUPLICATED(중복), OK, FAIL
	 */
	public ServiceResult createGenMember(GenMemberVO genMember);
	
	/**
	 * 기업 회원가입
	 * @param comMember
	 * @return PKDUPLICATED(중복), OK, FAIL
	 */
	public ServiceResult createComMember(ComMemberVO comMember);

	/**
	 * 일반회원 아이디 찾기
	 * @param genMember
	 * @return 회원의 아이디, 실패시 error
	 */
	public String findGenId(GenMemberVO genMember);
	
	/**
	 * 기업회원 아이디 찾기
	 * @param comMember
	 * @return 회원의 아이디, 실패시 error
	 */
	public String findComId(ComMemberVO comMember);
	
	/**
	 * 일반회원 비밀번호 찾기
	 * @param genMember
	 * @return
	 */
	public ServiceResult findGenPass(GenMemberVO genMember);
	
	/**
	 * 기업회원 비밀번호 찾기
	 * @param comMember
	 * @return
	 */
	public ServiceResult findComPass(ComMemberVO comMember);
}
