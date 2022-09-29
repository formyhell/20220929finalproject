package kr.or.ddit.pms.work.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import kr.or.ddit.pms.project.dao.ProjInvolveDAO;
import kr.or.ddit.pms.project.service.ProjInvolveService;
import kr.or.ddit.pms.project.vo.projInvolveVO;
import kr.or.ddit.pms.work.dao.WorkDAO;
import kr.or.ddit.pms.work.service.WorkService;
import kr.or.ddit.pms.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 홍승조
 * @since 2022. 8. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 1.      홍승조       controller 생성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@Slf4j
@RequestMapping("pms/{projId}/work")
public class WorkController {
	
	@Inject
	WorkDAO workDAO;
	
	@Inject
	ProjInvolveDAO projInvolve;
	
	@Inject
	WorkService service;
	
	@Inject
	ProjInvolveService projInvolveService;
	
	@ModelAttribute("simpleCondition")
	public SimpleSearchCondition simpleCondition() {
		return new SimpleSearchCondition();
	}
	
	// insert form으로 가는 컨트롤러
	@GetMapping("form")
	public String workForm(
		@PathVariable String projId
//		, @ModelAttribute("projInvolve") projInvolveVO projInvolve
		, @ModelAttribute("work") WorkVO work
		, Model model
		) {
		
		List<projInvolveVO> projInvolve =  projInvolveService.retrieveProjInvolveList(projId);
		
		List<WorkVO> workList = service.parentWork(projId);
		
		log.info(projInvolve+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		model.addAttribute("workList", workList);
		model.addAttribute("projId", projId);
		model.addAttribute("projInvolve", projInvolve);
		model.addAttribute("work", work);
		
		return "pms/work/workForm";
	}
	
	// insert를 처리하고 결과에 따라 다른곳으로 가는 컨트롤러
	@PostMapping
	public String workInsert(
		@Validated(InsertGroup.class)@ModelAttribute("work")WorkVO work
		, Errors errors
		) {
		String viewName = null;
		
		
		
		if(!errors.hasErrors()) {
			service.createWork(work);
			viewName = "redirect:/pms/{projId}/work";
		}else {
			log.info("에러"+ errors);
			viewName = "pms/work/workForm";
		}
		
		return viewName;
	}
	

	// 기존 정보가 있는 수정 폼
	@GetMapping("{workId}/form")
	public String workEdit(
		@PathVariable String workId	
		, @PathVariable String projId
		, @ModelAttribute("work") WorkVO work 
		,Model model
		) {
		
		List<WorkVO> workList = service.parentWork(projId);
		List<projInvolveVO> projInvolve =  projInvolveService.retrieveProjInvolveList(projId);
		
		work.setWorkId(workId);
		work.setWorkProj(projId);
		
		work = service.retrieveWork(work);
		
		log.info("ㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌ타ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅇㅇㅇㅇㅇㅇㅇㅇㅇ이ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂ"+work.getWorkSdate());
		
		model.addAttribute("workList", workList);
		model.addAttribute("work", work);
		model.addAttribute("projInvolve", projInvolve);
		
		return "pms/work/workEdit";
	}
	
	// 새로 입력한 정보로 update
	@PostMapping("{workId}/form/update")
	public String workUpdate(
			@Validated(UpdateGroup.class)@ModelAttribute("work") WorkVO work
			, Errors errors
			, RedirectAttributes redirectAttributes
			, SessionStatus sessionStatus
			) {
		String viewName = null;
		
		if (!errors.hasErrors()) {
			service.modifyWork(work);
			viewName = "redirect:/pms/{projId}/work/{workId}";
			sessionStatus.setComplete();
		} else {
			String errorAttrName = BindingResult.MODEL_KEY_PREFIX+"work";
			redirectAttributes.addFlashAttribute(errorAttrName, errors);
			viewName = "pms/work/workEdit";
		}
		return viewName;
	}
	
	// 삭제하고 성공시 어디로 실패시 어디로
	@DeleteMapping("{workId}")
	public String workDelete(
			@Validated(DeleteGroup.class) WorkVO work
			, Errors errors
			, RedirectAttributes redirectAttributes
			, @PathVariable String workId	
			, @PathVariable String projId
			) {
		
		String viewName = null;
		
		log.info("에러가 뭐일까~~~~~~~~~~~~~~"+errors);
		
		if (!errors.hasErrors()) {
			log.info("여기오면 일감 삭제 완료~~~~~~~~~~~");
			work.setWorkProj(projId);
			service.deleteWork(work);
			redirectAttributes.addFlashAttribute("message", String.format("%s프로젝트 삭제", work.getWorkTitle()));
			viewName = "redirect:/pms/{projId}/work";
		} else {
			log.info("여기오면 일감 삭제 실패~~~~~~~~~~");
			redirectAttributes.addFlashAttribute("message", "삭제 실패");
			viewName = "redirect:/pms/{projId}/work/{workId}";
		}
		
		return viewName;
	}
	
	// 리스트 조회
	@GetMapping
	public String workList(
		@RequestParam(name="page", required=false, defaultValue="1")int currentPage	
		, @RequestParam(value="searchType", required=false)String searchType
		, @RequestParam(value="searchWord", required=false)String searchWord
		, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
		,Model model
		, @PathVariable String projId
		, @ModelAttribute("work") WorkVO work
		) {
		
		PagingVO<WorkVO> pagingVO = new PagingVO<>(7, 5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		log.info(projId+"");
		work.setWorkProj(projId);
		
		pagingVO.setDetailCondition(work);
		
		service.rertieveWorkList(pagingVO);
		
//		model.addAttribute(projId, "projId");
		model.addAttribute("pagingVO", pagingVO);
		
		return "pms/work/workList";
	}
	
	// 상세조회
	@GetMapping("{workId}")
	public String workView(
		@PathVariable String workId
		, @PathVariable String projId
		, @ModelAttribute("work") WorkVO work
		, Model model
		) {
		
		work.setWorkProj(projId);
		log.info("=======================================================" +work.getWorkProj());
		work = service.retrieveWork(work);
		model.addAttribute("work", work);
		log.info("&&&&&&&&&&&&&&&&&&&&&&"+work);
		return "pms/work/workView";
	}
	
	
}














