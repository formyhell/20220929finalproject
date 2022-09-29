package kr.or.ddit.common.mypage.memInfo.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.mypage.memInfo.dao.MemberInfoDAO;
import kr.or.ddit.common.mypage.memInfo.dao.PWDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PWServiceImpl implements PWService{
	
	@Inject
	PasswordEncoder passEncoder;
	@Inject
	MemberInfoDAO memberInfoDAO;
	@Inject
	PWDAO dao;

	//일반회원
	@Override
	public ServiceResult modifyGenPW(Map<String, Object> map) {
		String memId = (String) map.get("memId");
		String inputPass = (String) map.get("inputPass");
		String newPass = (String) map.get("newPass");
		ServiceResult result = null;
		
		log.info("inputPass: {}", inputPass);
		log.info("newPass: {}", newPass);
		
		// 저장된 비밀번호
		GenMemberVO genMem = memberInfoDAO.selectGenMem(memId);
		String savePass = genMem.getGenPass();
		
		// 새 비밀번호
		newPass = passEncoder.encode(newPass);
		
		if (passEncoder.matches(inputPass, savePass)) {
			Map<String, Object> genMap = new HashMap<>();
			genMap.put("memId", memId);
			genMap.put("newPass", newPass);
			int rowcnt = dao.updateGenPW(genMap);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	//기업회원
	@Override
	public ServiceResult modifyComPW(Map<String, Object> map) {
		String memId = (String) map.get("memId");
		String inputPass = (String) map.get("inputPass");
		String newPass = (String) map.get("newPass");
		ServiceResult result = null;
		
		log.info("inputPass: {}", inputPass);
		log.info("newPass: {}", newPass);
		
		// 저장된 비밀번호
		ComMemberVO comMem = memberInfoDAO.selectComMem(memId);
		String savePass = comMem.getComPass();
		
		// 새 비밀번호
		newPass = passEncoder.encode(newPass);
		
		if (passEncoder.matches(inputPass, savePass)) {
			Map<String, Object> comMap = new HashMap<>();
			comMap.put("memId", memId);
			comMap.put("newPass", newPass);
			int rowcnt = dao.updateComPW(comMap);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	@Override
	public int findGenPw(Map<String, Object> map) {
		String memId = (String) map.get("memId");
		String newPass = (String) map.get("newPass");
		ServiceResult result = null;

		log.info("newPass: {}", newPass);

		// 새 비밀번호
		newPass = passEncoder.encode(newPass);

		Map<String, Object> genMap = new HashMap<>();
		genMap.put("memId", memId);
		genMap.put("newPass", newPass);
		int rowcnt = dao.updateGenPW(genMap);
		
		return rowcnt;
	}

	@Override
	public int findComPw(Map<String, Object> map) {
		String memId = (String) map.get("memId");
		String newPass = (String) map.get("newPass");
		ServiceResult result = null;
		
		log.info("newPass: {}", newPass);
		
		// 새 비밀번호
		newPass = passEncoder.encode(newPass);

		Map<String, Object> comMap = new HashMap<>();
		comMap.put("memId", memId);
		comMap.put("newPass", newPass);
		int rowcnt = dao.updateComPW(comMap);
		
		return rowcnt;
	}

}
