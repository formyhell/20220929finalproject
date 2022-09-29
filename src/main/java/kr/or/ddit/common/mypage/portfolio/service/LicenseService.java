package kr.or.ddit.common.mypage.portfolio.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.LicenseVO;

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
public interface LicenseService {
	public List<LicenseVO> findAll(String memId);
	
	public LicenseVO findOne(int licNo);
	
	public LicenseVO create(LicenseVO lic);
	
	public void remove(int licNo);
	
	public LicenseVO update(LicenseVO lic);
}
