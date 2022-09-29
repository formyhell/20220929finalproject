package kr.or.ddit.common.mypage.portfolio.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.member.vo.CareerVO;
import kr.or.ddit.common.member.vo.EducationVO;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.portfolio.service.EducationService;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 8. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 22.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/gen/myinfo/education")
public class EducationController {
	@Inject
	EducationService service;
	
	@ModelAttribute("eduTypeList") 
	public List<Map<String, Object>> eduTypeList() {
		return service.selectEduTypeList();
	}
	
	@ModelAttribute("eduStateList") 
	public List<Map<String, Object>> eduStateList() {
		return service.selectEduStateList();
	}
	
	@ModelAttribute("edu")
	public EducationVO education() {
		return new EducationVO();
	}
	
	@RequestMapping
	public String processHTML() {
		return "common/mypage/gen/education";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<EducationVO> getEduList(Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		String memId = member.getMemId();
		List<EducationVO> eduList = service.findAll(memId);
		return eduList;
	}
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public EducationVO insertEdu(
			@Validated(InsertGroup.class) @RequestBody EducationVO eduOld
			, Errors errors
			, Authentication authentication) {
		String viewName = null;
		eduOld.setEduSdate(eduOld.getEduSdate().toString());
		eduOld.setEduFdate(eduOld.getEduFdate().toString());
		boolean valid =  !errors.hasErrors();
		EducationVO edu = null;
		if(valid) {
			MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
			MemberVO member = userPrincipal.getRealMember();
			String memId = member.getMemId();
			eduOld.setEduMem(memId);
			edu = service.create(eduOld);
		}
		return edu;
	}
	
	@PutMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public EducationVO updateEdu(
			@Validated(UpdateGroup.class) @RequestBody EducationVO education
			, Errors errors
			, Authentication authentication 
			) {
		education.setEduSdate(education.getEduSdate().toString());
		education.setEduFdate(education.getEduFdate().toString());
		
		boolean valid =  !errors.hasErrors();
		EducationVO edu = null;
		if(valid) {
			MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
			MemberVO member = userPrincipal.getRealMember();
			String memId = member.getMemId();
			education.setEduMem(memId);
			edu = service.update(education);
		}
		return edu;
	}
	
	@GetMapping("{eduNo}")
	public String deleteEdu(@PathVariable int eduNo) {
		service.remove(eduNo);	
		return "redirect:/gen/myinfo/education";
	}
}
