package kr.or.ddit.common.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findPass")
public class FindPassController {

	@GetMapping
	public String findId() {
		return "common/member/findPassForm";
	}
}
