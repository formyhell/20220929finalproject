package kr.or.ddit.common.star.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;

import kr.or.ddit.common.star.vo.StarToGenVO;

public class StarDAOTest extends AbstractTest{
	
	@Inject
	StarDAO dao;
	
	//@Test
	public void testUpdateRating() {
		fail("Not yet implemented");
	}

	//@Test
	public void testSelectRating() {
		fail("Not yet implemented");
	}

	//@Test
	public void testCountDoneProj() {
		fail("Not yet implemented");
	}

	@Test
	public void testWorkerList() {
		Map<String,Object> daoMap = new HashMap<>();
		daoMap.put("projId","PMS2208040001");
		daoMap.put("genId", "test5ID");
		List<StarToGenVO> workerList = dao.workerList(daoMap);
		assertNull(workerList);
	}

}
