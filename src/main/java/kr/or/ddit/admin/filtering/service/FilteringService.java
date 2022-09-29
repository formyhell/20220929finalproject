package kr.or.ddit.admin.filtering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.common.enumpkg.ServiceResult;

/**
 * @author 조채원
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.   조채원       			최초 생성 
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface FilteringService {
	public List<HashMap<String, Object>> findAll();
	
	public ServiceResult create(String filterWord);
	
	public void remove(int filterNo);
}
