package kr.or.ddit.common.mypage.schedule.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.mypage.schedule.dao.ScheduleDAO;
import kr.or.ddit.common.mypage.schedule.vo.ScheduleVO;

/**
 * @author 작성자
 * @since 2022. 8. 13.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 13.   김유진              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Inject
	ScheduleDAO scheduleDao;
	
	ServiceResult result = null;
	
	@Override
	public List<ScheduleVO> retrieveScheduleList(String memId) {
		List<ScheduleVO> scheduleList = scheduleDao.selectScheduleList(memId);
		return scheduleList;
	}

	@Override
	public ServiceResult createSchedule(ScheduleVO schedule) {
		int rowcnt = scheduleDao.insertSchedule(schedule);
		if(rowcnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ScheduleVO retrieveSchedule(Integer scheNo) {
		ScheduleVO schedule = scheduleDao.selectSchedule(scheNo);
		return schedule;
	}

	@Override
	public ServiceResult modifySchedule(ScheduleVO schedule) {
		int rowcnt = scheduleDao.updateSchedule(schedule);
		if(rowcnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ServiceResult deleteSchedule(Integer scheNo) {
		int rowcnt = scheduleDao.deleteSchedule(scheNo);
		if(rowcnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

}
