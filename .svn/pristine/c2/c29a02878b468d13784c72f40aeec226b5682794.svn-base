package kr.or.ddit.pms.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.project.service.PMSProjectServiceImpl;
import kr.or.ddit.pms.project.vo.PMSProjectVO;
import kr.or.ddit.pms.project.vo.projInvolveVO;

/**
 * @author 작성자명
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.      홍승조       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface PMSProjectDAO {
	/**
	 * PMS 프로젝트 정보 등록
	 * @param PMSProject
	 * @return 등록한 레코드 수 if > 0 : 성공, else : 실패
	 */
	public int insertPMSProject(PMSProjectVO PMSProject);
	
	/**
	 * PMS 프로젝트 페이징 처리를 위한 레코드 수 조회
	 * @param pagingVO : 검색조건을 가진 VO
	 * @return
	 */
	public int selectTotalPMSProject(PagingVO<PMSProjectVO> pagingVO);
	
	
	/**
	 * 본인이 등록한 PMS프로젝트의 페이징 처리를 위한 레코드 수 조회
	 * @param pagingVO 
	 * @return
	 */
	public int selectCreatedTotal(String projArchi);
	
	
	
	/**
	 * 본인이 참가한 PMS프로젝트의 페이징 처리를 위한 레코드 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectJoinTotal(String id);
	
	/**
	 * PMS 프로젝트 목록 조회
	 * @param pagingVO
	 * @return 
	 */
	public List<PMSProjectVO> selectPMSProjectList(PagingVO<PMSProjectVO> pagingVO);
	
	/**
	 * PMS 프로젝트 상세조회
	 * @param projId 조회할 프로젝트의 아이디
	 * @return 존재하지 않는 경우, null 반환
	 */
	public PMSProjectVO selectPMSProject(String projId);
	
	/**
	 * PMS 프로젝트 정보 수정
	 * @param PMSProject 수정할 PMS 프로젝트의 정보를 가진 VO
	 * @return 수정한 레크드 수 if >0 : 성공, else : 실패
	 */
	public int updatePMSProject(PMSProjectVO PMSProject);
	
	/**
	 * PMS 프로젝트 삭제
	 * @param projId 삭제할 프로젝트 아이디
	 * @return 삭제한 레코드 수 if > 0: 성공, else : 실패
	 */
	public int deletePMSProject(PMSProjectVO PMSProject);
	
	/**
	 * 본인이 생성한 PMS 프로젝트
	 * @param pagingVO 
	 * @return 본인이 생성한 프로젝트 리스트
	 */
	public List<PMSProjectVO> createdProjectList(String projArchi);
	
	
	
	/**
	 * 프로젝트 참가
	 * @param ProjId 참가하는 프로젝트 아이디
	 * @param id 참가하는 회원 아이디
	 * @return 삭제한 레코드 수 if > 0: 성공, else : 실패
	 */
	public int joinPMSProject(String ProjId, String id);
	
	
	
	/**
	 * 자동 프로젝트 참가
	 * @param involve
	 * @return
	 */
	public int autoJoinPMSProject(List<projInvolveVO> involve);
	
	/**
	 * pms에 자동 추가할 데이터 조회
	 * @param outProjId 자동 추가할 아웃소싱 프로젝트 아이디
	 * @return 계약 상태가 완료인 아웃소싱 프로젝트ID, 지원한 회원 아이디, 프로젝트 이름, 프로젝트 등록자
	 */
	public PMSProjectVO selectOutProjData(String outProjId);
	
	
	/**
	 * pms에 자동으로 참가할 계약 완료된 회원 조회
	 * @param outProjId
	 * @return 아웃소싱 프로젝트에서 계약이 완료된 회원의 아이디
	 */
	public List<projInvolveVO> selectOutProjInvolve(String outProjId);
	
	
	/**
	 * 본인이 참가한 PMS 프로젝트 리스트
	 * @param id 본인의 아이디
	 * @return 본인이 참가한 프로젝트 리스트
	 */
	public List<PMSProjectVO> joinProjectList(PagingVO<PMSProjectVO> pagingVO);
	
	
	
	/**
	 * 이미 참가한 프로젝트인지 확인
	 * @param projId 확인할 프로젝트 아이디
	 * @param id 본인의 아이디
	 * @return
	 */
	public int joinCheck(String projId, String id);
	
}
