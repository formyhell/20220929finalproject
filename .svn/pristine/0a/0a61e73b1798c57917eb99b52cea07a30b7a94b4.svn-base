package kr.or.ddit.admin.stats.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.admin.stats.dao.AdminStatsDAO;

@Service
public class AdminStatsServiceImpl implements AdminStatsService{
	
	@Inject
	AdminStatsDAO dao;

	@Override
	public List<Map<String, Object>> retrieveGenJoinList() {
		return dao.selectGenJoinList();
	}

	@Override
	public List<Map<String, Object>> retrieveComJoinList() {
		return dao.selectComJoinList();
	}

	@Override
	public List<Map<String, Object>> retrieveSkillList() {
		return dao.selectSkillList();
	}

	@Override
	public List<Map<String, Object>> retrieveOutProjList() {
		return dao.selectOutProjList();
	}

	@Override
	public List<Map<String, Object>> retrievePmsProjList() {
		return dao.selectPmsProjList();
	}

	@Override
	public Map<String, Object> retrieveTop() {
		return dao.selectTop();
	}

	@Override
	public Map<String, Object> retrieveTrep() {
		return dao.selectTrep();
	}


}
