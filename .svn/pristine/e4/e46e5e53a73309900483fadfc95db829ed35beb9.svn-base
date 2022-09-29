package kr.or.ddit.common.mypage.project.rejectProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.project.rejectProject.service.RejectProjService;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 9. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                     수정자               	수정내용
 * --------     --------    ----------------------
 * 2022. 9. 7.     조채원      		 최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/myinfo/rejectProj")
public class RejectProjController {
	@Inject
	RejectProjService service;
	
	@ModelAttribute("simpleCondition")
	public SimpleSearchCondition simpleCondition() {
		return new SimpleSearchCondition();
	}
	
	@RequestMapping
	public String getPage() {
		return "common/mypage/com/rejectProj";
	}
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<OutProjVO> getRejectList(
			Authentication authentication
			, @RequestParam(name = "page", required = false, defaultValue = "1") int currentPage
			, @RequestParam(value = "searchWord", required = false) String searchWord
			, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
			) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		PagingVO<OutProjVO> pagingVO = new PagingVO<>(6, 5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("pagingVO", pagingVO);
		pagingMap.put("member", member);
		
		service.getAllProj(pagingMap);
		return pagingVO;
	}
	
	@GetMapping("{projId}")
	public String projDetail(@PathVariable String projId, Model model) {
		OutProjVO proj = service.findOne(projId);
		model.addAttribute("proj", proj);
		return "common/mypage/com/rejectProjDetail";
	}
}
