package kr.or.ddit.pms.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.pms.project.vo.projInvolveVO;

/**
 * @author 작성자명
 * @since 2022. 8. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 17.      홍승조       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface ProjInvolveDAO {
	
	/**
	 * 참여한 프로젝트 목록
	 * @param projId 참여한 프로젝트 아이디
	 * @return 
	 */
	public List<projInvolveVO> selectProjInvolveList(String projId);
	
	
	/**
	 * pms 프로젝트에 참여한 인원 역할 부여하기
	 * @param projId
	 * @param involveMem
	 * @return 수정한 레크드 수 if >0 : 성공, else : 실패
	 */
	public int updateRole(projInvolveVO involve);
	
}
