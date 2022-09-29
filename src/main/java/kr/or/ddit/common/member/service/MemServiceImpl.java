package kr.or.ddit.common.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import kr.or.ddit.common.alert.dao.AlertDAO;
import kr.or.ddit.common.alert.vo.AlertVO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.dao.MemDAO;
import kr.or.ddit.common.member.dao.MemberDAO;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 김유진
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.       김유진              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
public class MemServiceImpl implements MemService {
	@Inject
	MemDAO memDao;
	@Inject
	MemberDAO memberDao;
	@Inject
	AlertDAO alertDao;
	
	@Inject
	public void setMemberDao(MemDAO memberDao) {
		this.memDao = memberDao;
	}

	ServiceResult result = null;
	
	private void createAlert(String memId, String memName) {
		AlertVO alert = new AlertVO();
		alert.setAlertContent(memName+"님 PHOS 회원가입을 축하드립니다!!");
		alert.setAlertReceiver(memId);
		alert.setAlertUrl("#");
		alertDao.insertAlert(alert);
	}
	
	// 일반회원가입
	@Override
	public ServiceResult createGenMember(GenMemberVO genMember) {
		if(memberDao.selectMember(genMember.getGenId())==null) { //이미 있는 회원인지 확인	
			int rowcnt = memDao.insertGenMember(genMember);
			if(rowcnt>0) {
				result = ServiceResult.OK;
				createAlert(genMember.getGenId(), genMember.getGenName());
			}else {
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		return result;	
	}

	// 기업회원가입
	@Override
	public ServiceResult createComMember(ComMemberVO comMember) {
		if(memberDao.selectMember(comMember.getComId())==null) { //이미 있는 회원인지 확인	
			int rowcnt = memDao.insertComMember(comMember);
			if(rowcnt>0) {
				result = ServiceResult.OK;
				createAlert(comMember.getComId(),comMember.getComName());
			}else {
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		return result;	
	}

	@Override
	public String findGenId(GenMemberVO genMember) {
		String findGenId = memDao.findGenId(genMember);
		
		if(findGenId == null) {
			findGenId = "error";
		}
		
		return findGenId;
	}

	@Override
	public String findComId(ComMemberVO comMember) {
		String findComId = memDao.findComId(comMember);
		
		if(findComId == null) {
			findComId = "error";
		}
		
		return findComId;
	}

	@Override
	public ServiceResult findGenPass(GenMemberVO genMember) {
		int cnt = memDao.findGenPass(genMember);
		return cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult findComPass(ComMemberVO comMember) {
		int cnt = memDao.findComPass(comMember);
		return cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}


}
