package kr.or.ddit.outsourcing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.vo.CommonCodeVO;
import kr.or.ddit.outsourcing.vo.ApplicantVO;

/**
 * @author 조채원
 * @since 2022. 8. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 24.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface ApplyProjDAO {
	public List<ApplicantVO> selectAll(String projId);
	
	public int selectProjOne(String projId);
	
	
	
	/**
	 * 이미 지원한 프로젝트인지 확인하기
	 * @param applicant 지원자와 지원프로젝트 정보
	 * @return
	 */
	public int supportCheckProj(ApplicantVO applicant);
	
	/**
	 * 지원할 프로젝트 직무분야 가져오기
	 * @param projId 지원할 프로젝트 아이디
	 * @return 프로젝트의 직무분야
	 */
	public List<CommonCodeVO> getSupportProjectObj(String projId);
	
	/**
	 * 아웃소싱 프로젝트에 지원하기
	 * @param projId 지원자의 아이디
	 * @return
	 */
	public int supportProject(ApplicantVO applicant);
}
