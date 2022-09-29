package kr.or.ddit.common.mypage.project.interestProject.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.mypage.project.interestProject.dao.InterestProjectDAO;
import kr.or.ddit.common.mypage.project.interestProject.service.InterestProjectService;
import kr.or.ddit.common.mypage.project.interestProject.vo.InterestProjectVO;
import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import kr.or.ddit.outsourcing.vo.ApplicantVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
/**
 * @author 윤지영
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. ?.      306-06       최초작성
 * 2022. 8. 23.      306-06      페이징 처리
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/gen/myinfo/interestProject")
public class InterestProjectController {
	
	@Inject
	private InterestProjectService interestProjectService;
	@Inject
	private InterestProjectDAO interestProjectDAO;
	
	@ModelAttribute("simpleCondition")
	public SimpleSearchCondition simpleCondition() {
		return new SimpleSearchCondition();
	}
	
	@GetMapping
	public String interestProjectView(Authentication authentication) {
		if(authentication.getName() ==null) {
			return "common/mypage/gen/infoView";
		}
		return "common/mypage/gen/project/interestproject/interestProject";
	}  
	
	// 관심 프로젝트 리스트 출력
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<ProjectVO> interestProjectList(
			Authentication authentication
			, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
			, Model model
	){	
		String genId = authentication.getName();
		PagingVO<ProjectVO> pagingVO = new PagingVO<>(5,5);
		pagingVO.setCurrentPage(currentPage);
		interestProjectService.cheakedInterestList(pagingVO, genId);
		boolean pagingList = false;
		if(pagingVO.getTotalRecord()>pagingVO.getScreenSize()) {
			pagingList=true;
		}
		log.info(pagingVO.getDataList()+"");
		model.addAttribute("pagingList", pagingList);
		return pagingVO;
	}
	
	//관심리스트 삭제
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public boolean deleteLike(
			@RequestParam(name="projId", required=false) String projId
			,Authentication authentication
			,InterestProjectVO likeVo
			,Model model
	){
		log.info("projId : {}",projId);
		 String genId = authentication.getName();
		 likeVo.setInterestGenmem(genId);
		 likeVo.setInterestProj(projId);
		 boolean result = false;
		 interestProjectService.uncheakedInterest(likeVo);
		 result = false;
		 
		 return result;
	}
	
	//지원 프로젝트 리스트 출력
	@GetMapping(value="apply",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<ProjectVO> applyProjectList(
		Authentication authentication
		, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
		, Model model			
	){
		String genId = authentication.getName();
		PagingVO<ProjectVO> pagingVO = new PagingVO<>(5,5);
		pagingVO.setCurrentPage(currentPage);
		interestProjectService.retrieveApplyProjectList(pagingVO, genId);
		return pagingVO;
	}
	
	//지원 프로젝트 삭제
	@PostMapping(value="apply",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public boolean deleteApply(
		@RequestParam(name="applyId", required=false) String applyId
		,Authentication authentication
	) {
		boolean result = false;
		String genId = authentication.getName();
		ApplicantVO applicant = interestProjectDAO.selectApplyProject(applyId);
		if(genId.equals(applicant.getApplyApplicant())){
			interestProjectService.removeApplyProject(applyId);
			result = true;
		}else {
			log.info("지원자ID와 일치하지 않습니다.");
		}
		 
		return result;
	}
	

}
