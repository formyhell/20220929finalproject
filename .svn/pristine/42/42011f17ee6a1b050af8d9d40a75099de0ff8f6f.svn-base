package kr.or.ddit.common.mypage.project.contractProject.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.project.contractProject.dao.ContractProjectDAO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.outsourcing.contract.dao.ContractDAO;
import kr.or.ddit.outsourcing.vo.ContractVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import kr.or.ddit.pms.issue.vo.IssueVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 9. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자              	 	수정내용
 * --------     --------    ----------------------
 * 2022. 9. 3.    조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ContractProjectServiceImpl implements ContractProjectService {
	private final ContractProjectDAO contractDao;

	@Override
	public List<OutProjVO> findAll(Map<String, Object> pagingMap) {
		PagingVO<OutProjVO> pagingVO = (PagingVO<OutProjVO>) pagingMap.get("pagingVO");
		MemberVO member = (MemberVO) pagingMap.get("member");
		
		List<OutProjVO> projList = null;
		if(member == null) {
			throw new RuntimeException("해당 멤버가 없습니다.");
		} else if("ROLE_GENMEM".equals(member.getMemType().get(0).toString())) {
			pagingVO.setTotalRecord(contractDao.selectGenTotalProj(pagingMap));
			projList = contractDao.selectGenAll(pagingMap);
		} else if("ROLE_COMMEM".equals(member.getMemType().get(0).toString())) {
			pagingVO.setTotalRecord(contractDao.selectComTotalProj(pagingMap));
			projList = contractDao.selectComAll(pagingMap);
		}
		pagingVO.setDataList(projList);
		pagingMap.put("pagingVO", pagingVO);
		return projList;
	}

	@Override
	public List<ContractVO> findContractList(Map<String, Object> projMap) {
		MemberVO member = (MemberVO) projMap.get("member");
		List<ContractVO> contractList = new ArrayList<>();
		if(member == null) {
			throw new RuntimeException("해당 멤버가 없습니다.");
		} else if("ROLE_GENMEM".equals(member.getMemType().get(0).toString())) {
			contractList = contractDao.findGenContract(projMap);
		} else if("ROLE_COMMEM".equals(member.getMemType().get(0).toString())) {
			contractList = contractDao.findComContract(projMap);
		}
		
		return contractList;
	}
	
	
}
