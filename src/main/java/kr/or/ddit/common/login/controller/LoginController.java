package kr.or.ddit.common.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 신창규
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 2.      306-06       최초작성
 * 2022. 8. 4.      홍승조              메인페이지로 연결
 * 2022. 8. 6.      윤지영              로그인페이지 연결
 * 2022. 8. 9.      김유진              "/login/admin" 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String logIn() {
		return "common/member/logInForm";
	}
	
	@RequestMapping("/login/admin")
	public String adminLogIn() {
		return "logInForm";
	}

	@RequestMapping("/logout")
	public String logOut() {
		return "index";
	}
}
