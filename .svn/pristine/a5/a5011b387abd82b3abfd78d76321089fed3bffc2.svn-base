package kr.or.ddit.admin.filtering.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author 조채원
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자              		 수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.    조채원       		최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface FilteringDAO {
	
	/**
	 * 필터링 단어 리스트 조회
	 * @return 
	 */
	public List<HashMap<String, Object>> selectAll(); 
	
	/**
	 * 필터링 단어 등록
	 * @param filterWord
	 * @return
	 */
	public int insertFilter(String filterWord);
	
	/**
	 * 필터링 단어 삭제
	 * @param filterNo
	 * @return
	 */
	public int deleteFilter(int filterNo);
	
	
	/**
	 * 필터링 단어가 중복되는지 검사
	 * @param filter
	 * @return
	 */
	public int selectCountFilter(String filter);
	
	/**
	 * 필터링 번호가 존재하는지 검사
	 * @param filterNo
	 * @return
	 */
	public int selectFilterNo(int filterNo);
}
