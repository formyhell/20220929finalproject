package kr.or.ddit.common.qna.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.qna.dao.QnaDAO;
import kr.or.ddit.common.qna.dao.QnaReplyDAO;
import kr.or.ddit.common.qna.vo.QnaReplyVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaReplyServiceImpl implements QnaReplyService{
	
	@Inject
	private QnaReplyDAO repDao;
	
	@Inject
	private QnaDAO qnaDao;
	
	@Transactional
	@Override
	public ServiceResult createReply(QnaReplyVO reply) {
		int rowcnt = repDao.insertQReply(reply);
		rowcnt += qnaDao.updateRep(reply.getRepParent());
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyReply(QnaReplyVO reply) {
		int rowcnt = repDao.updateQReply(reply);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeReply(int repNo) {
		int rowcnt = repDao.deleteQReply(repNo);
		rowcnt += qnaDao.deleteRep(repNo);
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public QnaReplyVO reply(int repParent) {
		QnaReplyVO rep = repDao.selectQReply(repParent);
		
//		if(rep == null) {
//			throw new RuntimeException("답변이 없습니다");
//		}
		
		return rep;
	}
	

}
