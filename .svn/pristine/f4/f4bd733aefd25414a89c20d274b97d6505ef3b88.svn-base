package kr.or.ddit.common.mypage.project.rejectProject.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.outsourcing.vo.OutProjVO;

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
@Mapper
public interface RejectProjDAO {
	public List<OutProjVO> selectAll(Map<String, Object> pagingMap);
	
	public int selectTotalAll(Map<String, Object> pagingMap);
	
	public OutProjVO selectOne(String projId);
}
