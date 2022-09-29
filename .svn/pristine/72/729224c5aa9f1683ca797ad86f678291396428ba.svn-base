package kr.or.ddit.common.mypage.schedule.service;

import java.util.List;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.mypage.schedule.vo.ScheduleVO;

/**
 * @author 김유진
 * @since 2022. 8. 13.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 13.       김유진              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface ScheduleService {
	/**
	 * 일정 list 조회
	 * @param memId
	 * @return
	 */
	public List<ScheduleVO> retrieveScheduleList(String memId);
	
	/**
	 * 일정 추가
	 * @param schedule
	 * @return
	 */
	public ServiceResult createSchedule(ScheduleVO schedule);

	/**
	 * 일정 하나 조회
	 * @param scheNo
	 * @return
	 */
	public ScheduleVO retrieveSchedule(Integer scheNo);
	
	/**
	 * 일정 수정
	 * @param schedule
	 * @return
	 */
	public ServiceResult modifySchedule(ScheduleVO schedule);
	
	/**
	 * 일정 삭제
	 * @param scheNo
	 * @return
	 */
	public ServiceResult deleteSchedule(Integer scheNo);

}
