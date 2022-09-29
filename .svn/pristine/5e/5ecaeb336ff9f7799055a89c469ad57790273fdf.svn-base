package kr.or.ddit.pms.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.pms.report.service.reportService;
import kr.or.ddit.pms.work.service.WorkService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReportFileDownloadContoller {
	
	private final reportService service;
	
	@RequestMapping("pms/{projId}/report/{attId}/attatch")
	public String workFileDownload(
		@PathVariable String projId	
		, @PathVariable String attId
		, Model model	
		) {
		
		AttatchVO attatch = service.reportFileDownload(attId);
		model.addAttribute("attatch", attatch);
		return "downloadView";
		
	}
	
	
	
}
