package kr.or.ddit.common.community.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.community.dao.CommunityDAO;
import kr.or.ddit.common.community.vo.CommunityReplyVO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.PagingVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityReplyServiceImpl implements CommunityReplyService{

	@Inject
	CommunityDAO dao;
	
	@Override
	public ServiceResult createCmntReply(CommunityReplyVO reply) {
		int rowcnt = dao.insertCmntReply(reply);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyCmntReply(CommunityReplyVO reply) {
		retrieveCmntReply(reply.getRepNo());
		
		int rowcnt = dao.updateCmntReply(reply);
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeCmntReply(int repNo) {
		retrieveCmntReply(repNo);

		int rowcnt = dao.deleteCmntReply(repNo);
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<CommunityReplyVO> retrieveCmntReplyList(Map<String, Object> repMap) {
		PagingVO<CommunityReplyVO> pagingVO = (PagingVO<CommunityReplyVO>) repMap.get("pagingVO");
		pagingVO.setTotalRecord(dao.selectTotalCmntReply(repMap));
		
		List<CommunityReplyVO> repList = dao.selectCmntReplyList(repMap);
		pagingVO.setDataList(repList);
		repMap.put("pagingVO", pagingVO);
		
		return repList;
	}

	@Override
	public CommunityReplyVO retrieveCmntReply(int repNo) {
		CommunityReplyVO reply = dao.selectCmntReply(repNo);
		
		if(reply == null) {
			throw new RuntimeException(String.format("%s는 없는 댓글입니다", repNo));
		}
		
		return reply;
	}

}
