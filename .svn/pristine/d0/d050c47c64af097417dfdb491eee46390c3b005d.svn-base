package kr.or.ddit.admin.code.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.admin.code.dao.AdminCodeDAO;
import kr.or.ddit.admin.code.service.AdminCodeService;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.vo.CommonCodeTypeVO;
import kr.or.ddit.common.vo.CommonCodeVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.issue.vo.IssueVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/code")
public class AdminCodeController {
	@Inject
	AdminCodeService service;
	@Inject
	AdminCodeDAO dao;
	
	@ModelAttribute("codeTypeList")
	public List<CommonCodeTypeVO> codeTypeList() {
		return dao.selectCodeTypeList();
	}
	
	@GetMapping
	public String codeList(
		@RequestParam(name="page", required=false, defaultValue="1")int currentPage	
		, @RequestParam(value="show", required=false)String show
		, @RequestParam(value="searchTypeId", required=false)String searchTypeId
		, @RequestParam(value="searchCodeName", required=false)String searchCodeName
		, Model model		
	) {
		int showNum = 10;
		if(show!=null && !show.isEmpty()) {
			showNum = Integer.parseInt(show);
		}
		PagingVO<IssueVO> pagingVO = new PagingVO<>(showNum, 5);
		pagingVO.setCurrentPage(currentPage);

		Map<String, Object> map = new HashMap<>();
		map.put("pagingVO", pagingVO);
		
		if(searchTypeId!=null && !searchTypeId.isEmpty()) {
			map.put("searchTypeId", searchTypeId);
		}
		if(searchCodeName!=null && !searchCodeName.isEmpty()) {
			map.put("searchCodeName", searchCodeName);
		}
		
		service.retrieveCodeList(map);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("showNum", showNum);
		model.addAttribute("searchTypeId", searchTypeId);
		model.addAttribute("searchCodeName", searchCodeName);
		return "admin/code";
	}
	
	@PostMapping
	public String insertCode(
		Authentication authentication
		, @Validated @ModelAttribute("code") CommonCodeVO code
		, RedirectAttributes redirectAttributes
	) {
		log.info("등록 컨트롤러 옴~~~~~~~~~~~~~~~~~");
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		String memType = member.getMemType().get(0);
		String rst = "false";
		
		if("ROLE_ADMIN".equals(memType)) {
			code.setCodeId(code.getCodeId().toUpperCase());
			ServiceResult result = service.createCode(code);
			switch(result) {
			case DUPLICATED:
				redirectAttributes.addFlashAttribute("message", "이미 등록된 코드입니다.");
				break;
			case FAIL:
				redirectAttributes.addFlashAttribute("message", "코드 등록에 실패했습니다.");
				break;
			default:
				redirectAttributes.addFlashAttribute("message", "코드 등록에 성공했습니다.");
				rst = "true";
				break;
			}
		}else {
			redirectAttributes.addFlashAttribute("message", "코드 등록 권한이 없습니다.");
		}
		
		redirectAttributes.addFlashAttribute("rst", rst);
		return "redirect:/admin/code";
	}
	
	@PutMapping
	public String updateCode(
		Authentication authentication
		, @Validated @ModelAttribute("code") CommonCodeVO code
		, RedirectAttributes redirectAttributes
	) {
		log.info("수정 컨트롱어 옴~~~~~~~~~~~~~~~~~~~~");
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		String memType = member.getMemType().get(0);
		String rst = "false";
		
		if("ROLE_ADMIN".equals(memType)) {
			code.setCodeId(code.getCodeId().toUpperCase());
			ServiceResult result = service.modifyCode(code);
			switch(result) {
			case FAIL:
				redirectAttributes.addFlashAttribute("message", "코드 수정에 실패했습니다.");
				break;
			default:
				redirectAttributes.addFlashAttribute("message", "코드 수정에 성공했습니다.");
				rst = "true";
				break;
			}
		}else {
			redirectAttributes.addFlashAttribute("message", "코드 등록 권한이 없습니다.");
		}
		
		redirectAttributes.addFlashAttribute("rst", rst);
		return "redirect:/admin/code";
	}
	
	@DeleteMapping
	public String deleteCode(
		Authentication authentication
		, @ModelAttribute("code") CommonCodeVO code
		, RedirectAttributes redirectAttributes
	) {
		log.info("삭제 컨트롱어 옴~~~~~~~~~~~~~~~~~~~~");
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		String memType = member.getMemType().get(0);
		String rst = "false";
		
		if("ROLE_ADMIN".equals(memType)) {
			code.setCodeId(code.getCodeId().toUpperCase());
			ServiceResult result = service.removeCode(code.getCodeId());
			switch(result) {
			case FAIL:
				redirectAttributes.addFlashAttribute("message", "코드 삭제에 실패했습니다.");
				break;
			default:
				redirectAttributes.addFlashAttribute("message", "코드 삭제에 성공했습니다.");
				rst = "true";
				break;
			}
		}else {
			redirectAttributes.addFlashAttribute("message", "코드 등록 권한이 없습니다.");
		}
		
		redirectAttributes.addFlashAttribute("rst", rst);
		return "redirect:/admin/code";
	}

}
