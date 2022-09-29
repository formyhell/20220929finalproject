package kr.or.ddit.common.mypage.project.rejectProject.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.project.rejectProject.dao.RejectProjDAO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 9. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 9. 8.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RejectProjServiceImpl implements RejectProjService {
	private final RejectProjDAO rejectDAO;

	@Override
	public List<OutProjVO> getAllProj(Map<String, Object> pagingMap) {
		PagingVO<OutProjVO> pagingVO = (PagingVO<OutProjVO>) pagingMap.get("pagingVO");
		MemberVO member = (MemberVO) pagingMap.get("member");
		
		List<OutProjVO> projList = null;
		pagingVO.setTotalRecord(rejectDAO.selectTotalAll(pagingMap));
		projList = rejectDAO.selectAll(pagingMap);
		pagingVO.setDataList(projList);
		pagingMap.put("pagingVO", pagingVO);
		return projList;
	}

	@Override
	public OutProjVO findOne(String projId) {
		OutProjVO saveProj = rejectDAO.selectOne(projId);
		log.info("saveProj: " + saveProj + "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		if(saveProj==null) {
			throw new RuntimeException(String.format("%s에 해당하는 프로젝트가 없습니다.", projId));
		}
		return saveProj;
	}
	
}
