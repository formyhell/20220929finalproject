package kr.or.ddit.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;

@Mapper
public interface AdminMemberDAO {

	/**
	 * 페이징을 위한 회원 수
	 * @param 
	 * @return
	 */
	public int selectTotalMem(Map<String,Object> map);
	
	
	/**
	 * 회원 목록 조회
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> selectMemList(Map<String,Object> map);
	
	/**
	 * 회원 정지
	 * @param memId
	 * @return
	 */
	public int updateDisGenMem(String memId);
	public int updateDisComMem(String memId);
	
	/**
	 * 회원 활성화
	 * @param memId
	 * @return
	 */
	public int updateEnGenMem(String memId);
	public int updateEnComMem(String memId);
}
