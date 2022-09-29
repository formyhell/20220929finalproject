package kr.or.ddit.common.mypage.memInfo.service;

import java.lang.reflect.InvocationTargetException;

import javax.inject.Inject;

import org.apache.commons.beanutils.BeanUtils;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.dao.MemberDAO;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.memInfo.dao.MemberInfoDAO;
import lombok.extern.slf4j.Slf4j;

@Service("authService")
@Slf4j
public class AuthenticateServiceImpl implements AuthenticateService {
	@Inject
	MemberInfoDAO memberInfoDAO;
	

	@Override
	public ServiceResult authenticate(MemberVO inputData) {
		ServiceResult result = null;
		MemberVO member = memberInfoDAO.selectMemberForAuth(inputData);
		if(member!=null) {
			String inputPass = inputData.getMemPass();
			String savedPass = member.getMemPass();
			inputPass = encoding(inputPass);
			log.info("입력 비밀번호 : ",inputPass);
			log.info("저장 비밀번호 : ",savedPass);
//			if(PasswordUtils.matche(inputPass, savedPass)) {
			if((new StrongPasswordEncryptor()).checkPassword(inputPass, savedPass)) {
				try {
					BeanUtils.copyProperties(inputData, member);
				} catch (IllegalAccessException | InvocationTargetException e) {
					throw new RuntimeException(e);
				}
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.INVALIDPASSWORD;
			}
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}
	public String encoding(String inputPass){
		return new StrongPasswordEncryptor().encryptPassword(inputPass);
	}
}
