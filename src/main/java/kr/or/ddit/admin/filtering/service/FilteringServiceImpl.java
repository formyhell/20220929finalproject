package kr.or.ddit.admin.filtering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.admin.filtering.dao.FilteringDAO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import lombok.RequiredArgsConstructor;

/**
 * @author 조채원
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.    조채원       			최초생성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
@RequiredArgsConstructor
public class FilteringServiceImpl implements FilteringService {
	private final FilteringDAO filterDAO;
	
	@Override
	public List<HashMap<String, Object>> findAll() {
		return filterDAO.selectAll();
	}

	@Override
	public ServiceResult create(String filterWord) {
		ServiceResult result = null;
		if(filterDAO.selectCountFilter(filterWord) > 0) {
			result = ServiceResult.DUPLICATED;
		} else {
			int rowcnt = filterDAO.insertFilter(filterWord);
			if(rowcnt > 0) {
				result = ServiceResult.OK;
			} else {
				result = ServiceResult.FAIL;
			}
		}
		return result;
	}

	@Override
	public void remove(int filterNo) {
		if(filterDAO.selectFilterNo(filterNo) == 0) {
			throw new RuntimeException(String.format("%d번 단어가 없습니다.", filterNo));
		}
		filterDAO.deleteFilter(filterNo);
	}

}
