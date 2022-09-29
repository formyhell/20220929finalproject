package kr.or.ddit.common.mypage.project.interestProject.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.mypage.project.interestProject.service.InterestProjectService;
import kr.or.ddit.common.mypage.project.interestProject.vo.InterestProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/gen/myinfo/interestProject/{projId}")
public class InsertInterestProjectController {
	
	private String getUri;
	
	@Inject 
	InterestProjectService interestProjectService;
	
	@GetMapping
	public String interestProjectView(Authentication authentication ) {
		if(authentication.getName() ==null) {
			return "common/mypage/gen/infoView";
		}else {
			return getUri;
		}
	}
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String,Object> checkinterestProject(
			Authentication authentication
			, @RequestParam(name="getURI", required=false) String getURI
			, @PathVariable String projId
			, Model model
	) {
		String uri = getURI;
		this.getUri = uri;
		String genId = authentication.getName();
		InterestProjectVO interest = new InterestProjectVO();
		interest.setInterestGenmem(genId);
		interest.setInterestProj(projId);
		InterestProjectVO check = interestProjectService.duplicateCheck(interest);
		Map<String,Object> data = new HashMap<String, Object>();
		if(check == null) {
			data.put("like", false);			
		}else {
			data.put("like", true);
		}
		return data;
	}
	
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String,Object> insertinterestProject(
		Authentication authentication
		, @RequestParam(name="getURI", required=false) String getURI
		, Model model
		, @PathVariable String projId
	){	
		this.getUri = getURI;
		String genId = authentication.getName();	
		String interestmessage = "";
		InterestProjectVO interest = new InterestProjectVO();
		interest.setInterestGenmem(genId);
		interest.setInterestProj(projId);
		boolean cheakInterest = interestProjectService.cheakInterest(interest);
		if(cheakInterest) {
			interestmessage = "관심 체크되었습니다.";
		}else {
			interestmessage = "관심 체크가 해제되었습니다.";
		}
		Map<String,Object> likeProj = new HashMap<String, Object>();
		likeProj.put("interestmessage", interestmessage);
		likeProj.put("cheakInterest", cheakInterest);
		return likeProj;
	}
}
