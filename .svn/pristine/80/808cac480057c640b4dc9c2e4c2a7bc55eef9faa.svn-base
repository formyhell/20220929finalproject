package kr.or.ddit.common.mypage.project.closedProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//(기업회원) '마감' 이 종료된 프로젝트 리스트를 불러옵니다. + 아직 모집은 완료된 상태가아니기때문에 마감기한을 늘려서 모집중인 프로젝트리스트로 이동시켜야함
/**
 * @author 신창규
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 2.      306-06       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/closed")
public class closedProjectListController {
	
	@GetMapping
	public String closedProjectList() {
		return "outsourcing/outsourcingList";
	}
	@GetMapping("23")
	public String closedProjectView() {
		return "outsourcing/outsourcingView";
	}
	
	@GetMapping("23/form")
	public String closedProjectEdit() {
		return "outsourcing/outsourcingEdit";
	}
	
	@PutMapping("23/form")
	public String closedProjectUpdate() {
		return "";
	}
		
}
