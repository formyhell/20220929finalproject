package kr.or.ddit.admin.stats.service;

import java.util.List;
import java.util.Map;

public interface AdminStatsService{
	
	public List<Map<String, Object>> retrieveGenJoinList();
	
	public List<Map<String, Object>> retrieveComJoinList();

	public List<Map<String, Object>> retrieveSkillList();
	
	public List<Map<String, Object>> retrieveOutProjList();
	
	public List<Map<String, Object>> retrievePmsProjList();
	
	public Map<String, Object> retrieveTop();
	
	public Map<String, Object> retrieveTrep();
	
}
