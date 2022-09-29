package kr.or.ddit.admin.outsourcing.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.admin.outsourcing.service.CheckListService;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 10.    조채원       			최초 생성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("admin/checkList/require")
public class RequireCheckListController {
	@Inject
	CheckListService service;
	
	@RequestMapping
	public String processHTML() {
		return "admin/requireCheckList";
	}
	
	@GetMapping("{projId}/form")
	public String projForm(@PathVariable String projId, Model model) {
		OutProjVO proj = service.findById(projId);
		model.addAttribute("proj", proj);
		String listType = "requireCheckList";
		model.addAttribute("listType", listType);
		return "admin/projDetail";
	}
	  
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<OutProjVO> get() {
		List<OutProjVO> projList = new ArrayList<>();
		projList = service.findRequireAll();
		return projList;
	}
		
	// 공고 반려
		@DeleteMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public OutProjVO denyProj(@RequestBody OutProjVO proj) {
			ServiceResult result = service.removeRuquire(proj);
			OutProjVO outProj = null;
			if(result.equals(ServiceResult.OK)) {
				outProj = service.findById(proj.getProjId());
			} 
			return outProj;
		}
		
		// 공고 승인
		@PutMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public OutProjVO approveProj(@RequestBody OutProjVO proj) {
			ServiceResult result = service.updateRequire(proj);
			OutProjVO outProj = null;
			if(result.equals(ServiceResult.OK)) {
				outProj = service.findById(proj.getProjId());
			} 
			return outProj;
		}
}
