package kr.or.ddit.common.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.common.community.service.CommunityReplyService;
import kr.or.ddit.common.community.vo.CommunityReplyVO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController //비동기 방식, 값만 받아옴
@RequestMapping("/community/{cmntNo}/reply")
public class CommunityReplyController {

	@Inject
	private CommunityReplyService service;

	@GetMapping
	public Map<String, Object> cmntReplyView(
			@PathVariable int cmntNo
			, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
	) {
		PagingVO<CommunityReplyVO> pagingVO = new PagingVO<>(5,5);
		pagingVO.setCurrentPage(currentPage);
		Map<String, Object> repMap = new HashMap<>();
		
		repMap.put("pagingVO", pagingVO);
		repMap.put("cmntNo", cmntNo);
		
		
		List<CommunityReplyVO> repList = service.retrieveCmntReplyList(repMap);
		
		repMap.put("repList", repList);
		
		return repMap;
	}
	
	@PostMapping(produces = "application/text; charset=utf8")
	public String cmntReplyInsert(
			@Validated(InsertGroup.class) @RequestBody CommunityReplyVO reply
			, Errors errors
	){
		log.info("cmntReplyInsert ==> {}", reply);
		
		String message = null;
		
		if(!errors.hasErrors()) {
			ServiceResult result = service.createCmntReply(reply);
			
			switch (result) {
			case OK:
				log.info("cmntReplyInsert 성공 : {}", reply);
				message = "등록되었습니다";
				break;

			default:
				log.info("cmntReplyInsert 실패 : {}", reply);
				message = "다시 시도해주세요";
				
				break;
			}
		} else {
			message ="내용을 입력해주세요";
		}
		
		return message;
	}
	
	@PutMapping(produces = "application/text; charset=utf8")
	public String cmntReplyUpdate(
			@Validated(UpdateGroup.class) @RequestBody CommunityReplyVO reply
			, Errors errors
	) {
		String message = null;
		
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyCmntReply(reply);
			
			switch (result) {
			case OK:
				log.info("댓글 수정 컨트롤러");
				message = "수정 완료== controller";
				break;

			default:
				log.info("댓글 수정 컨트롤러 실패");
				message = "다시 시도해주세요";
				break;
			}
		} else {
			log.info("댓글 수정 컨트롤러 값 입력안함");
			message = "수정되지 않았습니다";
		}
		
		return message;
	}
	
	@DeleteMapping(produces = "application/text; charset=utf8")
	public String cmntReplyDelete(
			@Validated(DeleteGroup.class) @RequestBody CommunityReplyVO reply
			, Errors errors
	) {
		String message = null;
		
		if(!errors.hasErrors()) {
			ServiceResult result = service.removeCmntReply(reply.getRepNo());
			
			switch (result) {
			case OK:
				log.info("cmntReplyDelete ===> {}", reply);
				message = "삭제되었습니다";
				
				break;

			default:
				log.info("삭제 실패 ===> {}", reply);
				message = "다시 시도해주세요";
				break;
			}
		} else {
			log.info("필수값 누락, 삭제 실패");
			message = "삭제되지 않았습니다";
		}
		
		return message;
	}
}
