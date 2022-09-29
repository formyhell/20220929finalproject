package kr.or.ddit.common.mypage.project.contractProject.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.outsourcing.vo.ContractVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;

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
 * </pre>
 */
public interface ContractProjectService {
	public List<OutProjVO> findAll(Map<String, Object> pagingMap);
	
	public List<ContractVO> findContractList(Map<String, Object> projMap);
}
