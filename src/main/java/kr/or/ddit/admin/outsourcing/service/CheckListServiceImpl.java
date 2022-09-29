package kr.or.ddit.admin.outsourcing.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.admin.outsourcing.dao.CheckListDAO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


/**
 * @author 조채원
 * @since 2022. 8. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 8.    조채원      			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CheckListServiceImpl implements CheckListService {
	private final CheckListDAO checkDao;
	
	@Override
	public List<OutProjVO> findAll(PagingVO<OutProjVO> pagingVO) {
		pagingVO.setTotalRecord(checkDao.selectTotalProj(pagingVO));
		List<OutProjVO> projList = checkDao.selectAll(pagingVO);
		pagingVO.setDataList(projList);
		return projList;
	}
	
	@Override
	public List<OutProjVO> findRequireAll() {
		return checkDao.selectRequireAll();
	}

	@Transactional
	@Override
	public ServiceResult remove(OutProjVO outProj) {
		if(outProj==null) {
			throw new RuntimeException(String.format("%s에 해당하는 프로젝트가 없습니다.", outProj.getProjId()));
		} 
		if(outProj.getProjReject().isEmpty() || outProj.getProjReject() == null) {
			return ServiceResult.FAIL; 
		} else {
			checkDao.updateDeny(outProj);
			return ServiceResult.OK;
		}
	}

	@Override
	public OutProjVO findById(String projId) {
		OutProjVO saveProj = checkDao.selectProj(projId);
		if(saveProj==null) {
			throw new RuntimeException(String.format("%s에 해당하는 프로젝트가 없습니다.", projId));
		}
		return saveProj;
	}

	@Transactional
	@Override
	public ServiceResult update(String projId) {
		OutProjVO saveProj = checkDao.selectProj(projId);
		ServiceResult result = null;
		if(saveProj==null) {
			throw new RuntimeException(String.format("%s에 해당하는 프로젝트가 없습니다.", projId));
		} 
		int rowcnt = checkDao.updateApprove(saveProj);
		
		if(rowcnt > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
			return result;
		
	}

	@Transactional
	@Override
	public ServiceResult removeRuquire(OutProjVO outProj) {
		OutProjVO saveProj = checkDao.selectProj(outProj.getProjId());
		if(saveProj==null) {
			throw new RuntimeException(String.format("%s에 해당하는 프로젝트가 없습니다.", outProj.getProjId()));
		} 
		if(outProj.getProjReject().isEmpty() || outProj.getProjReject() == null) {
			return ServiceResult.FAIL; 
		} else {
			checkDao.updateDeny(outProj);
			checkDao.deleteRequireCheck(outProj.getProjId());
			return ServiceResult.OK;
		}
	}

	@Transactional
	@Override
	public ServiceResult updateRequire(OutProjVO outProj) {
		OutProjVO saveProj = checkDao.selectProj(outProj.getProjId());
		if(saveProj==null) {
			throw new RuntimeException(String.format("%s에 해당하는 프로젝트가 없습니다.", outProj.getProjId()));
		} 
		if(saveProj.getProjApprove() == 2 || saveProj.getProjApprove() == 1) {
			return ServiceResult.FAIL; 
		} else {
			checkDao.updateApprove(saveProj);
			checkDao.deleteRequireCheck(outProj.getProjId());
			return ServiceResult.OK;
		}
	}

	//  아웃소싱 리스트
	@Override
	public List<OutProjVO> findApproveAll(PagingVO<OutProjVO> pagingVO) {
		int totalRecord = checkDao.selectApproveAllCount();
		pagingVO.setTotalRecord(totalRecord);
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("pagingVO", pagingVO);
		List<OutProjVO> list = checkDao.selectApproveAll(pagingMap);
		pagingVO.setDataList(list);
		return list;
	}

	@Override
	public List<OutProjVO> findNotApproveAll(PagingVO<OutProjVO> pagingVO) {
		int totalRecord = checkDao.selectNotApproveAllCount();
		pagingVO.setTotalRecord(totalRecord);
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("pagingVO", pagingVO);
		List<OutProjVO> list = checkDao.selectNotApproveAll(pagingMap);
		pagingVO.setDataList(list);
		return list;
	}

	
}
