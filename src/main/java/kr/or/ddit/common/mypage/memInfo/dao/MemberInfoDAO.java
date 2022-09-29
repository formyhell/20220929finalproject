package kr.or.ddit.common.mypage.memInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
/**
 * @author 작성자명
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.memInfo.vo.GenObjVO;
import kr.or.ddit.common.mypage.memInfo.vo.GenSkillVO;
import kr.or.ddit.common.mypage.memInfo.vo.locationVO;
import kr.or.ddit.common.vo.CommonCodeVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;
@Mapper
public interface MemberInfoDAO {
	/**
	 * 회원 정보 상세
	 * @param memId 조회할 회원의 아이디
	 * @return 존재하지 않는 경우, null 반환
	 */
	public MemberVO selectMember(String memId);
	
	//일반회원
	public GenMemberVO selectGenMem(String memId);
	
	//기업회원
	public ComMemberVO selectComMem(String memId);
	
	public ComMemberVO selectComImg(OutProjVO projRegist);
	
	/**
	 * 일반회원 회원정보 수정
	 * @param member
	 * @return 수정한 레코드 수 if>0:성공, else:실패
	 */
	public int updateGenMember(GenMemberVO genMember);
	
	/**
	 * 기업회원 회원정보 수정
	 * @param member 
	 * @return 수정한 레코드 수 if>0:성공, else:실패
	 */
	public int updateComMember(ComMemberVO comMember);
	
	/**
	 * 일반회원탈퇴
	 * @param memId
	 * @return 삭제한 레코드 수 if>0:성공, else:실패n
	 */
	public int deleteGenMember(String memId);
	
	/**
	 * 기업회원탈퇴
	 * @param memId
	 * @return 삭제한 레코드 수 if>0:성공, else:실패n
	 */
	public int deleteComMember(String memId);
	
	public MemberVO selectMemberForAuth(MemberVO inputData);
	
	public List<CommonCodeVO> selectObjList();
	public List<CommonCodeVO> selectSkillList();
	public List<CommonCodeVO> selectLocList();
	
	
	/**
	 * 회원의 직무분야,보유기술 조회
	 * @param genId
	 * @return
	 */
//	
//	public List<String> objList(String genId);
//	public List<String> skillList(String genId);
	public List<GenObjVO> genObjList(String genId);
	public List<GenSkillVO> genSkillList(String genId);
	public List<locationVO> genLocList(String genId);
	
	public int insertSkill(GenMemberVO genMem);
	public int insertObj(GenMemberVO genMem);
	public int insertLoc(GenMemberVO genMem);
	
	//
	public int delSkill(GenSkillVO genId);
	public int delObj(GenObjVO genId);
	public int delLoc(locationVO genId);

}


