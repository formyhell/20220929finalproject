package kr.or.ddit.common.mypage.memInfo.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.memInfo.vo.GenObjVO;
import kr.or.ddit.common.mypage.memInfo.vo.GenSkillVO;
import kr.or.ddit.common.mypage.memInfo.vo.locationVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;

/**
 * @author 신창규
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.      신창규       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface MemInfoService {
	
	/**
	 * 일반회원 정보 상세조회
	 * @param MemId
	 * @return
	 */
	public GenMemberVO retrieveGenMemInfo(String MemId);
	
	/**
	 * 기업히원 정보 상세조회
	 * @param MemId
	 * @return
	 */
	public ComMemberVO retrieveComMemInfo(String MemId);
	
	public ComMemberVO retrieveComImg(OutProjVO projRegist);
	
	/**
	 * 일반회원정보 수정
	 * @param member
	 * @return
	 */
	public ServiceResult modifyGenMember(GenMemberVO genMember);
	
	/**
	 * 기업회원정보 수정
	 * @param member
	 * @return
	 */
	public ServiceResult modifyComMember(ComMemberVO comMember);
	
	/**
	 * 힐반회원 탈퇴
	 * @param MemId
	 * @return
	 */
	public ServiceResult deleteGenMember(MemberVO member, String password);
	
	/**
	 * 기업회원 탈퇴
	 * @param member
	 * @param password
	 * @return
	 */
	public ServiceResult deleteComMember(MemberVO member, String password);
	
	public void insertSkill(GenMemberVO genMem);
	public void insertLoc(GenMemberVO genMem);
	
	public int remove(GenSkillVO genId);
	public int remove1(GenObjVO genId);
	public int removeLoc(locationVO genId);
}
