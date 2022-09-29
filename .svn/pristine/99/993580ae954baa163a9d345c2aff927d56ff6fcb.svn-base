package kr.or.ddit.common.member.service;

import javax.annotation.Resource;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.member.dao.MemberDAO;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("memberServiceImpl")
@RequiredArgsConstructor
public class MemberServiceImpl implements UserDetailsManager {
	
	private final MemberDAO dao;
	
	@Resource(name="authenticationManager")
	private AuthenticationManager authenticationManager; //인증 관리자
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO realMember = dao.selectMember(username);
		log.info("realMember : " + realMember);
		if(realMember==null)
			throw new UsernameNotFoundException(username+" 사용자 없음.");
		
		return new MemberPrincipal(realMember);
	}

	@Override
	public void createUser(UserDetails user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(UserDetails user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(String username) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void changePassword(String oldPassword, String newPassword) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean userExists(String username) {
		// TODO Auto-generated method stub
		return false;
	}


}
