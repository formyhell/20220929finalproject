package kr.or.ddit.admin.outsourcing.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.admin.outsourcing.service.CheckListService;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("admin/outProjList")
public class OutProjListController {
	@Inject
	CheckListService service;
	
	@GetMapping
	public String get() {
		return "admin/outProjList";
	}
	
	@GetMapping(value="approve",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<OutProjVO> getApproveList(
		Authentication authentication
		, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
		, Model model	
	) {
		PagingVO<OutProjVO> pagingVO = new PagingVO<>(12,5);
		pagingVO.setCurrentPage(currentPage);
		service.findApproveAll(pagingVO);
		return pagingVO;
	}
	@GetMapping(value="notApprove",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<OutProjVO> getNotApproveList(
			Authentication authentication
			, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
			, Model model	
			) {
		PagingVO<OutProjVO> pagingVO = new PagingVO<>(12,5);
		pagingVO.setCurrentPage(currentPage);
		service.findNotApproveAll(pagingVO);
		return pagingVO;
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String getNotApproveList(Model model) {
		return "admin/outProjList";
	}
	
	@GetMapping("{projId}")
	public String getProjDetail(
			@PathVariable String projId
			, Model model) {
		OutProjVO proj = service.findById(projId);
		model.addAttribute("proj", proj);
		String listType = "outProjList";
		model.addAttribute("listType", listType);
		return "admin/projDetail";
	}
	
	// 공고 반려
	@DeleteMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public OutProjVO denyProj(@RequestBody OutProjVO proj) {
		ServiceResult result = service.remove(proj);
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
		ServiceResult result = service.update(proj.getProjId());
		OutProjVO outProj = null;
		if(result.equals(ServiceResult.OK)) {
			outProj = service.findById(proj.getProjId());
		} 
		return outProj;
	}
}
