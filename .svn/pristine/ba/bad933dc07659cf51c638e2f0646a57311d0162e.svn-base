package kr.or.ddit.outsourcing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.outsourcing.service.OutProjService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OutProjFileDownloadController {
	
	private final OutProjService service;
	
	@RequestMapping("outsourcing/{projId}/project/{attId}/attatch")
	public String outProjFileDownload(
			@PathVariable String projId	
			, @PathVariable String attId
			, Model model
			) {
			AttatchVO attatch = service.outProjFileDownload(attId);
			model.addAttribute("attatch", attatch);
			return "downloadView";
	}
}
