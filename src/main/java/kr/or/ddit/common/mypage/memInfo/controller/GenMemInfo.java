package kr.or.ddit.common.mypage.memInfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.dao.CommonCodeDAO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.memInfo.service.MemInfoService;
import kr.or.ddit.common.mypage.memInfo.service.PWService;
import kr.or.ddit.common.mypage.memInfo.vo.GenObjVO;
import kr.or.ddit.common.mypage.memInfo.vo.GenSkillVO;
import kr.or.ddit.common.mypage.memInfo.vo.locationVO;
import kr.or.ddit.common.vo.CommonCodeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 신창규
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 2.      306-06       최초작성
 * 2022. 8. 3.      홍승조		 List 를 view로 수정
 * 2022. 8. 4.      홍승조               update, delete url 연결
 * 2022. 8. 6.      윤지영      		  url 재연결
 * 2022. 8. 9.      윤지영,신창규        url 수정
 * Copyright (c) 2022 by DDIT All right reserved
 *      </pre>
 */

@Controller
@Slf4j
@RequestMapping("/gen/myinfo")
public class GenMemInfo {

	@Inject
	MemInfoService service;

	@Inject
	PWService pservice;	
	
	@Inject
	CommonCodeDAO commonCodeDao;
	
	
	
	//비밀번호 변경
	@GetMapping("changePW")
	public String memPW() {
		return "common/mypage/gen/myinfo";
	}
	
	@PostMapping("changePW")
	public String changePW(
		Authentication authentication
		, @RequestParam String inputPass
		, @RequestParam String newPass
		, RedirectAttributes redirectAttributes
	) {
		String memId = authentication.getName();
		String viewName = "redirect:/gen/myinfo";
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> resultMap = new HashMap<>();
		
		map.put("memId", memId);
		map.put("inputPass", inputPass);
		map.put("newPass", newPass);
		
		ServiceResult result = pservice.modifyGenPW(map);
		switch (result) {
		case INVALIDPASSWORD:
			resultMap.put("result", false);
			resultMap.put("message", "비밀번호를 다시 확인해주세요.");
			break;
		case FAIL:
			resultMap.put("result", false);
			resultMap.put("message", "다시 시도해주세요.");
			break;

		default:
			resultMap.put("result", true);
			resultMap.put("message", "비밀번호가 변경되었습니다.");
			break;
		}
		redirectAttributes.addFlashAttribute("resultMap", resultMap);
		return viewName;
	}
	
	
	
	/**
	 * 코드 받아오기
	 * @return
	 */
//	@ResponseBody
//	@GetMapping("form/code")
//	public Map<String, Object> codeList() {
//		Map<String, Object> codeMap = new HashMap<>();
//		
//		List<CommonCodeVO> skill = commonCodeDao.skill();
//		List<CommonCodeVO> jobField = commonCodeDao.jobFeild();
//		
//		codeMap.put("skill", skill);
//		codeMap.put("jobField", jobField);
//		
//		return codeMap;
//	}
	
