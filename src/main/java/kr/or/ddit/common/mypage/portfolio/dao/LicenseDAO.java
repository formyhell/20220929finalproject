package kr.or.ddit.common.mypage.portfolio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.member.vo.LicenseVO;

/**
 * @author 조채원
 * @since 2022. 8. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자              		 수정내용
 * --------     --------    ----------------------
 * 2022. 8. 18.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface LicenseDAO {
	public List<LicenseVO> selectAll(String memId);
	
	public int insertLic(LicenseVO lic);

	public int deleteLic(int licNo);
	
	public LicenseVO selectOne(int licNo);
	
	public LicenseVO selectLic(LicenseVO lic);
	
	public int updateLic(LicenseVO lic);
}
