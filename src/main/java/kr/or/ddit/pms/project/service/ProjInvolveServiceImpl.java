package kr.or.ddit.pms.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.pms.project.dao.ProjInvolveDAO;
import kr.or.ddit.pms.project.vo.projInvolveVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProjInvolveServiceImpl implements ProjInvolveService{

	@Inject
	ProjInvolveDAO projInvolveDAO;
	
	@Override
	public List<projInvolveVO> retrieveProjInvolveList(String projId) {
		
		List<projInvolveVO> projInvolveList = projInvolveDAO.selectProjInvolveList(projId);
		
		
		return projInvolveList;
	}

	
	// pms에 참여한 인원 역할 부여하기
	@Override
	public ServiceResult updateRole(projInvolveVO involve) {
		
		log.info("이제 역할 업데이트 합니다!!!!!!!");
		int rowcnt = projInvolveDAO.updateRole(involve);
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
