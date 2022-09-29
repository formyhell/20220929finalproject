package kr.or.ddit.pms.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.pms.work.service.WorkService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class WorkFileDownloadContoller {
	
	private final WorkService service;
	
	@RequestMapping("pms/{projId}/work/{attId}/attatch")
	public String workFileDownload(
		@PathVariable String projId	
		, @PathVariable String attId
		, Model model	
		) {
		
		AttatchVO attatch = service.workFileDownload(attId);
		model.addAttribute("attatch", attatch);
		return "downloadView";
		
	}
	
	
	
}
