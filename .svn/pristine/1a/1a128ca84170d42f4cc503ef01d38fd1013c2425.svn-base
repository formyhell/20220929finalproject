package kr.or.ddit.common.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.member.dao.CommonCodeDAO;
import kr.or.ddit.common.vo.CommonCodeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonCodeController {
	
	@Inject
	CommonCodeDAO dao;
	
	@RequestMapping("/commonCode")
	public String CommonCode(Model model) {
		List<CommonCodeVO> contractStateList = dao.contractState();
		List<CommonCodeVO> gradeList = dao.grade();
		List<CommonCodeVO> locationList = dao.location();
		
		log.info("contractStateList" + contractStateList);
		log.info("gradeList" + gradeList);
		log.info("locationList" + locationList);
		
		model.addAttribute("contractStateList", contractStateList);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("locationList", locationList);
		
		return "common/member/commonCode";
	}
	
	
}
