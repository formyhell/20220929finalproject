package kr.or.ddit.pms.project.service;

import java.util.List;

import kr.or.ddit.common.enumpkg.ServiceResult;
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
public interface ProjInvolveService {
	
	
	/**
	 * pms 프로젝트에 참여한 인원 목록
	 * @param projId
	 * @return
	 */
	public List<projInvolveVO> retrieveProjInvolveList(String projId);
	
	
	
	/**
	 * pms 프로젝트에 참여한 인원 역할 부여하기
	 * @param projId
	 * @param involveMem
	 * @return {@link PKNotFoundException}, OK, FAIL
	 */
	public ServiceResult updateRole(projInvolveVO involve);
	
}
