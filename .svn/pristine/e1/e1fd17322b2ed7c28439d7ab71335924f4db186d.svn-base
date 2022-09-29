package kr.or.ddit.common.mypage.portfolio.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.AwardVO;
import kr.or.ddit.common.member.vo.LicenseVO;
import kr.or.ddit.common.mypage.portfolio.dao.AwardDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 8. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 19.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AwardServiceImpl implements AwardService {
	private final AwardDAO awardDAO;
	
	@Override
	public List<AwardVO> findAll(String memId) {
		return awardDAO.selectAll(memId);
	}

	@Override
	public AwardVO create(AwardVO award) {
		if(award == null) {
			throw new RuntimeException("입력한 값이 없습니다.");
		}
		int rowcnt = awardDAO.insertAward(award);
		if(rowcnt < 1) {
			throw new RuntimeException("등록에 실패했습니다.");
		} 
		return awardDAO.selectAward(award);
	}
	
	@Override
	public AwardVO update(AwardVO award) {
		if(award == null) {
			throw new RuntimeException("입력한 값이 없습니다.");
		}
		int rowcnt = awardDAO.updateAward(award);
		if(rowcnt < 1) {
			throw new RuntimeException("등록에 실패했습니다.");
		} 
		return awardDAO.selectAward(award);
	}

	@Override
	public void remove(int awardNo) {
		awardDAO.deleteAward(awardNo);
	}

}
