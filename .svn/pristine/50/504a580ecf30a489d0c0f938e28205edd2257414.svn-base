package kr.or.ddit.pms.work.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.CommomCodeVO;
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
@Mapper
public interface WorkDAO {
	
	/**
	 * PMS 일감 정보 등록
	 * @param work
	 * @return 등록한 레코드 수 if > 0 : 성공, else : 실패
	 */
	public int insertWork(WorkVO work);
	
	/**
	 * 일감 페이징 처리를 위한 레코드수 조회
	 * @param pagingVO : 검색조건을 가진 VO
	 * @return
	 */
	public int selectTotalWork(PagingVO<WorkVO> pagingVO);
	
	/**
	 * 일감 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<WorkVO> selectWorkList(PagingVO<WorkVO> pagingVO);
	
	
	/**
	 * 일감의 제목과 아이디 목록 조회
	 * @return 일감의 제목과 아이디 목록
	 */
	public List<WorkVO> selectWorkTiltleList(String workProj);
	
	/**
	 * 일감 상세 조회
	 * @param workId
	 * @return
	 */
	public WorkVO selectWork(WorkVO work);
	
	/**
	 * 일감 정보 수정
	 * @param work 수정할 일감의 정보를 가진 VO
	 * @return 수정한 레크드 수 if >0 : 성공, else : 실패
	 */
	public int updateWork(WorkVO work);
	
	/**
	 * 일감 삭제
	 * @param workId 삭제할 일감 아이디
	 * @return 삭제한 레코드 수 if > 0: 성공, else : 실패
	 */
	public int deleteWork(WorkVO work);
	
	
	
	/**
	 * 간트 차트에 필요한 정보 조회
	 * @param work
	 * @return
	 */
	public List<WorkVO> ganttList(WorkVO work);
	
	
	/**
	 * 참여한 프로젝트에서 본인이 담당하는 일감 목록 조회
	 * @param pagingVO
	 * @return 참여한 프로젝트에서 본인이 담당하는 일감 목록 조회
	 */
	public List<WorkVO> involveWorkList(PagingVO<WorkVO> pagingVO);
	
	
	
	/**
	 * 참여한 프로젝트에서 본인이 담당하는 일감 목록의 수
	 * @param pagingVO
	 * @return
	 */
	public int involveTotal(PagingVO<WorkVO> pagingVO);
	
	// 일감 코드 관련
	
	/**
	 * 일감 유형 코드 리스트
	 * @return
	 */
	public List<CommomCodeVO> selectWorkTypeList();
	
	
	public List<CommomCodeVO> selectWorkPriorityList();
	
	
	public List<CommomCodeVO> selectWorkStateList();
	
	// 파일 업로드 관련
	/**
	 * 일감의 첨부파일 등록
	 * @param work
	 * @return
	 */
	public int insertAttatches(AttatchVO attatch);
	
	/**
	 * 일감첨부파일 등록
	 * @param work
	 * @return
	 */
	public int insertWorkAttatch(WorkVO work);
	
	/**
	 * 첨부파일 한건의 메타데이터 조회
	 * @param attId
	 * @return
	 */
	public AttatchVO selectAttatch(String attId);
	/**
	 * 한건의 첨부파일 메타데이터 삭제
	 * @param attId
	 * @return
	 */
	public int deleteAttatch(String attId);
	
	
	/**
	 * 여러개의 첨부파일 메타데이터 삭제
	 * @param work
	 * @return
	 */
//	public int deleteAttatche(WorkVO work);


	public int deleteWorkAttatches(WorkVO work);
	public int deleteAttatches(WorkVO work);
	
	
	
	
	// 파일 가져오는거 만들어야함
	/**
	 * 일감 파일 리스트 가져오기
	 * @param work
	 * @return
	 */
	public List<AttatchVO> selectWorkFileList(WorkVO work);
	
	
	
	// 댓글 관련
	/**
	 * 댓글 등록
	 * @param reply
	 * @return
	 */
	public int insertWorkReply(WorkReplyVO reply);
	
	/**
	 * 댓글 수정
	 * @param reply
	 * @return
	 */
	public int updateWorkReply(WorkReplyVO reply);
	
	/**
	 * 댓글 삭제
	 * @param repNo
	 * @return
	 */
	public int deleteWorkReply(int repNo);
	
	/**
	 * 페이징을 위한 레코드 수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalWorkReply(Map<String, Object> map);
	
	/**
	 * 댓글 리스트 조회
	 * @param issueId
	 * @return
	 */
	public List<WorkReplyVO> selectWorkReplyList(Map<String, Object> map);
	
	/**
	 * 댓글 조회
	 * @param repNo
	 * @return
	 */
	public WorkReplyVO selectWorkReply(int repNo);
	
}












