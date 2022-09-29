package kr.or.ddit.pms.work.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.work.vo.WorkReplyVO;
import kr.or.ddit.pms.work.vo.WorkVO;

/**
 * @author 작성자명
 * @since 2022. 8. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 16.      홍승조       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface WorkService {
	
	/**
	 * 일감 등록
	 * @param work
	 * @return OK, FAIL
	 */
	public ServiceResult createWork(WorkVO work);
	
	/**
	 * 일감 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<WorkVO> rertieveWorkList(PagingVO<WorkVO> pagingVO);
	
	/**
	 * 일감 상세조회
	 * @param workId
	 * @return 존재하지 않으면, {@link PKNotFoundException} 발생
	 */
	public WorkVO retrieveWork(WorkVO work);
	
	/**
	 * 일감 수정
	 * @param work
	 * @return {@link PKNotFoundException}, OK, FAIL
	 */
	public ServiceResult modifyWork(WorkVO work);
	
	/**
	 * 일감 삭제
	 * @param work
	 * @return {@link PKNotFoundException}, OK, FAIL
	 */
	public ServiceResult deleteWork(WorkVO work);
	
	
	/**
	 * 상위 일감 조회
	 * @return 일감의 아이디와 제목 목록
	 */
	public List<WorkVO> parentWork(String workProj);
	
	
	/**
	 * 간트 차트 일감 조회
	 * @param work 검색 조건들
	 * @return 일감 목록
	 */
	public List<WorkVO> ganttWork(WorkVO work);
	
	
	/**
	 * 참가한 프로젝트에서 본인이 등록한 일감들
	 * @param pagingVO
	 * @return 본인이 참여한 프로젝트에 본인이 등록한 일감 목록
	 */
	public List<WorkVO> involveWorkList(PagingVO<WorkVO> pagingVO);
	
	
	/**
	 * 파일 다운로드를 위한 메타데이터 조회
	 * @param attId
	 * @return
	 */
	public AttatchVO workFileDownload(String attId);
	
	
	
	
	// 댓글
	/**
	 * 댓글 등록
	 * @param reply
	 * @return
	 */
	public ServiceResult createWorkReply(WorkReplyVO reply);
	
	/**
	 * 댓글 수정
	 * @param reply
	 * @return
	 */
	public ServiceResult modifyWorkReply(WorkReplyVO reply);
	
	/**
	 * 댓글 삭제
	 * @param repNo
	 * @return
	 */
	public ServiceResult removeWorkReply(int repNo);
	
	/**
	 * 댓글 리스트 조회
	 * @param issueId
	 * @return
	 */
	public List<WorkReplyVO> retrieveWorkReplyList(Map<String, Object> map);
	
	/**
	 * 댓글 조회
	 * @param repNo
	 * @return
	 */
	public WorkReplyVO retrieveWorkReply(int repNo);
	
	
}
