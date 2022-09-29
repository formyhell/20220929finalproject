package kr.or.ddit.common.member.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class MemberPrincipal extends User{
	private MemberVO realMember;

	public MemberPrincipal(MemberVO realMember) {
		super(realMember.getMemId(), realMember.getMemPass(), 
					AuthorityUtils.createAuthorityList(realMember.getMemType().toArray(new String[realMember.getMemType().size()])));
		this.realMember = realMember;
	}
	
	public MemberVO getRealMember() {
		return realMember;
	}
}