	@ModelAttribute("outObjList")
	public List<CommonCodeVO> outObjList(Authentication authentication) {
		List<CommonCodeVO> list = commonCodeDao.jobFeild();
		// 1. 회원 VO꺼내기
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		GenMemberVO genMember = new GenMemberVO();
		genMember.setGenId(member.getMemId());

		genMember = service.retrieveGenMemInfo(genMember.getGenId());

		// 2. 회원에서 SKILL리스트 꺼내기
		List<GenObjVO> objList = genMember.getObjList();
		// 3. DAO받은 스킬 리스트랑 회원 스킬 리스트랑 비교해서 있는 거면 list에서 지워
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < objList.size(); j++) {
				if (list.get(i).getCodeName().equals(objList.get(j).getObjName())) {
					list.remove(i);
					i--;
					break;
				}
			}
		}
		return list;
	}

	@ModelAttribute("outSkillList")
	public List<CommonCodeVO> outSkillList(Authentication authentication) {
		List<CommonCodeVO> list = commonCodeDao.skill();
		
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		GenMemberVO genMember = new GenMemberVO();
		genMember.setGenId(member.getMemId());

		genMember = service.retrieveGenMemInfo(genMember.getGenId());
		
		List<GenSkillVO> skillList = genMember.getSkillList();
		
		for(int i=0; i<list.size(); i++) {
			for(int j=0; j<skillList.size(); j++) {
				if(list.get(i).getCodeName().equals(skillList.get(j).getSkillName())) {
					list.remove(i);
					i--;
					break;
				}
			}
		}
		
		return list;
	}

	
	@ModelAttribute("locList")
	public List<CommonCodeVO> locList(Authentication authentication) {
		List<CommonCodeVO> list = commonCodeDao.location();
		
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		GenMemberVO genMember = new GenMemberVO();
		genMember.setGenId(member.getMemId());

		genMember = service.retrieveGenMemInfo(genMember.getGenId());
		
		List<locationVO> locList = genMember.getLocList();
		
		for(int i=0; i<list.size(); i++) {
			for(int j=0; j<locList.size(); j++) {
				if(list.get(i).getCodeName().equals(locList.get(j).getLocName())) {
					list.remove(i);
					i--;
					break;
				}
			}
		}
		
		return list;
	}
	
	
	@GetMapping
	public String memInfoView(Authentication authentication, Model model) {
		String genId = authentication.getName();
		// 회원정보
		GenMemberVO genMember = service.retrieveGenMemInfo(genId);
		model.addAttribute("genMember", genMember);
		return "common/mypage/gen/infoView";
	}

	// 일반회원
	@GetMapping("{memId}/form")
	public String memberEdit(@PathVariable String memId, GenMemberVO principal, Model model) {
		GenMemberVO genMember = service.retrieveGenMemInfo(memId);
		model.addAttribute("genMember", genMember);
		return "common/mypage/gen/memberEdit";
	}

	// 일반회원 회원전보 수정
	@PostMapping("{memId}")
	public String memberUpdate(@PathVariable String memId, RedirectAttributes redirectAttributes,
			SessionStatus sessionStatus, Model model, @ModelAttribute("genMember") GenMemberVO genMember // 얘("")가
																											// ObjectName
			, Errors errors) {
		log.info("genMember@@@@@@@@@@@@@@@@달라@@@@@@@@@@@@@" + genMember);
		String viewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyGenMember(genMember);
			switch (result) {
			case FAIL:
				model.addAttribute("message", "서버 오류");
				viewName = "common/mypage/gen/memberEdit";
				break;
			default:
				viewName = "redirect:/gen/myinfo";
				break;
			}
		} else {
			viewName = "common/mypage/gen/memberEdit";
		}
		return viewName;
	}

	// skill,직무분야 insert Form
	@GetMapping("genSkillForm")
	public String genSkillForm(@ModelAttribute("genMem") GenMemberVO genMem, Model model,
			Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		genMem.setGenId(member.getMemId());

		GenMemberVO genMember = new GenMemberVO();
		model.addAttribute("genSkill", genMember);
		return "common/mypage/gen/genSkillForm";
	}

	// skill,직무분야 등록
	@PostMapping
	public String skillInsert(@ModelAttribute("genSkill") GenMemberVO genMem, Errors errors, Model model,
			RedirectAttributes redirectAttributes, Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		genMem.setGenId(member.getMemId());

		String viewName = null;

		if (!errors.hasErrors()) {
			service.insertSkill(genMem);
			viewName = "redirect:/gen/myinfo";
		} else {
			viewName = "gen/genSkillForm";
		}

		return viewName;
	}
	
	
	
	// 선호지역 insert Form
	@GetMapping("genLocForm")
	public String genLocForm(@ModelAttribute("genMem") GenMemberVO genMem, Model model,
			Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		genMem.setGenId(member.getMemId());

		GenMemberVO genMember = new GenMemberVO();
		model.addAttribute("genLoc", genMember);
		return "common/mypage/gen/genLocForm";
	}
	// 선호지역 등록
	@PostMapping("/loc")
	public String locInsert(@ModelAttribute("genLoc") GenMemberVO genMem, Errors errors, Model model,
			RedirectAttributes redirectAttributes, Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		genMem.setGenId(member.getMemId());
		
		String viewName = null;
		
		if (!errors.hasErrors()) {
			service.insertLoc(genMem);
			viewName = "redirect:/gen/myinfo";
		} else {
			viewName = "gen/genLocForm";
		}
		
		return viewName;
	}
	

	@PostMapping("gendel/{memId}")
	public String genMemDelete(@RequestParam(value = "password", required = false) String password,
			Authentication authentication, RedirectAttributes redirectAttributes, HttpSession session) {

		log.info(password + "비빌번호~~~~~~~~~~~~~~~~~~~~~~~~");
//		MemberVO principal = ((MemberPrincipal)authentication.getPrincipal()).getRealMember();
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();

		log.info("컨트롤러까지 와라~");
//		member.setMemPass(password);
//		String ipass = passEncoder.encode(password);
		String ipass = password;
		ServiceResult result = service.deleteGenMember(member, ipass);

		String viewName = null;
		switch (result) {
		case INVALIDPASSWORD:
			redirectAttributes.addFlashAttribute("message", "비번 오류");
			viewName = "common/mypage/gen/infoView";
			break;
		case FAIL:
			redirectAttributes.addFlashAttribute("message", "서버 오류");
			viewName = "common/mypage/gen/infoView";
			break;

		default:
			session.invalidate();
			viewName = "redirect:/";
			break;
		}
		return viewName;
	}

	@ResponseBody
	@GetMapping("{genId}/delskill")
	public String deleteSkill(@PathVariable GenSkillVO genId,
			@RequestParam(name = "code", required = false) String code, Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		genId.setGenId(member.getMemId());
		genId.setSkillCode(code);
		String aa = null;
		int remove = service.remove(genId);
		if (remove > 0) {
			aa = "success";
		}
		return aa;
	}

	@ResponseBody
	@GetMapping("{genId}/delobj")
	public String deleteObj(@PathVariable GenObjVO genId, @RequestParam(name = "code1", required = false) String code1,
			Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		genId.setGenId(member.getMemId());
		genId.setObjCode(code1);
		String aa = null;
		int remove = service.remove1(genId);
		if (remove > 0) {
			aa = "success";
		}
		return aa;
	}
	//선호지역 지우깅
	
	@ResponseBody
	@GetMapping("{genId}/delloc")
	public String deleteLoc(@PathVariable locationVO genId, @RequestParam(name = "code2", required = false) String code2,
			Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		genId.setGenId(member.getMemId());
		genId.setLocCode(code2);
		String aa = null;
		int remove = service.removeLoc(genId);
		if (remove > 0) {
			aa = "success";
		}
		return aa;
	}

}
