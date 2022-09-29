package kr.or.ddit.pms.issue.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.qna.vo.QnaReplyVO;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.issue.vo.IssueReplyVO;
import kr.or.ddit.pms.issue.vo.IssueSolveVO;
import kr.or.ddit.pms.issue.vo.IssueVO;
import kr.or.ddit.pms.project.vo.projInvolveVO;
import kr.or.ddit.pms.work.vo.WorkVO;

public interface IssueService {
	/**
	 * 이슈 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<IssueVO> retrieveIssueList(Map<String, Object> map);
	
	/**
	 * 이슈 상세 조회
	 * @param issue
	 * @return
	 */
	public IssueVO retrieveIssue(String issueId);
	
	/**
	 * 이슈일감
	 * @param projId
	 * @return
	 */
	public List<WorkVO> retrieveWorkList(String projId);
	
	/**
	 * 프로젝트참여자
	 * @param memId
	 * @return
	 */
	public List<projInvolveVO> retrieveProjInvolveList(String projId);
	
	/**
	 * 이슈 등록
	 * @param issue
	 * @return
	 */
	public ServiceResult createIssue(IssueVO issue);
	
	/**
	 * 이슈 수정
	 * @param issue
	 * @return
	 */
	public ServiceResult modifyIssue(IssueVO issue);
	
	/**
	 * 이슈 삭제
	 * @param issue
	 * @return
	 */
	public ServiceResult removeIssue(String issueId);
	
	/**
	 * 이슈 해결
	 * @param solve
	 * @return
	 */
	public ServiceResult createIssueSolve(IssueSolveVO solve);
	
	/**
	 * 이슈 해결 상세조회
	 * @param issueId
	 * @return
	 */
	public IssueSolveVO retrieveIssueSolve(String issueId);
	
	
	
	/**
	 * 참가한 프로젝트에서 본인이 담당자인 이슈
	 * @param pagingVO
	 * @return 참여한 프젝트에서 본인이 담당자인 이슈 목록
	 */
	public List<IssueVO> involveIssueList(PagingVO<IssueVO> pagingVO);
	
	
	/**
	 * 파일 다운로드를 위한 메타데이터 조회
	 * @param attId
	 * @return
	 */
	public AttatchVO issueFileDownload(String attId);
	
	
	/**
	 * 답변 작성
	 * @param reply
	 */
	public ServiceResult createIssueReply(IssueReplyVO reply);
	
	/**
	 * 답변 수정
	 * @param reply
	 */
	public ServiceResult modifyIssueReply(IssueReplyVO reply);
	
	/**
	 * 답변 삭제
	 * @param repNo
	 */
	public ServiceResult removeIssueReply(int repNo);
	
	/**
	 * 댓글 리스트 조회
	 * @param issueId
	 * @return
	 */
	public List<IssueReplyVO> retrieveIssueReplyList(Map<String, Object> map);
	
	/**
	 * 댓글 조회
	 * @param repNo
	 * @return
	 */
	public IssueReplyVO retrieveIssueReply(int repNo);
	

}
