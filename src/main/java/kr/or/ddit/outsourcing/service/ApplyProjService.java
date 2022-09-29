package kr.or.ddit.outsourcing.service;

import java.util.List;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.outsourcing.vo.ApplicantVO;

/**
 * @author 조채원
 * @since 2022. 8. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 24.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface ApplyProjService {
	public List<ApplicantVO> getAll(String projId);
	
	
	/**
	 * 지원할 프로젝트 직무분야 가져오기
	 * @param projId 지원할 프로젝트 아이디
	 * @return
	 */
	public ApplicantVO getprojectObj(String projId);
	
	/**
	 * 아웃소싱 프로젝트에 지원하기
	 * @param projId 지원자의 아이디
	 * @return
	 */
	public ServiceResult supprotProject(ApplicantVO applyProj);
}
