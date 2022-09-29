package kr.or.ddit.common.mypage.schedule.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.mypage.schedule.vo.ScheduleVO;

@Mapper
public interface ScheduleDAO {

	/**
	 * 일정 list 조회
	 * @param memId
	 * @return
	 */
	public List<ScheduleVO> selectScheduleList(String memId);
	
	/**
	 * 타입, 프로젝트 조회
	 */
	public List<Map<String, Object>> selectTypeList();
	public List<Map<String, Object>> selectProjList(String memId);
	
	/**
	 * 일정 추가
	 * @param schedule
	 * @return
	 */
	public int insertSchedule(ScheduleVO schedule);

	/**
	 * 일정 하나 조회
	 * @param scheNo
	 * @return
	 */
	public ScheduleVO selectSchedule(Integer scheNo);
	
	/**
	 * 일정 수정
	 * @param schedule
	 * @return
	 */
	public int updateSchedule(ScheduleVO schedule);
	
	/**
	 * 일정 삭제
	 * @param scheNo
	 * @return
	 */
	public int deleteSchedule(Integer scheNo);
}
