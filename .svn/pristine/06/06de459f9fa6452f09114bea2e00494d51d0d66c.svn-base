package kr.or.ddit.admin.stats.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.admin.outsourcing.dao.CheckListDAO;
import kr.or.ddit.admin.stats.service.AdminStatsService;
import kr.or.ddit.common.member.dao.CommonCodeDAO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 작성자명
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.      홍승조       관리자 통계 컨트롤러 생성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("admin/stats")
public class AdminStatsController {
	
	@Inject
	AdminStatsService service;
	@Inject
	CheckListDAO chkDao;
	
	@GetMapping
	public String stats(Model model) {
		String year = Integer.toString(LocalDate.now().getYear());
		Map<String,Object> topMap = service.retrieveTop();
		Map<String, Object> trepMap = service.retrieveTrep();
		
		int ckCount = chkDao.selectAdminAll().size();
		int rckCount = chkDao.selectRequireAll().size();
		Map<String, Object> ckMap = new HashMap<String, Object>();
		ckMap.put("ckCount", ckCount);
		ckMap.put("rckCount", rckCount);

		List<Map<String,Object>> genJoinList = service.retrieveGenJoinList();
		List<Map<String,Object>> comJoinList = service.retrieveComJoinList();
		List<Map<String,Object>> skillList = service.retrieveSkillList();
		List<Map<String,Object>> outProjList = service.retrieveOutProjList();
		List<Map<String,Object>> pmsProjList = service.retrievePmsProjList();
		Map<String, Object> genMap = new HashMap<String, Object>();
		Map<String, Object> comMap = new HashMap<String, Object>();
		Map<String, Object> skillMap = new HashMap<String, Object>();
		Map<String, Object> outProjMap = new HashMap<String, Object>();
		Map<String, Object> pmsProjMap = new HashMap<String, Object>();
		
		for (Map<String, Object> map : genJoinList) {
			if(year.equals(map.get("M_DATE").toString().substring(0,4))) {
				String date = (String) map.get("M_DATE").toString().substring(5);
				Object sum = map.get("M_SUM");
				genMap.put(date, sum);
			}
		}
		for (Map<String, Object> map : comJoinList) {
			if(year.equals(map.get("M_DATE").toString().substring(0,4))) {
				String date = (String) map.get("M_DATE").toString().substring(5);
				Object sum = map.get("M_SUM");
				comMap.put(date, sum);
			}
		}
		for (Map<String, Object> map : skillList) {
			String sCode = (String) map.get("S_CODE");
			String sName = (String) map.get("S_NAME");
			Object sCount = map.get("S_COUNT");
			List<Object> sList = new ArrayList<>();
			sList.add(sName);
			sList.add(sCount);
			skillMap.put(sCode, sList);
		}
		for (Map<String, Object> map : outProjList) {
			if(year.equals(map.get("P_DATE").toString().substring(0,4))) {
				String pDate = (String) map.get("P_DATE").toString().substring(5);
				Object pCount = map.get("P_COUNT");
				outProjMap.put(pDate, pCount);
			}
		}
		for (Map<String, Object> map : pmsProjList) {
			if(year.equals(map.get("P_DATE").toString().substring(0,4))) {
				String pDate = (String) map.get("P_DATE").toString().substring(5);
				Object pCount = map.get("P_COUNT");
				pmsProjMap.put(pDate, pCount);
			}
		}
		
		model.addAttribute("topMap",topMap);
		model.addAttribute("trepMap",trepMap);
		model.addAttribute("ckMap",ckMap);
		model.addAttribute("genMap",genMap);
		model.addAttribute("comMap",comMap);
		model.addAttribute("skillMap",skillMap);
		model.addAttribute("outProjMap",outProjMap);
		model.addAttribute("pmsProjMap",pmsProjMap);
		return "admin/stats";
	}
	
	
}
