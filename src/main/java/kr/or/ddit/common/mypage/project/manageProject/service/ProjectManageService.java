package kr.or.ddit.common.mypage.project.manageProject.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.MemReviewVO;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.outsourcing.vo.ApplicantVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import kr.or.ddit.outsourcing.vo.ProjReviewVO;
import kr.or.ddit.pms.project.vo.projInvolveVO;

/**
 * @author 조채원
 * @since 2022. 8. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 17.   조채원      			 최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface ProjectManageService {
	public List<OutProjVO> findAll(Map<String, Object> pagingMap);
	
	public OutProjVO findOne(String projId);
	
	public ServiceResult createProjRev(ProjReviewVO projRev);
	
	public ProjReviewVO getProjRev(ProjReviewVO projRev);
	
	public ProjReviewVO updateProjRev(ProjReviewVO projRev);
	
	public ServiceResult deleteProjRev(String revId);
	
	public List<ApplicantVO> findApplyList(String projId);
	
	public ServiceResult createGenRev(MemReviewVO memRev);
	
	public MemReviewVO updateGenRev(MemReviewVO memRev);
	
	public ServiceResult deleteGenRev(String genrevId);
	
	public MemReviewVO getGenRev(MemReviewVO memRev);
	
	public void modifyGenGrade(MemReviewVO memRev);
	
	public void modifyComGrade(ProjReviewVO projRev);
}
