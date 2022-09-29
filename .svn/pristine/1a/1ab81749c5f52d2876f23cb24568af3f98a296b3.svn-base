package kr.or.ddit.common.star.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.star.dao.StarDAO;
import kr.or.ddit.common.star.vo.StarToGenVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StarServiceImpl implements StarService{
	
	public final StarDAO starDAO;
	
@Override
	public boolean newRating(String genId, int newRating) {
		double oldRating = checkRating(genId);
		int countProj = 0;
		if(starDAO.checkGenOrCom(genId)>0) {			
			countProj = starDAO.genDoneProj(genId);
		}else {
			countProj = starDAO.comDoneProj(genId);			
		}
		double sum = oldRating*countProj;
		double result = (sum+newRating)/(countProj+1);
		HashMap<String, Object> map = new HashMap<>();
		map.put("genId", genId);
		map.put("newRating", result);
		return starDAO.updateRating(map);
	}

	@Override
	public double checkRating(String genId) {
		double rating = starDAO.selectRating(genId);
		return rating;
	}

	@Override
	public List<StarToGenVO> workerList(String genId,String projId) {
		Map<String,Object> map = new HashMap<>();
		map.put("genId", genId);
		map.put("projId",projId);
		List<StarToGenVO> workerList = starDAO.workerList(map);
		return workerList;
	}
}
