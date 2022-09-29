package kr.or.ddit.common.mypage.project.contractProject.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.project.contractProject.service.ContractProjectService;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import kr.or.ddit.outsourcing.vo.ContractVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import kr.or.ddit.pms.issue.vo.IssueVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 9. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자              	 	수정내용
 * --------     --------    ----------------------
 * 2022. 9. 3.    조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/myinfo/contract/project")
public class ContractProjectController {
	@Inject
	ContractProjectService service;
	
	@ModelAttribute("simpleCondition")
	public SimpleSearchCondition simpleCondition() {
		return new SimpleSearchCondition();
	}
	
	@ModelAttribute("proj")
	public OutProjVO issue() {
		return new OutProjVO();
	}
	
	@GetMapping
	public String contractProjList(
			Authentication authentication
			, @RequestParam(name = "page", required = false, defaultValue = "1") int currentPage
			, @RequestParam(value = "searchWord", required = false) String searchWord
			, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
			, Model model
			) {
		String viewName = null;
		PagingVO<OutProjVO> pagingVO = new PagingVO<>(5, 5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("pagingVO", pagingVO);
		pagingMap.put("member", member);

		service.findAll(pagingMap);
		model.addAttribute("pagingVO", pagingVO);
		
		if ("ROLE_GENMEM".equals(member.getMemType().get(0).toString())) {
			viewName = "common/mypage/gen/contractProj";	
		} else if ("ROLE_COMMEM".equals(member.getMemType().get(0).toString())) {
			
			viewName = "common/mypage/com/contractProj";
		}
		
		return viewName;
	}
	
	@PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<ContractVO> getProjList(
			Authentication authentication
			, @RequestParam Map<String, String> proj) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		Map<String, Object> projMap = new HashMap<>();
		
		projMap.put("projId", proj.get("projId").toString());
		projMap.put("member", member);
		
		List<ContractVO> contractList = new ArrayList<ContractVO>();
		contractList = service.findContractList(projMap);
		return contractList;
	}
}
