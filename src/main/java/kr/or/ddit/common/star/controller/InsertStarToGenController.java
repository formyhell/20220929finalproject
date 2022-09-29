package kr.or.ddit.common.star.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.star.service.StarService;
import kr.or.ddit.common.star.vo.StarToGenVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/star")
public class InsertStarToGenController {

	@Inject
	StarService starservice;
	
	@GetMapping
	public String interestProjectView(Authentication authentication) {
		return "common/mypage/gen/project/recommendProject/recommendproject";
	}  
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<StarToGenVO> workerList(
			Authentication authentication
			, @RequestParam(name="projId") String projId
	) {
		String genId = authentication.getName();
		List<StarToGenVO> workerList = starservice.workerList(genId,projId);
		return workerList;
	}
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Boolean insertStar(
		@RequestParam Map<String,String> param
	){
		Iterator<String> genIds = param.keySet().iterator();
		while(genIds.hasNext()) {
			String genId = genIds.next();
			int newRating =Integer.parseInt(param.get(genId));
			log.info("newRating: "+ newRating);
			starservice.newRating(genId, newRating);
		}
		return true;
	}
}
