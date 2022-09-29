package kr.or.ddit.admin.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.admin.member.service.AdminMemberService;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.memInfo.dao.MemberInfoDAO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	@Inject
	AdminMemberService service;
	@Inject
	MemberInfoDAO memDao;
	
	@GetMapping()
	public String memberList(
		Authentication authentication
		, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value="searchMemType", required=false)String searchMemType
		, @RequestParam(value="searchType", required=false)String searchType
		, @RequestParam(value="searchWord", required=false)String searchWord
		, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
		, Model model
	){
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		String memType = userPrincipal.getRealMember().getMemType().get(0);
		PagingVO<GenMemberVO> pagingVO = new PagingVO<>(10,5);
		
		if("ROLE_ADMIN".equals(memType)) {
			pagingVO.setCurrentPage(currentPage);
			pagingVO.setSimpleCondition(simpleCondition);
			Map<String, Object> map = new HashMap<>();
			map.put("pagingVO", pagingVO);
			if(searchMemType!=null && !searchMemType.isEmpty()) {
				map.put("searchMemType", searchMemType);
			}
			service.retrieveMemList(map);
			model.addAttribute("pagingVO", pagingVO);
			model.addAttribute("searchMemType", searchMemType);
		}
		return "admin/member";
	}
	
	@GetMapping(value="gen",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public GenMemberVO genMember(
		Authentication authentication
		, MemberVO member
	) {
		GenMemberVO genMem = memDao.selectGenMem(member.getMemId());
		return genMem;
	}
	
	@GetMapping(value="com",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ComMemberVO comMember(
			Authentication authentication
			, MemberVO member
	) {
		ComMemberVO comMem = memDao.selectComMem(member.getMemId());
		return comMem;
	}
	
	@Transactional
	@PostMapping("disabled")
	public String disabled(
			String genChkList
			,String comChkList
			,RedirectAttributes redirectAttributes
	) {
		
		log.info("genChkList:{}", genChkList);
		log.info("comChkList:{}", comChkList);
		
		if(!genChkList.equals(null) && !genChkList.isEmpty()) {
			String[] genChkLists = genChkList.split(",");
			for(String memId: genChkLists) {
				service.modifyDisGenMem(memId);
			}
		}
		if(!comChkList.equals(null) && !comChkList.isEmpty()) {
			String[] comChkLists = comChkList.split(",");
			for(String memId: comChkLists) {
				service.modifyDisComMem(memId);
			}
		}
		redirectAttributes.addFlashAttribute("message", "회원 정지에 성공했습니다.");
		return "redirect:/admin/member";
		
	}
	@Transactional
	@PostMapping("enabled")
	public String enabled(
			String memId
			,String memType
			,RedirectAttributes redirectAttributes
	) {
		ServiceResult result = ServiceResult.FAIL;
		if(memType.equals("gen")) {
			result = service.modifyEnGenMem(memId);
		}else {
			result = service.modifyEnComMem(memId);
		}
		
		switch(result) {
		case FAIL:
			redirectAttributes.addFlashAttribute("message", "회원 활성화에 실패했습니다.");
			break;
		default:
			redirectAttributes.addFlashAttribute("message", "회원 활성화에 성공했습니다.");
			break;
		}
		return "redirect:/admin/member";
		
	}

}
