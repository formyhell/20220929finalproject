package kr.or.ddit.pms.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.pms.issue.service.IssueService;
import kr.or.ddit.pms.work.service.WorkService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IssueFileDownloadContoller {

	private final IssueService service;
	
	@RequestMapping("pms/{projId}/issue/{attId}/attatch")
	public String issueFileDownload(
		@PathVariable String projId	
		, @PathVariable String attId
		, Model model	
		) {
		
		AttatchVO attatch = service.issueFileDownload(attId);
		model.addAttribute("attatch", attatch);
		return "downloadView";
	}
}
