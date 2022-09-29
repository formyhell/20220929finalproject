package kr.or.ddit.admin.member.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.admin.member.dao.AdminMemberDAO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.mypage.memInfo.dao.MemberInfoDAO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.issue.vo.IssueVO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{

	@Inject
	AdminMemberDAO dao;
	@Inject
	MemberInfoDAO memDao;

	@Override
	public List<Map<String, Object>> retrieveMemList(Map<String, Object> map) {
		PagingVO<Map<String,Object>> pagingVO = (PagingVO<Map<String,Object>>) map.get("pagingVO");
		pagingVO.setTotalRecord(dao.selectTotalMem(map));
		List<Map<String,Object>> memList = dao.selectMemList(map);
		pagingVO.setDataList(memList);
		map.put("pagingVO", pagingVO);
		return memList;
	}

	@Override
	public ServiceResult modifyDisGenMem(String memId) {
		GenMemberVO genMem = memDao.selectGenMem(memId);
		if(genMem==null)
			throw new RuntimeException(String.format("%d 일반회원 없음.",memId));
		int rowcnt = dao.updateDisGenMem(memId);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyDisComMem(String memId) {
		ComMemberVO comMem = memDao.selectComMem(memId);
		if(comMem==null)
			throw new RuntimeException(String.format("%d 기업회원 없음.",memId));
		int rowcnt = dao.updateDisComMem(memId);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyEnGenMem(String memId) {
		GenMemberVO genMem = memDao.selectGenMem(memId);
		if(genMem==null)
			throw new RuntimeException(String.format("%d 일반회원 없음.",memId));
		int rowcnt = 0;
		if(genMem.getGenDelete()==0) {
			rowcnt = dao.updateEnGenMem(memId);
		}
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyEnComMem(String memId) {
		ComMemberVO comMem = memDao.selectComMem(memId);
		if(comMem==null)
			throw new RuntimeException(String.format("%d 기업회원 없음.",memId));
		int rowcnt = 0;
		if(comMem.getComDelete()==0) {
			rowcnt = dao.updateEnComMem(memId);
		}
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
