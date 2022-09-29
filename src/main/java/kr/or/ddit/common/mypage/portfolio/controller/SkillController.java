package kr.or.ddit.common.mypage.portfolio.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.mypage.portfolio.service.SkillService;
import kr.or.ddit.outsourcing.vo.OutProjVO;

/**
 * @author 조채원
 * @since 2022. 8. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 18.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/gen/myinfo/skill")
public class SkillController {
	@Inject
	SkillService service;
	
	@RequestMapping
	public String getPage() {
		return "common/mypage/gen/skill";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> get(@RequestParam Map<String, Object> paramMap) {
		List<Map<String, String>> skillList = service.findAll(paramMap);
		paramMap.put("skillList", skillList);
		return paramMap;
	}
	
	
}
