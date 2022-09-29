package kr.or.ddit.common.mypage.project.contractProject.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.vo.PagingVO;
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
@Mapper
public interface ContractProjectDAO {
	public int selectGenTotalProj(Map<String, Object> pagingMap);
	
	public int selectComTotalProj(Map<String, Object> pagingMap);
	
	public List<OutProjVO> selectGenAll(Map<String, Object> pagingMap);
	
	public List<OutProjVO> selectComAll(Map<String, Object> pagingMap);
	
	public List<ContractVO> findGenContract(Map<String, Object> projMap);
	
	public List<ContractVO> findComContract(Map<String, Object> projMap);
}
