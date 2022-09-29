package kr.or.ddit.common.notice.service;

import java.util.List;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.notice.vo.NoticeVO;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.PagingVO;

public interface NoticeService {

	/**
	 * 공지사항 등록
	 * @param notice
	 * @return
	 */
	public ServiceResult createNotice(NoticeVO notice);
	
	/**
	 * 공지사항 수정
	 * @param notice
	 * @return
	 */
	public ServiceResult modifyNotice(NoticeVO notice);
	
	/**
	 * 공지사항 삭제
	 * @param notice
	 * @return
	 */
	public ServiceResult removeNotice(NoticeVO notice);
	
	/**
	 * 공지사항 전체조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoticeVO> findAllNotice(PagingVO<NoticeVO> pagingVO);
	
	/**
	 * 관리자 공지사항 전체조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoticeVO> adminFindAllNotice(PagingVO<NoticeVO> pagingVO);
	
	/**
	 * 공지사항 상세조회
	 * @param notNo
	 * @return
	 */
	public NoticeVO retrieveNotice(int notNo);
	
	/**
	 * 파일 다운로드를 위한 메타 데이터 조회
	 * @param attId
	 * @return
	 */
	public AttatchVO downloadNotice(String attId);
	
	/**
	 * 공지 작성 시 공지 제목, 번호 리스트 가져옴
	 * @return
	 */
	public List<NoticeVO> parentNotice();
	
}
