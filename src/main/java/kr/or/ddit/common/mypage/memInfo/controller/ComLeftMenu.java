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

import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.mypage.memInfo.service.MemInfoService;
import kr.or.ddit.common.star.dao.StarDAO;

@Controller
@RequestMapping("/com/myinfo/left")
public class ComLeftMenu {
	
	@Inject
	MemInfoService service;
	
	@Inject
	StarDAO dao;
	
	@GetMapping
	public String interestProjectView(Authentication authentication) {
		return "includee/mypage/com/comMyPageLeft";
	}  
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String,Object> genInfoView(Authentication authentication) {
		Map<String, Object> map = new HashMap<>();
		String comId = authentication.getName();
		// 회원정보
		ComMemberVO profile = service.retrieveComMemInfo(comId);
		map.put("comImg", profile.getComImg());
		map.put("comNick", profile.getComNick());
		map.put("comName", profile.getComComname());
		map.put("comGrd", profile.getComGrd());
		map.put("completion",dao.comDoneProj(comId));
		map.put("progress", dao.comProgressProj(comId));
		map.put("grade", profile.getComRating());
		return map;
	}
}
