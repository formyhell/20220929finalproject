package kr.or.ddit.common.mypage.portfolio.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.member.vo.CareerVO;
import kr.or.ddit.common.member.vo.LicenseVO;
import kr.or.ddit.common.member.vo.MemberPrincipal;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.portfolio.service.CareerService;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 조채원
 * @since 2022. 8. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 20.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/gen/myinfo/career")
public class CareerController {
	@Inject
	CareerService service;
	
	@RequestMapping
	public String processHTML() {
		return "common/mypage/gen/career";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<CareerVO> getCarList(Authentication authentication) {
		MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
		MemberVO member = userPrincipal.getRealMember();
		String memId = member.getMemId();
		List<CareerVO> carList = service.findAll(memId);
		return carList;
	}
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public CareerVO insertCar(
			@Validated(InsertGroup.class) @ModelAttribute CareerVO carOld
			, Errors errors
			, Authentication authentication) {
		String viewName = null;
		carOld.setCarSdate(carOld.getCarSdate().toString());
		carOld.setCarFdate(carOld.getCarFdate().toString());
		boolean valid =  !errors.hasErrors();
		CareerVO car = null;
		if(valid) {
			MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
			MemberVO member = userPrincipal.getRealMember();
			String memId = member.getMemId();
			carOld.setCarMem(memId);
			car = service.create(carOld);
		}
		return car;
	}
	
	@PutMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public CareerVO updateCar(
			@Validated(UpdateGroup.class) @RequestBody CareerVO career
			, Errors errors
			, Authentication authentication 
			) {
		career.setCarSdate(career.getCarSdate().toString());
		career.setCarFdate(career.getCarFdate().toString());
		
		
		boolean valid =  !errors.hasErrors();
		CareerVO car = null;
		if(valid) {
			MemberPrincipal userPrincipal = (MemberPrincipal) authentication.getPrincipal();
			MemberVO member = userPrincipal.getRealMember();
			String memId = member.getMemId();
			career.setCarMem(memId);
			car = service.update(career);
		}
		return car;
	}
	
	@GetMapping("{carNo}")
	public String deleteLic(@PathVariable int carNo) {
		service.remove(carNo);	
		return "redirect:/gen/myinfo/career";
	}
}
