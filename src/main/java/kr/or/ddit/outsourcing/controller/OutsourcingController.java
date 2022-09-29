package kr.or.ddit.outsourcing.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.http.MediaType;
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

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.dao.CommonCodeDAO;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.memInfo.service.MemInfoService;
import kr.or.ddit.common.mypage.memInfo.vo.GenObjVO;
import kr.or.ddit.common.mypage.memInfo.vo.GenSkillVO;
import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.CommonCodeVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import kr.or.ddit.outsourcing.service.OutProjService;
import kr.or.ddit.outsourcing.vo.ObjectVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import kr.or.ddit.outsourcing.vo.SkillVO;
import kr.or.ddit.pms.project.vo.PMSProjectVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 신창규
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 2.      306-06       최초작성
 * 2022. 8. 6.      홍승조       컨트롤러 통합
 * 2022. 8. 16.     고혜인       리스트 조회/상세조회 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@Slf4j
@RequestMapping("/outsourcing")
public class OutsourcingController {
	
	@Inject
	private OutProjService service;
	
	@Inject
	private MemInfoService mservice;
	
	@Inject
	CommonCodeDAO commonCodeDao;
	
	@ModelAttribute("outProj")
	public OutProjVO outProj() {
		return new OutProjVO();
	}

	@ModelAttribute("outObjList")
	public List<CommonCodeVO> outObjList(Authentication authentication) {
		return commonCodeDao.jobFeild();
	}
	
	@ModelAttribute("outSkillList")
	public List<CommonCodeVO> outSkillList(){
		return commonCodeDao.skill();
	}
	
	@ModelAttribute("outLocList")
	public List<CommonCodeVO> outLocList(){
		return commonCodeDao.location();
	}
	
	
	/**
	 * 코드 받아오기
	 * @return
	 */
	@ResponseBody
	@GetMapping("form/code")
	public Map<String, Object> codeList() {
		Map<String, Object> codeMap = new HashMap<>();
		
		List<CommonCodeVO> skill = commonCodeDao.skill();
		List<CommonCodeVO> jobField = commonCodeDao.jobFeild();
		
		codeMap.put("skill", skill);
		codeMap.put("jobField", jobField);
		
		return codeMap;
	}
	
	
	
	//insert form으로 가는 컨트롤러
	@GetMapping("form")
	public String projectForm(
			@ModelAttribute("outProj") OutProjVO outProj
			) {
		return "outsourcing/projectForm";
	}
	
	
	
	
	//프로젝트 등록
	@PostMapping("insert")
	public String projectInsert(
			@Validated(InsertGroup.class) @ModelAttribute("outProj") OutProjVO outProj
			, Errors errors
			, Model model
			, RedirectAttributes redirectAttributes
			, Authentication authentication 
			) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal(); //projRegist 받아와야해서 쓰는거
		MemberVO member = userPrincipal.getRealMember();
		outProj.setProjRegist(member.getMemId());
		
		String viewName = null;
		
		log.info("프로젝트 인서트할 때 에러~~~~~~"+ errors);
		
