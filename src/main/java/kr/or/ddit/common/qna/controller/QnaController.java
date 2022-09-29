package kr.or.ddit.common.qna.controller;


import javax.inject.Inject;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.member.dao.CommonCodeDAO;
import kr.or.ddit.common.mypage.memInfo.service.MemInfoService;
import kr.or.ddit.common.qna.service.QnaService;
import kr.or.ddit.common.qna.vo.QnaVO;
import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 작성자명
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 2.      홍승조       컨트롤러 생성
 * 2022. 8. 4.		홍승조	insert url 연결
 * 2022. 8. 9.		고혜인	내용 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
public class QnaController {
	
	@Inject
	private QnaService service;
	

	
	@ModelAttribute("qna")
	public QnaVO qna() {
		return new QnaVO();
	}
	
	
	/**
	 * QNA 리스트 보기
	 * @return
	 */
	@GetMapping
	public String qnaList(
			@ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
//			, @RequestParam(value="searchType", required=false)String searchType
//			, @RequestParam(value="searchWord", required=false)String searchWord
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, Model model
	) {
		PagingVO<QnaVO> pagingVO = new PagingVO<>(10,5);
		pagingVO.setSimpleCondition(simpleCondition);
		
		pagingVO.setCurrentPage(currentPage);
		service.findAll(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		return "common/qna/qnaList";
	}
	
	@GetMapping("{qnaNo}")
	public String qnaView(
			@PathVariable int qnaNo
			, Model model
			) {
		
		
		QnaVO qna = service.findByPK(qnaNo);
		
		
		model.addAttribute("qna",qna);
		
		return "common/qna/qnaView";
	}

	@GetMapping("form") //새글작성 화면으로 이동
	public String qnaForm() {
		return "common/qna/qnaForm";
	}
	
	@PostMapping
	public String qnaInsert( /* 로그인 안하면 authMember.realMember.memId 500에러남 */
			@Validated(InsertGroup.class) @ModelAttribute("qna") QnaVO qna
			, Errors errors
			, Model model
			, RedirectAttributes redirectAttributes
			) {
		String viewName = null;
		if(!errors.hasErrors()) {
			service.create(qna);
			viewName = "redirect:/qna";
		} else {
			viewName = "common/qna/qnaForm";			
		}
		return viewName;
	}

	@GetMapping("{qnaNo}/form")
	public String qnaEdit(
			@PathVariable int qnaNo
			, Model model
	) {
//		if(!model.containsAttribute("qna")) {
			QnaVO qna = service.findByPK(qnaNo);
			model.addAttribute("qna", qna);
//		}
		
		return "common/qna/qnaEdit";
	}
	
	@PutMapping("{qnaNo}")
	public String qnaUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("qna") QnaVO qna
			, Errors errors
			, Model model
	) {
		String viewName = null;
		
		
		if (!errors.hasErrors()) {
			service.modify(qna);
			viewName = "redirect:/qna/{qnaNo}";
		} else {
			viewName = "common/qna/qnaEdit";
		}
		return viewName;
	}

	
	
	@DeleteMapping("{qnaNo}")
	public String qndDelete(
			@Validated(DeleteGroup.class) @ModelAttribute("qna") QnaVO qna
			, Errors errors
			, RedirectAttributes redirectAttributes
	) {
		String viewName = null;
		if(!errors.hasErrors()) {
			service.remove(qna.getQnaNo());
			redirectAttributes.addFlashAttribute("message", "삭제되었습니다");
			viewName = "redirect:/qna";
		} else {
			redirectAttributes.addFlashAttribute("message", "오류가 발생했습니다");
			viewName = "redirect:/qna/{qnaNo}";
		}
		
		return viewName;
	}
	
}
