package kr.or.ddit.common.mypage.project.interestProject.service;

/**
 * @author 윤지영
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. ?.      306-06       최초작성
 * 2022. 8. 23.      306-06      페이징 처리
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.web.authentication.preauth.PreAuthenticatedCredentialsNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.mypage.project.interestProject.dao.InterestProjectDAO;
import kr.or.ddit.common.mypage.project.interestProject.vo.InterestProjectVO;
import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.outsourcing.vo.ApplicantVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InterestProjectServiceImpl implements InterestProjectService {

	private final InterestProjectDAO interestDAO;

	@Override
	public boolean cheakInterest(InterestProjectVO interest) {
		if (duplicateCheck(interest) == null) { // 이미 관심체크한 프로젝트인지 확인
			interestDAO.insertInterest(interest);
			return true;
		} else {
			interestDAO.deleteInterest(interest); // 두번 누를 시 관심 체크 해제
			return false;
		}

	}

	@Override
	public List<ProjectVO> cheakedInterestList(PagingVO<ProjectVO> pagingVO, String genId) {
		if (genId == null)
			throw new PreAuthenticatedCredentialsNotFoundException("로그인이 안되어 있음 ");

		int totalRecord = interestDAO.selectProjectCount(genId);
		pagingVO.setTotalRecord(totalRecord);

		Map<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("genId", genId);
		pagingMap.put("pagingVO", pagingVO);
		List<ProjectVO> projList = interestDAO.selectProjectList(pagingMap);
		for (ProjectVO vo : projList) {
			vo.setProjTitle(vo.getProjTitle().replaceAll("<", "&lt;"));
			vo.setProjTitle(vo.getProjTitle().replaceAll(">", "&gt;"));
		}
		pagingVO.setDataList(projList);
		return projList;
	}

	@Override
	public boolean uncheakedInterest(InterestProjectVO interest) {
		return interestDAO.deleteInterest(interest);
	}

	@Override
	public boolean deleteAllInterestFromGen(String genId) {
		return interestDAO.deleteGen(genId);
	}

	@Override
	public boolean deleteAllInterestFromProj(String projId) {
		return interestDAO.deleteProj(projId);
	}

	@Override
	public InterestProjectVO duplicateCheck(InterestProjectVO interest) {
		InterestProjectVO projWithGen = interestDAO.getByProjWithGen(interest);
		return projWithGen;
	}

	// 지원 프로젝트
	@Override
	public List<ProjectVO> retrieveApplyProjectList(PagingVO<ProjectVO> pagingVO, String genId) {
		if (genId == null)
			throw new PreAuthenticatedCredentialsNotFoundException("로그인이 안되어 있음 ");
	
		int totalRecord = interestDAO.selectApplyProjectCount(genId);
		pagingVO.setTotalRecord(totalRecord);
	
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("genId", genId);
		pagingMap.put("pagingVO", pagingVO);
		List<ProjectVO> projList = interestDAO.selectApplyProjectList(pagingMap);
		pagingVO.setDataList(projList);
		return projList;
	}
	
	
	@Override
	public ServiceResult removeApplyProject(String applyId) {
		ApplicantVO applyProject = interestDAO.selectApplyProject(applyId);
		if(applyProject==null)
			throw new RuntimeException(String.format("%d 지원 프로젝트 없음.",applyProject.getApplyId()));
		
		int rowcnt = interestDAO.deleteApplyProject(applyId);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
}
