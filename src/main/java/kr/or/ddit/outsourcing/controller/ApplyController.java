package kr.or.ddit.outsourcing.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.AwardVO;
import kr.or.ddit.common.member.vo.CareerVO;
import kr.or.ddit.common.member.vo.EducationVO;
import kr.or.ddit.common.member.vo.LicenseVO;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.memInfo.dao.MemberInfoDAO;
import kr.or.ddit.common.mypage.memInfo.vo.GenSkillVO;
import kr.or.ddit.common.mypage.portfolio.dao.PortfolioDAO;
import kr.or.ddit.common.mypage.portfolio.service.AwardService;
import kr.or.ddit.common.mypage.portfolio.service.CareerService;
import kr.or.ddit.common.mypage.portfolio.service.EducationService;
import kr.or.ddit.common.mypage.portfolio.service.LicenseService;
import kr.or.ddit.common.mypage.portfolio.service.PortfolioService;
import kr.or.ddit.common.mypage.portfolio.vo.PortfolioVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import kr.or.ddit.outsourcing.service.ApplyProjService;
import kr.or.ddit.outsourcing.service.OutProjService;
import kr.or.ddit.outsourcing.vo.ApplicantVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 8. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자              		 수정내용
 * --------     --------    ----------------------
 * 2022. 8. 24.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/outsourcing/apply")
public class ApplyController {
	@Inject
	ApplyProjService service;
	
	@Inject
	OutProjService outProjService;
	
	@Inject
	LicenseService licenseService;
	
	@Inject
	AwardService awardService;
	
	@Inject
	CareerService careerService;
	
	@Inject
	EducationService educationService;
	
	@Inject
	MemberInfoDAO memberInfoDAO;
	
	@Inject
	PortfolioService portfolioService;
	
	@RequestMapping("{projId}")
	public String processHTML(@PathVariable String projId, Model model) {
		List<ApplicantVO> applyList = service.getAll(projId);
		model.addAttribute("applyList", applyList);
		return "outsourcing/applicant";
	}
	
	@GetMapping("form/{applyId}")
	public String getContractForm(@PathVariable String applyId, RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("applyId", applyId);
		return "redirect:/outsourcing/contract/form";
	}
	
	@GetMapping("support/form/{projId}")
	public String supportProjectForm(
		@ModelAttribute("applyProj")ApplicantVO applyProj
		, @PathVariable String projId 
		, Model model
		) {
		
		OutProjVO outProj = outProjService.findByPK(projId);
		log.info("프로젝트 지원할 때 보여줄 프로젝트 이름 : {}",outProj.getProjTitle());
		String projName = outProj.getProjTitle();
		
		
		applyProj = service.getprojectObj(projId);
		
		log.info("프로젝트 지원하면 값이 어떨게 나옴? : {}", applyProj);
		
		model.addAttribute("projId", projId);
		model.addAttribute("projName", projName);
		model.addAttribute("applyProj", applyProj);
		
		return "outsourcing/supportProject";
	}
	
	@PostMapping("support")
	public String supportProject(
	@ModelAttribute("applyProj")ApplicantVO applyProj
	, RedirectAttributes redirectAttributes
	) {
		ServiceResult result = service.supprotProject(applyProj);
		
		String message = null;
		
		if (result == ServiceResult.DUPLICATED) {
			message = "duplicated";
		} else {
			message = "ok";
		}
		
		redirectAttributes.addFlashAttribute("message", message);
		
		return "redirect:/outsourcing/listAll";
	}
	
	
	@GetMapping("info/{memId}")
	public String checkResume(
		@PathVariable String memId
		, Model model
		
		) {
		
		log.info("여기 온걸까요???????????????????????");
		log.info("회원 아이디 : {}", memId);
//		회원 아이디로 학력, 수상이력, 경력, 자격증 가져오기
		
//		학교구분, 학교명, 전공, 졸압상태, 입학년월, 졸업연월
		List<LicenseVO> lecenseList =  licenseService.findAll(memId);
//		상훈명, 기관명, 수상일, 수상내역
		List<AwardVO> awordList = awardService.findAll(memId);
//		회사명, 입사일, 퇴사일, 근무부서, 직급
		List<CareerVO> careerList = careerService.findAll(memId);
//		자격증이름, 기관명, 취득일
		List<EducationVO> educationList = educationService.findAll(memId);
//		보유기술
		List<GenSkillVO> skillList = memberInfoDAO.genSkillList(memId);
		
//		넘겨주기
		model.addAttribute("lecenseList", lecenseList);
		model.addAttribute("awordList", awordList);
		model.addAttribute("careerList", careerList);
		model.addAttribute("educationList", educationList);
		model.addAttribute("skillList", skillList);
		
		
		return "outsourcing/checkResume";
	}
	
	@GetMapping("portfolio/{memId}")
	public String getPortfolio(
			@PathVariable String memId
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, Model model
	) {
		PagingVO<PortfolioVO> pagingVO = new PagingVO<>(5,5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("pagingVO", pagingVO);
		
		List<PortfolioVO> pfList = portfolioService.findAllPf(map);
		log.info("~~~~~ pagingVO => ", pagingVO);
		log.info("~~~~~ memId => ", memId);
		
		model.addAttribute("pfList", pfList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("memId", memId);
		log.info("~~~~~ pfList => ", pfList);
		
		return "outsourcing/checkPortfolio";
	}
	
	
	
}