		if(!errors.hasErrors()) {
			service.create(outProj);
			viewName = "redirect:/outsourcing/listAll";
		}else {
			viewName = "outsourcing/projectForm";
		}
		log.info("왜 빈값임?@@@@@@@@@@@@@@@@"+ outProj );
		return viewName;
	}
	
	
	
	// 기존 정보가 있는 수정 폼
	@GetMapping("{outProjId}/form")
	public String outsourcingEdit(
			@PathVariable String outProjId
			,@ModelAttribute("outProj") OutProjVO outProj
			, Model model
			) {
		outProj = service.findByPK(outProjId);
		model.addAttribute("outProj", outProj);
		return "outsourcing/outsourcingEdit";
	}

	
	
	
	// 새로 입력한 정보로 update
	@PostMapping("{outProjId}")
	public String outsourcingUpdate(
			@PathVariable String outProjId
			,@Validated(UpdateGroup.class) @ModelAttribute("outProj") OutProjVO outProj
			,Errors errors
			,Model model
			) {
		log.info("~~~~~~~~~~~~~~~~~~~~~~~~~~~outProj"+ outProj);
		log.info(errors+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		String viewName = null;
		if (!errors.hasErrors()) {
			service.modify(outProj);
			viewName = "redirect:/outsourcing/{outProjId}/project";
		} else {
			viewName = "redirect:/outsourcing/{outProjId}/form";
		}
		return viewName;
	}

	
	// 삭제하고 성공시 어디로 실패시 어디로
	@PostMapping("projdel/{outProjId}")
	public String outsourcingDelete(
//			@Validated(DeleteGroup.class) @ModelAttribute("outProj") OutProjVO outProj
//			, Errors errors
			@PathVariable String outProjId
			, @ModelAttribute("password") String password
			, Authentication authentication
			,RedirectAttributes redirectAttributes
//			,@RequestParam(value="password", required=false) String password
			) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		
		String ipass = password;
		ServiceResult result = service.remove(member,ipass,outProjId);
		
		
		
		String viewName = null;
		switch (result) {
		case INVALIDPASSWORD:
			redirectAttributes.addFlashAttribute("message", "비번 오류");
			viewName = "redirect:/outsourcing/creaed/{outProjId}";
			break;
//		case FAIL:
//			redirectAttributes.addFlashAttribute("message", "서버 오류");
//			viewName = "redirect:/outsourcing/creaed/{outProjId}";
//			break;

		default:
			viewName = "redirect:/outsourcing/creaed";
			break;
		} 
		log.info(result+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@결과이다");
		return viewName;
	}
		
	
	@ModelAttribute("simpleCondition")
	public SimpleSearchCondition simpleCondition() {
		return new SimpleSearchCondition();
	}
	
	//리스트 조회
	@GetMapping("listAll")
	public String outsourcingList(
			@ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, OutProjVO detailCondition
			, Model model
			, @RequestParam(value="projTitle", required=false) String projTitle
			, @RequestParam(value="projemptype", required=false) String projemptype
			, @RequestParam(value="projObj", required=false) String projObj[]
			, @RequestParam(value="comGrd", required=false) String comGrd
			, @RequestParam(value="projSdate", required=false) String projSdate
			, @RequestParam(value="projFdate", required=false) String projFdate
			, @RequestParam(value="projSkill", required=false) String projSkill[]
			,Authentication authentication
	) {
		String comId = authentication.getName();
		ComMemberVO comMember = mservice.retrieveComMemInfo(comId);
		model.addAttribute("comMember", comMember);
		
		
		PagingVO<OutProjVO> pagingVO = new PagingVO<>(9,5); //테스트용
		pagingVO.setSimpleCondition(simpleCondition);
		
		pagingVO.setCurrentPage(currentPage);
		detailCondition.setProjTitle(projTitle);
		detailCondition.setProjEmptypeList(projemptype);
		detailCondition.setProjObj(projObj);
		detailCondition.setComGrdList(comGrd);
		detailCondition.setProjSdate(projSdate);
		detailCondition.setProjFdate(projFdate);
		detailCondition.setProjSkill(projSkill);
		
		
		pagingVO.setDetailCondition(detailCondition);
		log.info("outsourcingList => pagingVO.detailCondition.projTitle : " + pagingVO.getDetailCondition().getProjTitle());
		service.findAll(pagingVO);
		
//		for (String string : pagingVO.getDetailCondition().getProjEmptypeList()) {
//			log.info("고용형태 조건들~~~~~!{}", string);
//		}
//		log.info("직무 분야 조건들~~~~~!{}", projObj);
//		log.info("기업 회원 등급입니다~~~~`{}", comGrd);
//		
//		log.info("스킬 조건들 {}", detailCondition.getSkillList());
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "outsourcing/outsourcingList";
	}
	
	//상세조회 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@GetMapping("{projId}/project")
	public String outsourcingView(@PathVariable String projId, Model model,Authentication authentication, OutProjVO projRegist) {
//		String projRegist = (service.findByPK(projId).getProjRegist());
//		log.info("짜증나@@@@@@@@@@"+projRegist);
		
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		
//		아웃소싱 프로젝트에 참가 했는지 확인
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projId", projId);
		map.put("memId", member.getMemId());
		String supportChek = service.findsupport(map);
		
		OutProjVO proj = service.findByPK(projId);
		ComMemberVO comMember = mservice.retrieveComImg(projRegist);
		model.addAttribute("proj", proj);
		model.addAttribute("comMember", comMember);
		model.addAttribute("supportChek", supportChek);
		log.info("supportChek의 값을 확인해 보자고~~~~~{}",supportChek);
		log.info("프로젝트@@@@@@@@@@@@@@@@@@@@@@@@@@@@ "+ proj);
		
		return "outsourcing/outsourcingView";
	}
	
	
	@GetMapping("creaed")
	public String CreatedProjectList(
			@ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, OutProjVO detailCondition
			, Model model
			, @RequestParam(value="projTitle", required=false) String projTitle
			, @RequestParam(value="projemptype", required=false) String projemptype
			, @RequestParam(value="projObj", required=false) String projObj[]
			, @RequestParam(value="comGrd", required=false) String comGrd
			, @RequestParam(value="projSdate", required=false) String projSdate
			, @RequestParam(value="projFdate", required=false) String projFdate
			, @RequestParam(value="projSkill", required=false) String projSkill[]
			, Authentication authentication
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String projRegist = authentication.getName();
		log.info("내가만든 등록자@@@@@@@@@  : " + projRegist);
		
		PagingVO<OutProjVO> pagingVO = new PagingVO<>(9,5); //테스트용
		pagingVO.setSimpleCondition(simpleCondition);
		
		
		pagingVO.setCurrentPage(currentPage);
		detailCondition.setProjTitle(projTitle);
		detailCondition.setProjEmptypeList(projemptype);
		detailCondition.setProjObj(projObj);
		detailCondition.setComGrdList(comGrd);
		detailCondition.setProjSdate(projSdate);
		detailCondition.setProjFdate(projFdate);
		detailCondition.setProjSkill(projSkill);
		
		pagingVO.setDetailCondition(detailCondition);
		
		map.put("projRegist", projRegist);
		map.put("pagingVO", pagingVO);
		
		List<OutProjVO> createdProjectList = service.createdProjectList(map);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("createdProjectList",createdProjectList);
	
		return "outsourcing/createdProjectList";
		
	}
	
	
	//스킬, 직무분야 insert Form
	@GetMapping("projSkillForm/{projId}")
	public String genSkillForm(@ModelAttribute("outprojVo") OutProjVO outprojVo, Model model, Authentication authentication,@PathVariable String projId) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		outprojVo.setProjRegist(member.getMemId());
		outprojVo.setProjId(projId);
		log.info("프로젝트 id??" + outprojVo);
		
		OutProjVO projSkill = new OutProjVO();
		model.addAttribute("projSkill", projSkill);
		return "outsourcing/projSkillForm";
	}
	
	//스킬, 직무분야 등록
	@PostMapping("/skill")
	public String skillInsert(@ModelAttribute("projSkill") OutProjVO outprojVo, Errors errors,
			RedirectAttributes resdirectAttributes, Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		outprojVo.setProjRegist(member.getMemId());
		String projId = outprojVo.getProjId();
		log.info("여기옴??@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		String viewName = null;
		
		
		if(!errors.hasErrors()) {
			service.insertSkill(outprojVo);
			viewName = "redirect:/outsourcing/"+projId+"/project";
		}else {
			viewName = "outsourcing/projSkillForm";
		}
		
		return viewName;
	}
	
	
	
	
	
	//스킬, 직무분야 삭제
	@ResponseBody
	@GetMapping("{projId}/delskill")
	public String deleteSkill(@PathVariable String projId,
			@RequestParam(name = "code", required = false) String code, Authentication authentication) {
		SkillVO skillVo = new SkillVO();
		skillVo.setProjId(projId);
		skillVo.setSkillCode(code);
		String aa = null;
		int remove = service.removeSkill(skillVo);
		if (remove > 0) {
			aa = "success";
		}
		return aa;
	}

	@ResponseBody
	@GetMapping("{projId}/delobj")
	public String deleteObj(@PathVariable String projId, @RequestParam(name = "code1", required = false) String code1,
			Authentication authentication) {
		ObjectVO objVo = new ObjectVO();
		objVo.setProjId(projId);
		objVo.setObjCode(code1);
		String aa = null;
		int remove = service.removeObj(objVo);
		if (remove > 0) {
			aa = "success";
		}
		return aa;
	}
	
	
}

