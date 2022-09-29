package kr.or.ddit.common.mypage.portfolio.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.member.vo.CareerVO;
import kr.or.ddit.common.mypage.portfolio.dao.CareerDAO;
import lombok.RequiredArgsConstructor;
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
@Service
@RequiredArgsConstructor
public class CareerServiceImpl implements CareerService {
	private final CareerDAO carDao;

	@Override
	public List<CareerVO> findAll(String memId) {
		return carDao.selectAll(memId);
	}

	@Override
	public CareerVO create(CareerVO car) {
		if(car == null) {
			throw new RuntimeException("입력한 값이 없습니다.");
		}
		int rowcnt = carDao.insertCareer(car);
		if(rowcnt < 1) {
			throw new RuntimeException("등록에 실패했습니다.");
		} 
		return carDao.selectCareer(car);
	}

	@Override
	public void remove(int carNo) {
		carDao.deleteCareer(carNo);
	}

	@Override
	public CareerVO update(CareerVO car) {
		if(car == null) {
			throw new RuntimeException("입력한 값이 없습니다.");
		}
		int rowcnt = carDao.updateCar(car);
		if(rowcnt < 1) {
			throw new RuntimeException("등록에 실패했습니다.");
		} 
		return carDao.selectCareer(car);
	}

}
