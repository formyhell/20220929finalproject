package kr.or.ddit.admin.pms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.admin.pms.service.AdminPmsService;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import kr.or.ddit.pms.issue.vo.IssueVO;
import kr.or.ddit.pms.project.vo.PMSProjectVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 작성자명
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 2.      홍승조       컨트롤러 생성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/admin/pms")
public class AdminPmsController {
	
	@Inject
	AdminPmsService service;
	
	@ModelAttribute("simpleCondition")
	public SimpleSearchCondition simpleCondition() {
		return new SimpleSearchCondition();
	}

	@GetMapping
	public String AdminPmsList(
		@RequestParam(name="page", required=false, defaultValue="1")int currentPage	
		, @RequestParam(value="projState", required=false)String projState
		, @RequestParam(value="searchType", required=false)String searchType
		, @RequestParam(value="searchWord", required=false)String searchWord
		, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
		,Model model		
	) {
		PagingVO<PMSProjectVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagingVO", pagingVO);
		if(projState!=null && !projState.isEmpty()) {
			map.put("projState", projState);
		}
		service.retrievePmsList(map);
		model.addAttribute("pagingVO",pagingVO);
		model.addAttribute("projState",projState);
		
		return "admin/pms";
	}
	
	@PutMapping
	public String updatePmsState(
		Authentication authentication
		, @ModelAttribute("pms") PMSProjectVO pms
		, RedirectAttributes redirectAttributes
	) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		String memType = member.getMemType().get(0);
		String rst = "false";
		
		if("ROLE_ADMIN".equals(memType)) {
			ServiceResult result = service.modifyPms(pms);
			switch(result) {
			case FAIL:
				redirectAttributes.addFlashAttribute("message", "상태 변경에 실패했습니다.");
				break;
			default:
				redirectAttributes.addFlashAttribute("message", "상태 변경에 성공했습니다.");
				rst = "true";
				break;
			}
		}
		redirectAttributes.addFlashAttribute("rst", rst);
		return "redirect:/admin/pms";
	}
	
	
}
