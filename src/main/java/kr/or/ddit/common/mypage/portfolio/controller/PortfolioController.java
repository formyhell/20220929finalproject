package kr.or.ddit.common.mypage.portfolio.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Delete;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.dao.CommonCodeDAO;
import kr.or.ddit.common.mypage.memInfo.dao.MemberInfoDAO;
import kr.or.ddit.common.mypage.portfolio.service.PortfolioService;
import kr.or.ddit.common.mypage.portfolio.vo.PortfolioVO;
import kr.or.ddit.common.qna.vo.QnaVO;
import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.CommonCodeVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 고혜인
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 2.    고혜인       		컨트롤러 생성
 * 2022. 8. 6.    고혜인       		컨트롤러 통합
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/gen/myinfo/portfolio")
public class PortfolioController {
	
	@Inject
	private PortfolioService service;
	
	@Inject
	CommonCodeDAO commonCode;
	
	@Inject
	MemberInfoDAO memberInfoDAO;
	
	@ModelAttribute("pf") //이거 안쓰면 입력창 안뜸
	public PortfolioVO pf() {
		return new PortfolioVO();
	}
	
	@GetMapping("form")
	public String portfolioForm() {
		return "common/portfolio/portfolioForm";
	}
	
	/**
	 * 코드 받아오기
	 * @return
	 */
	@ResponseBody
	@GetMapping("form/code")
	public Map<String, Object> codeList() {
		Map<String, Object> codeMap = new HashMap<>();
		
		List<CommonCodeVO> skill = commonCode.skill();
		List<CommonCodeVO> jobField = commonCode.jobFeild();
		
		codeMap.put("skill", skill);
		codeMap.put("jobField", jobField);
		
		return codeMap;
	}
	
	
	@PostMapping
	public String portfolioInsert(
			@Validated(InsertGroup.class) @ModelAttribute("pf") PortfolioVO pf
			, Errors errors) 
	{
		String viewName = null;
		ServiceResult result = null;
		
		log.info("pf : {}", pf);
		
		if(!errors.hasErrors()) {
			log.info("==insert==");
			result = service.createPf(pf);
			switch (result) {
			case OK:
				viewName = "redirect:/gen/myinfo/portfolio";				
				break;

			default:
				log.info("ServiceResult Error");
				viewName = "common/portfolio/portfolioForm";
				break;
			}
		} else {
			log.info("validated error");
			viewName = "common/portfolio/portfolioForm";
		}
		
		return viewName;
	}
	

	@GetMapping("{pfId}/form")
	public String portfolioEdit(
			@PathVariable String pfId
			, Model model) 
	{
		PortfolioVO pf = service.retrievePf(pfId);
		model.addAttribute("pf",pf);

		return "common/portfolio/portfolioEdit";
	}
	
	@PutMapping("{pfId}/form")
	public String portfolioUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("pf") PortfolioVO pf
			, Errors errors
			, Model model) 
	{
		String viewName = null;
		log.info("errors : {}", errors.getAllErrors());

		if(!errors.hasErrors()) {
			service.modifyPf(pf);
			viewName = "redirect:/gen/myinfo/portfolio/{pfId}";
		} else {
//			viewName = "redirect:/gen/myinfo/portfolio/{pfId}/form";
			viewName = "common/portfolio/portfolioEdit";
		}
		return viewName;
	}
	
	@DeleteMapping("{pfId}")
	public String portfolioDelete(
			@Validated(DeleteGroup.class) PortfolioVO pf
			, Errors errors
			, RedirectAttributes redirectAttributes) 
	{
		String viewName = null;
		
		if(!errors.hasErrors()) {
			log.info("===== 포트폴리오 삭제 완료 =====");
			service.removePf(pf);
			redirectAttributes.addFlashAttribute("message","삭제되었습니다");
			viewName = "redirect:/gen/myinfo/portfolio";
		} else {
			redirectAttributes.addFlashAttribute("message","삭제 실패");
			viewName = "redirect:/gen/myinfo/portfolio/{pfId}";
		}
		return viewName;
	}
	

	@GetMapping
	public String portfolioList(
			@ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, Authentication authentication
			, Model model) 
	{
		String id = authentication.getName();
		
		PagingVO<PortfolioVO> pagingVO = new PagingVO<>(8,5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memId", id);
		map.put("pagingVO", pagingVO);
		
		List<PortfolioVO> pfList = service.findAllPf(map);
		log.info("~~~~~ pagingVO => ", pagingVO);
		log.info("~~~~~ memId => ", id);
		
		model.addAttribute("pfList", pfList);
		model.addAttribute("pagingVO", pagingVO);
		
		return "common/portfolio/portfolioList";
	}
	
	@GetMapping("{pfId}")
	public String portfolioView(
			@PathVariable String pfId
			, Model model) 
	{
		PortfolioVO pf = service.retrievePf(pfId);
		
		log.info("포트폴리오 VO 출력 ==> {}",pf);
		log.info("getObjCodeList ==> {}", pf.getObjCodeList());
//		log.info("getObjCodes ==> {}", pf.getObjCodes());
		
		log.info("첨부파일 ==> {}", pf.getAttatchList());
		
		
		model.addAttribute("pf",pf);
		
		return "common/portfolio/portfolioView";
	}
	
	@GetMapping("{pfId}/att/{attId}")
	public String pfFileDownload(
			@PathVariable String attId
			, @PathVariable String pfId
			, Model model
	) {
		AttatchVO attatch = service.downloadPf(attId);
		model.addAttribute("attatch", attatch);
		
		return "downloadView";
	}
	
	
}
