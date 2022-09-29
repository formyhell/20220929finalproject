package kr.or.ddit.common.member.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.MemberVO;


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
public interface MemberDAO {
	
	/**
	 * 회원 상세 조회
	 * @param memId 조회할 회원의 아이디
	 * @return 존재하지 않는 경우, null 반환
	 */
	public MemberVO selectMember(String memId);
	
	/**
	 * 일치하는 ID 찾기
	 * @param memId
	 * @return
	 */
	public MemberVO findPk(String memId);
	/**
	 * 일치하는 Nick 찾기
	 * @param memId
	 * @return
	 */
	public MemberVO findNick(String memId);
	
	

}