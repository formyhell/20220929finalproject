package kr.or.ddit.common.mypage.memInfo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.memInfo.service.MemInfoService;
import kr.or.ddit.common.mypage.memInfo.service.PWService;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 작성자명
 * @since 2022. 8. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 3.      홍승조       기업회원 정보
 * 2022. 8. 4.      홍승조       update delete url 연결
 * 2022. 8. 6.      윤지영      		  url 재연결
 * 2022. 8. 9.      윤지영,신창규        url 수정
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@Slf4j
@RequestMapping("/com/myinfo")
public class ComMemInfo {
	
	@Inject
	MemInfoService service;
	
	@Inject
	PWService pservice;	
	
	
	//비밀번호 변경
		@GetMapping("changePW")
		public String memPW() {
			return "common/mypage/com/myinfo";
		}
		
		@PostMapping("changePW")
		public String changePW(
			Authentication authentication
			, @RequestParam String inputPass
			, @RequestParam String newPass
			, RedirectAttributes redirectAttributes
		) {
			String memId = authentication.getName();
			String viewName = "redirect:/com/myinfo";
			Map<String, Object> map = new HashMap<>();
			Map<String, Object> resultMap = new HashMap<>();
			
			map.put("memId", memId);
			map.put("inputPass", inputPass);
			map.put("newPass", newPass);
			
			log.info("원래 비번: ", inputPass, "newPass: " ,newPass ,"@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
			ServiceResult result = pservice.modifyComPW(map);
			switch (result) {
			case INVALIDPASSWORD:
				resultMap.put("result", false);
				resultMap.put("message", "비밀번호를 다시 확인해주세요.");
				break;
			case FAIL:
				resultMap.put("result", false);
				resultMap.put("message", "다시 시도해주세요.");
				break;

			default:
				resultMap.put("result", true);
				resultMap.put("message", "비밀번호가 변경되었습니다.");
				break;
			}
			redirectAttributes.addFlashAttribute("resultMap", resultMap);
			return viewName;
		}
	
	
	@GetMapping
	public String comMemInfoView(Authentication authentication, Model model) {
		String comId = authentication.getName();
		
		ComMemberVO comMember = service.retrieveComMemInfo(comId);
		model.addAttribute("comMember", comMember);
		
		return "common/mypage/com/comInfoView";
	}
	
	
		
	//기업회원
		@GetMapping("{memId}/form")
		public String comMemberEdit(
				@PathVariable String memId
				, ComMemberVO principal
				, Model model
				) {
			ComMemberVO comMember = service.retrieveComMemInfo(memId);
			model.addAttribute("comMember", comMember);
			return "common/mypage/com/comMemEdit";
		}
		
		//기업회원 회원전보 수정
		@PostMapping("{memId}")
		public String comMemberUpdate(
				@PathVariable String memId
				, RedirectAttributes redirectAttributes
				, SessionStatus sessionStatus
				, Model model
				, @ModelAttribute("comMember") ComMemberVO comMember //얘("")가 ObjectName
				, Errors errors
				) {
			String viewName = null;
			if(!errors.hasErrors()) {
				ServiceResult result = service.modifyComMember(comMember);
				switch (result) {
				case FAIL:
					model.addAttribute("message", "서버 오류");
					viewName = "common/mypage/com/comMemEdit";
					break;
				default:
					viewName = "redirect:/com/myinfo";
					break;
				}
			}else {
				viewName = "common/mypage/com/comMemEdit";
			}
			return viewName;		
		}	
		
		@PostMapping("comdel/{memId}")
		public String comMemDelete(
				@RequestParam(value="password", required=false) String password
				, Authentication authentication
				, RedirectAttributes redirectAttributes
				, HttpSession session
				) {
			
			log.info(password+"비빌번호~~~~~~~~~~~~~~~~~~~~~~~~");
//			MemberVO principal = ((MemberPrincipal)authentication.getPrincipal()).getRealMember();
			MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
			MemberVO member = userPrincipal.getRealMember();
			
			
			
			log.info("컨트롤러까지 와라~");
//			member.setMemPass(password);
//			String ipass = passEncoder.encode(password);
			String ipass = password;
			ServiceResult result = service.deleteComMember(member,ipass);
			
			
			String viewName = null;
			switch (result) {
			case INVALIDPASSWORD:
				redirectAttributes.addFlashAttribute("message", "비번 오류");
				viewName = "common/mypage/com/infoView";
				break;
			case FAIL:
				redirectAttributes.addFlashAttribute("message", "서버 오류");
				viewName = "common/mypage/com/infoView";
				break;

			default:
				session.invalidate();
				viewName = "redirect:/";
				break;
			}
			return viewName;
		}
		
	}
