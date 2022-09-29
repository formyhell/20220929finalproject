package kr.or.ddit.admin.code.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.vo.CommonCodeTypeVO;
import kr.or.ddit.common.vo.CommonCodeVO;

@Mapper
public interface AdminCodeDAO {
	/**
	 * 전체 공통코드 타입 조회
	 * @return
	 */
	public List<CommonCodeTypeVO> selectCodeTypeList();
	
	/**
	 * 페이징을 위한 레코드 수
	 * @return
	 */
	public int selectTotalCode(Map<String, Object> map);
	
	/**
	 * 전체 공통코그 조회
	 * @return
	 */
	public List<CommonCodeVO> selectCodeList(Map<String, Object> map);
	
	/**
	 * 공통코드 조회
	 * @return
	 */
	public CommonCodeVO selectCode(String codeId);
	
	/**
	 * 공통코드 추가
	 * @param code
	 * @return
	 */
	public int insertCode(CommonCodeVO code);
	
	/**
	 * 공통코드 수정
	 * @param code
	 * @return
	 */
	public int updateCode(CommonCodeVO code);
	
	/**
	 * 공통코드 삭제
	 * @param codeId
	 * @return
	 */
	public int deleteCode(String codeId);
}
