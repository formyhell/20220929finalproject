package kr.or.ddit.common.mypage.project.recommendProject.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.common.mypage.project.recommendProject.service.RecommendProjectService;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.common.vo.SimpleSearchCondition;

@Controller
@RequestMapping("/gen/myinfo/recommendProject")
public class RecommendProjectController {
	
	@Inject
	private RecommendProjectService recommendProjectService;
	
	@ModelAttribute("simpleCondition")
	public SimpleSearchCondition simpleCondition() {
		return new SimpleSearchCondition();
	}
	
	@GetMapping
	public String recommendProjectView(Authentication authentication) {
		if(authentication.getName() ==null) {
			return "common/mypage/gen/infoView";
		}
		return "common/mypage/gen/project/recommendProject/recommendproject";
	}  
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<ProjectVO> recommendProjectList(
			Authentication authentication
			, @RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, @ModelAttribute("simpleCondition") SimpleSearchCondition simpleCondition
			, Model model
	) {
		String genId = authentication.getName();
		PagingVO<ProjectVO> pagingVO = new PagingVO<>(6,10);
		pagingVO.setCurrentPage(currentPage);
		recommendProjectService.selectProjectList(pagingVO, genId);
		boolean pagingList = false;
		if(pagingVO.getTotalRecord()>pagingVO.getScreenSize()) {
			pagingList=true;
		}
		model.addAttribute("pagingList", pagingList);
		return pagingVO;
	}
	
	
}
