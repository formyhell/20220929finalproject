package kr.or.ddit.pms.issue.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.mypage.schedule.vo.ScheduleVO;
import kr.or.ddit.common.qna.vo.QnaReplyVO;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.issue.vo.IssueReplyVO;
import kr.or.ddit.pms.issue.vo.IssueSolveVO;
import kr.or.ddit.pms.issue.vo.IssueVO;
import kr.or.ddit.pms.project.vo.projInvolveVO;
import kr.or.ddit.pms.work.vo.WorkVO;

@Mapper
public interface IssueDAO {
	/**
	 * 페이징을 위한 레코드 수 조회
	 * @param map
	 * @return
	 */
	public int selectTotalIssue(Map<String, Object> map);
	
	/**
	 * 이슈 목록 조회
	 * @param map
	 * @return
	 */
	public List<IssueVO> selectIssueList(Map<String, Object> map);
	
	/**
	 * 이슈 상세 조회
	 * @param issueId
	 * @return
	 */
	public IssueVO selectIssue(String issueId);
	
	/**
	 *  이슈유형, 이슈중요도, 일감의 관리자, 담당자 이름
	 */
	public List<Map<String, Object>> selectIssueTypeList();
	public List<Map<String, Object>> selectIssueImportList();
	public Map<String, Object> selectWorkName(Map<String, Object> map);

	/**
	 * 이슈일감
	 * @param projId
	 * @return
	 */
	public List<WorkVO> selectWorkList(String projId);
	
	/**
	 * 프로젝트참여자
	 * @param projId
	 * @return
	 */
	public List<projInvolveVO> selectProjInvolveList(String projId);
	
	/**
	 * 이슈 등록
	 * @param issue
	 * @return
	 */
	public int insertIssue(IssueVO issue);
	
	/**
	 * 이슈 수정
	 * @param issue
	 * @return
	 */
	public int updateIssue(IssueVO issue);
	
	/**
	 * 이슈 삭제
	 * @param issueId
	 * @return
	 */
	public int deleteIssue(String issueId);
	
	/**
	 * 이슈 해결 , 상태변화
	 * @param issue
	 * @return
	 */
	public int insertIssueSolve(IssueSolveVO solve);
	public int updateIssueState(String issueId);
	
	/**
	 * 이슈 해결 상세 조회
	 * @param issueId
	 * @return
	 */
	public IssueSolveVO selectIssueSolve(String issueId);
	
	
	/**
	 * 이슈의 첨부파일 등록
	 * @param attatch
	 * @return
	 */
	public int insertAttatches(AttatchVO attatch);
	
	/**
	 * 이슈첨부파일 등록
	 * @param issue
	 * @return
	 */
	public int insertIssueAttatch(IssueVO issue);
	
	/**
	 * 첨부파일 한건의 메타데이터 조회
	 * @param attId
	 * @return
	 */
	public AttatchVO selectAttatch(String attId);

	/**
	 * 여러개의 첨부파일 메타데이터 삭제
	 * @param issue
	 * @return
	 */
	public int deleteIssueAttatches(IssueVO issue);
	public int deleteAttatches(IssueVO issue);
	
	/**
	 * 파일 리스트 가져오기
	 * @param issue
	 * @return
	 */
	public List<AttatchVO> selectIssueFileList(IssueVO issue);
	
	/**
	 * 댓글 등록
	 * @param reply
	 * @return
	 */
	public int insertIssueReply(IssueReplyVO reply);
	
	/**
	 * 댓글 수정
	 * @param reply
	 * @return
	 */
	public int updateIssueReply(IssueReplyVO reply);
	
	/**
	 * 댓글 삭제
	 * @param repNo
	 * @return
	 */
	public int deleteIssueReply(int repNo);
	
	/**
	 * 페이징을 위한 레코드 수 조회
	 * @param map
	 * @return
	 */
	public int selectTotalIssueReply(Map<String, Object> map);
	
	/**
	 * 댓글 리스트 조회
	 * @param map
	 * @return
	 */
	public List<IssueReplyVO> selectIssueReplyList(Map<String, Object> map);
	
	/**
	 * 댓글 조회
	 * @param repNo
	 * @return
	 */
	public IssueReplyVO selectIssueReply(int repNo);
	
	
	
	/**
	 * 참여한 포로젝트에서 본인이 담장자인 이슈의 수
	 * @param pagingVO
	 * @return
	 */
	public int involveIssueTotal(PagingVO<IssueVO> pagingVO);
	
	
	
	/**
	 * 참여한 프로젝트에서 본인이 담당자인 이슈의 목록
	 * @param pagingVO
	 * @return 참여한 프로젝트에서 본인이 담당자인 이슈의 목록
	 */
	public List<IssueVO> involveIssueList(PagingVO<IssueVO> pagingVO);
	
}
