package kr.or.ddit.common.notice.controller;

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

import kr.or.ddit.common.notice.service.NoticeService;
import kr.or.ddit.common.notice.vo.NoticeVO;
import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;

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
 * 2022. 8. 4.      홍승조       insert url 연결
 * 2022. 8. 6.      홍승조       컨트롤러 통합
 * 2022. 8. 22.     고혜인       내용 작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Inject
	private NoticeService service;
	
	@ModelAttribute("notice")
	public NoticeVO notice() {
		return new NoticeVO();
	}
	

	@GetMapping
	public String noticeList(
			@ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, Model model
	) {
		PagingVO<NoticeVO> pagingVO = new PagingVO<>(10,5);
		pagingVO.setSimpleCondition(simpleCondition);
		pagingVO.setCurrentPage(currentPage);
		service.findAllNotice(pagingVO);
		model.addAttribute("pagingVO",pagingVO);
		
		return "common/notice/noticeList";
	}
	
	@GetMapping("{notNo}")
	public String noticeView(
			@PathVariable int notNo
			, Model model
	) {
		NoticeVO notice = service.retrieveNotice(notNo);
		model.addAttribute("notice", notice);
		
		return "common/notice/noticeView";
	}
	
	@GetMapping("{notNo}/att/{attId}")
	public String noticeFileDownload(
			@PathVariable int notNo
			, @PathVariable String attId
			, Model model
	) {
		AttatchVO attatch = service.downloadNotice(attId);
		model.addAttribute("attatch", attatch);
		
		return "downloadView";
	}
	
}
