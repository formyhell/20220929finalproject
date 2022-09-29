package kr.or.ddit.common.alert.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.common.alert.dao.AlertDAO;
import kr.or.ddit.common.alert.service.AlertService;
import kr.or.ddit.common.alert.vo.AlertVO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RestController
@RequestMapping("/alert")
public class AlertController {
	
	@Inject
	AlertService service;
	@Inject
	AlertDAO dao;
	
	@GetMapping
	public List<AlertVO> alertView(Authentication authentication) {
		Map<String, Object> map = new HashMap<>();
		List<AlertVO> alertList = null;
		if(authentication.getName()!=null) {
		String memId = authentication.getName();
			map.put("alertReceiver", memId);
			alertList = service.retrieveAlertList(map);
		}
		return alertList;
	}
	
	@PutMapping(produces = "application/text; charset=utf8")
	public String alertUpdate(@RequestBody AlertVO alert, Authentication authentication) {
		String memId = authentication.getName();
		String message = null;
		AlertVO saved = dao.selectAlert(alert.getAlertNo());
		if(saved.getAlertReceiver().equals(memId)) {
			ServiceResult result = service.modifyAlert(alert);
			switch (result) {
			case OK:
				message = "알림이 읽음 처리되었습니다.";
				break;
			default:
				message = "다시 시도해주세요.";
				break;
			}
		}else {
			message = "알림을 읽음 처리할 권한이 없습니다.";
		}
		return message;
	}
	
	@DeleteMapping(produces = "application/text; charset=utf8")
	public String alertDelete(@RequestBody AlertVO alert, Authentication authentication){
		String memId = authentication.getName();
		String message = null;
		AlertVO saved = dao.selectAlert(alert.getAlertNo());
		if(saved.getAlertReceiver().equals(memId)) {
			ServiceResult result = service.removeAlert(alert.getAlertNo());
			switch (result) {
			case OK:
				message = "알림이 삭제 처리되었습니다.";
				break;
			default:
				message = "다시 시도해주세요.";
				break;
			}
		}else {
			message = "알림을 삭제 처리할 권한이 없습니다.";
		}
		return message;
	}

}
