package kr.or.ddit.common.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.service.MemService;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.mypage.memInfo.service.PWService;

@Controller
@RequestMapping("/member/find")
public class FindController {

	@Inject
	MemService service;
	
	@Inject
	PWService pwSercive;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	//아이디 찾기 폼
	@GetMapping("ID")
	public String findId() {
		return "common/member/findIdForm";
	}
	
	@ResponseBody
	@PostMapping("genId")
	public String genId( @RequestBody GenMemberVO genMember ) {
		String genId = service.findGenId(genMember);
		
		return genId;
	}
	
	@ResponseBody
	@PostMapping("comId")
	public String comId( @RequestBody ComMemberVO comMember ) {
		String comId = service.findComId(comMember);
		
		return comId;
	}
	
	@GetMapping("password")
	public String findPass() {
		return "common/member/findPassForm";
	}
	
	@Transactional
	@ResponseBody
	@PostMapping("genPass")
	public String genPass(
			@RequestBody GenMemberVO genMember
	) {
		ServiceResult result = service.findGenPass(genMember);
		Map<String, Object> pwMap = new HashMap<>();
		pwMap.put("memId", genMember.getGenId());
		
		String message = "";
		switch (result) {
		case OK:
			String newPass = sendMail(genMember.getGenMail());
			pwMap.put("newPass", newPass);
			
			int comPw = pwSercive.findGenPw(pwMap);
			if(comPw > 0) {
				message = "ok";
			} else {
				message = "no";
			}
			
			message = "ok";
			break;

		default:
			message = "no";
			break;
		}
		return message;
	}
	
	@Transactional
	@ResponseBody
	@PostMapping("comPass")
	public String comPass(
			@RequestBody ComMemberVO comMember
	) {
		ServiceResult result = service.findComPass(comMember);
		Map<String, Object> pwMap = new HashMap<>();
		pwMap.put("memId", comMember.getComId());
		
		String message = "";
		switch (result) {
		case OK:
			String newPass = sendMail(comMember.getComMail());
			pwMap.put("newPass", newPass);
			
			int comPw = pwSercive.findComPw(pwMap);
			if(comPw > 0) {
				message = "ok";
			} else {
				message = "no";
			}
			
			break;

		default:
			message = "no";
			break;
		}
		return message;
	}
	
	private String sendMail(String mail) {
		String uuid = UUID.randomUUID().toString();
		String random = uuid.substring(5,18);
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8"); //true는 멀티파트 메일 사용
				helper.setFrom("PHOS<hhhi007561@gmail.com>");
				helper.setTo(mail);
				helper.setSubject("PHOS에서 보내드리는 임시 비밀번호 입니다");
				helper.setText(String.format("임시 비밀번호는 %s입니다", random));
				
			}
		};
		mailSender.send(preparator);
		
		return random;
	}
	
	
}
