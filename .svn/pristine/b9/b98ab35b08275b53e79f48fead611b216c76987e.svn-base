package kr.or.ddit.admin.pms.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.admin.pms.dao.AdminPmsDAO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.project.vo.PMSProjectVO;

@Service
public class AdminPmsServiceImpl implements AdminPmsService{

	@Inject
	AdminPmsDAO dao;
	
	// pms 목록 조회
	@Override
	public List<PMSProjectVO> retrievePmsList(Map<String, Object> map) {
		PagingVO<PMSProjectVO> pagingVO = (PagingVO<PMSProjectVO>) map.get("pagingVO");
		pagingVO.setTotalRecord(dao.selectTotalPms(map));
		List<PMSProjectVO> pmsList = dao.selectPmsList(map);
		
		pagingVO.setDataList(pmsList);
		map.put("pagingVO", pagingVO);
		
		return pmsList;
	}

	@Override
	public ServiceResult modifyPms(PMSProjectVO pms) {
		PMSProjectVO saved = dao.selectPms(pms.getProjId());
		if(saved==null)
			throw new RuntimeException(String.format("%d pms 프로젝트 없음.",pms.getProjId()));
		int rowcnt = dao.updatePms(pms);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
