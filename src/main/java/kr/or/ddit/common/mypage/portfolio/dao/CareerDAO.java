package kr.or.ddit.common.mypage.portfolio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.member.vo.CareerVO;

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
@Mapper
public interface CareerDAO {
	public List<CareerVO> selectAll(String memId);
	
	public CareerVO selectCareer(CareerVO career);
	
	public int insertCareer(CareerVO career);
	
	public int updateCar(CareerVO career);
	
	public int deleteCareer(int careerdNo);
}
