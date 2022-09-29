package kr.or.ddit.common.mypage.memInfo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.mypage.memInfo.service.MemInfoService;
import kr.or.ddit.common.star.dao.StarDAO;

@Controller
@RequestMapping("/gen/myinfo/left")
public class GenLeftMenu {
	
	@Inject
	MemInfoService service;

	@Inject
	StarDAO dao;
	
	@GetMapping
	public String interestProjectView(Authentication authentication) {
		return "includee/mypage/gen/genMyPageLeft";
	}  
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String,Object> memInfoView(Authentication authentication) {
		Map<String, Object> map = new HashMap<>();
		String genId = authentication.getName();
		GenMemberVO profile = service.retrieveGenMemInfo(genId);
		int done = dao.genDoneProj(genId);
		int progress = dao.genProgressProj(genId);
		map.put("genImg", profile.getGenImg());
		map.put("genNick", profile.getGenNick());
		map.put("genIntro", profile.getGenIntro());
		map.put("genGrd", profile.getGenGrd());
		map.put("completion", done);
		map.put("progress", progress);
		map.put("grade", profile.getGenRating());
		return map;
	}
}
