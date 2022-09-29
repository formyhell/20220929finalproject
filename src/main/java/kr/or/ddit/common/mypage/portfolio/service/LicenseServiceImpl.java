package kr.or.ddit.common.mypage.portfolio.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.LicenseVO;
import kr.or.ddit.common.mypage.portfolio.dao.LicenseDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 8. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 18.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class LicenseServiceImpl implements LicenseService {
	private final LicenseDAO licenseDAO;
	
	@Override
	public List<LicenseVO> findAll(String memId) {
		return licenseDAO.selectAll(memId);
	}

	@Override
	public LicenseVO findOne(int licNo) {
		if(licNo == 0) {
			throw new RuntimeException(String.format("%d에 해당하는 번호가 없습니다.", licNo));
		}
		return licenseDAO.selectOne(licNo);
	}

	@Override
	public LicenseVO create(LicenseVO lic) {
		if(lic == null) {
			throw new RuntimeException("입력한 값이 없습니다.");
		}
		int rowcnt = licenseDAO.insertLic(lic);
		if(rowcnt < 1) {
			throw new RuntimeException("등록에 실패했습니다.");
		} 
		return licenseDAO.selectLic(lic);
	}
	
	@Override
	public void remove(int licNo) {
		licenseDAO.deleteLic(licNo);
	}

	@Override
	public LicenseVO update(LicenseVO lic) {
		if(lic == null) {
			throw new RuntimeException("입력한 값이 없습니다.");
		}
		int rowcnt = licenseDAO.updateLic(lic);
		if(rowcnt < 1) {
			throw new RuntimeException("등록에 실패했습니다.");
		} 
		return licenseDAO.selectLic(lic);
	}
}
