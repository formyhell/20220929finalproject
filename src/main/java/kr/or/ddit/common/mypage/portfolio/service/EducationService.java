package kr.or.ddit.common.mypage.portfolio.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.member.vo.EducationVO;

/**
 * @author 조채원
 * @since 2022. 8. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 22.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface EducationService {
	public List<EducationVO> findAll(String memId);
	
	public EducationVO create(EducationVO edu);
	
	public void remove(int eduNo);
	
	public List<Map<String, Object>> selectEduTypeList();
	
	public List<Map<String, Object>> selectEduStateList();
	
	public EducationVO update(EducationVO edu);
}
