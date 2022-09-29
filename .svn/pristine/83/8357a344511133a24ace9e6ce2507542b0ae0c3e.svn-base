package kr.or.ddit.outsourcing.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.outsourcing.dao.ApplyProjDAO;
import kr.or.ddit.outsourcing.vo.ApplicantVO;
import lombok.RequiredArgsConstructor;

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
@Service
@RequiredArgsConstructor
public class ApplyProjServiceImpl implements ApplyProjService {
	private final ApplyProjDAO applyDao;

	@Override
	public List<ApplicantVO> getAll(String projId) {
		List<ApplicantVO> applyList = null;
		int rowcnt = applyDao.selectProjOne(projId);
		return applyList = applyDao.selectAll(projId);
	}

	@Override
	public ServiceResult supprotProject(ApplicantVO applyProj) {
		ServiceResult result = null;
		
		int supportCheck = applyDao.supportCheckProj(applyProj);
		if (supportCheck > 0) {
			result = ServiceResult.DUPLICATED;
		} else {
			applyDao.supportProject(applyProj);
			result = ServiceResult.OK;
		}
		
		
		
		return result;
	}

	@Override
	public ApplicantVO getprojectObj(String projId) {
		
		ApplicantVO applicant = new ApplicantVO();
		
		applicant.setOutObjList(applyDao.getSupportProjectObj(projId));
		
		
		return applicant;
	}
}
