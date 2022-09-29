package kr.or.ddit.pms.issue.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.issue.service.IssueService;
import kr.or.ddit.pms.issue.vo.IssueReplyVO;
import kr.or.ddit.pms.issue.vo.IssueVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 김유진
 * @since 2022. 8. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 24.       김유진              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@RestController //비동기방식, 값만 받아옴
@RequestMapping("/pms/{projId}/issue/{issueId}/reply")
public class IssueReplyController {
	
	@Inject
	IssueService service;
	
	@GetMapping
	public Map<String, Object> replyView(
		@PathVariable String issueId
		, @RequestParam(name="page", required=false, defaultValue="1")int currentPage	
	) {
		PagingVO<IssueReplyVO> pagingVO = new PagingVO<>(3, 3);
		pagingVO.setCurrentPage(currentPage);
		Map<String, Object> map = new HashMap<>();
		
		map.put("pagingVO", pagingVO);
		map.put("issueId", issueId);

		List<IssueReplyVO> replyList = service.retrieveIssueReplyList(map);
		
		map.put("replyList", replyList);
		
		log.info("replyList: {}",replyList);
		
		return map;
	}
	
	@PostMapping(produces = "application/text; charset=utf8")
	public String replyInsert(
		@Validated(InsertGroup.class) @RequestBody IssueReplyVO reply
		, Errors errors
	) {
		log.info("댓글 등록~~~~~~~~~~~~~ {}",reply);
		
		String message = null;
		
		if(!errors.hasErrors()) {
			ServiceResult result = service.createIssueReply(reply);
			
			switch (result) {
			case OK:
				log.info("insert 성공 =====>> " + reply);				
				message = "등록되었습니다.";
				break;

			default:
				log.info("insert 실패 =====>> " + reply);
				message = "다시 시도해주세요.";
				break;
			}
		}else {
			log.info("누락실패");
			message = "다시 시도해주세요. 필수 값이 누락되었습니다.";
		}
		return message;
	}
	
	@PutMapping(produces = "application/text; charset=utf8")
	public String replyUpdate(
		@Validated(UpdateGroup.class) @RequestBody IssueReplyVO reply
		, Errors errors
	){
		log.info("댓글 수정~~~~~~~~~~~~~ {}",reply);

		String message = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyIssueReply(reply);
			switch (result) {
			case OK:
				log.info("Update 성공 =====>> " + reply);				
				message = "수정되었습니다.";
				break;

			default:
				log.info("Update 실패 =====>> " + reply);
				message = "다시 시도해주세요.";
				break;
			}
		}else {
			log.info("누락실패");
			message = "다시 시도해주세요. 필수 값이 누락되었습니다.";
		}
		return message;
		
	}
	
	@DeleteMapping(produces = "application/text; charset=utf8")
	public String replyDelete(
		@Validated(DeleteGroup.class) @RequestBody IssueReplyVO reply
		, Errors errors
	){
		Integer repNo = reply.getRepNo();
		
		log.info("댓글 삭제~~~~~~~~~~~~~ {}",reply);

		String message = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.removeIssueReply(repNo);
			switch (result) {
			case OK:
				log.info("delete 성공 =====>> " + reply);				
				message = "삭제되었습니다.";
				break;

			default:
				log.info("delete 실패 =====>> " + reply);
				message = "다시 시도해주세요.";
				break;
			}
		}else {
			log.info("누락실패");
			message = "다시 시도해주세요. 필수 값이 누락되었습니다.";
		}
		return message;
	}
	

}
