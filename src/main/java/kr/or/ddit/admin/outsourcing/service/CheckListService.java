package kr.or.ddit.admin.outsourcing.service;

import java.util.List;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;

/**
 * @author 조채원
 * @since 2022. 8. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자              		 수정내용
 * --------     --------    ----------------------
 * 2022. 8. 8.    조채원      			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface CheckListService {
	public List<OutProjVO> findAll(PagingVO<OutProjVO> pagingVO);
	
	public List<OutProjVO> findRequireAll();
	
	public ServiceResult remove(OutProjVO outProj);
	
	public ServiceResult update(String projId);
	
	public ServiceResult removeRuquire(OutProjVO outProj);
	
	public ServiceResult updateRequire(OutProjVO outProj);
	
	public OutProjVO findById(String projId);
	
	// 아웃소싱 리스트 - 승인
	public List<OutProjVO> findApproveAll(PagingVO<OutProjVO> pagingVO);
	
	// 반려
	public List<OutProjVO> findNotApproveAll(PagingVO<OutProjVO> pagingVO);
}
