package kr.or.ddit.common.member.dao;

import org.apache.ibatis.annotations.Mapper;

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
@Mapper
public interface MemDAO {
	/**
	 * 일반 회원가입
	 * @param genMember
	 * @return
	 */
	public int insertGenMember(GenMemberVO genMember);
	/**
	 * 기업 회원가입
	 * @param comMember
	 * @return
	 */
	public int insertComMember(ComMemberVO comMember);
	
	/**
	 * 일반회원 아이디 찾기
	 * @param genMember
	 * @return
	 */
	public String findGenId(GenMemberVO genMember);

	/**
	 * 기업회원 아이디 찾기
	 * @param comMember
	 * @return
	 */
	public String findComId(ComMemberVO comMember);
	
	/**
	 * 일반회원 비밀번호 찾기
	 * @param genMember
	 * @return 일치하는 회원수(COUNT) 1이면 성공
	 */
	public int findGenPass(GenMemberVO genMember);
	
	/**
	 * 기업회원 비밀번호 찾기
	 * @param comMember
	 * @return 일치하는 회원수(COUNT) 1이면 성공
	 */
	public int findComPass(ComMemberVO comMember);
	
}
