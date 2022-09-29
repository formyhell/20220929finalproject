package kr.or.ddit.common.member.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomAccessDeniedController {
	
	@GetMapping("/accessError")
	public String accessDenied(Authentication authentication, Model model) {
		//Authentication타입의 파라미터를 받도록 설계해서 필요한 경우 사용자의 정보를 확인할 수 있도록 함
		log.info("access Denied : "+authentication);
		model.addAttribute("msg","Access Denied");
		
		return "common/member/accessError";
	}

}
