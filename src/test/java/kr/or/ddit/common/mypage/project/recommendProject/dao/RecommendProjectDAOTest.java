package kr.or.ddit.common.mypage.project.recommendProject.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import kr.or.ddit.common.mypage.project.interestProject.vo.ProjectVO;
import kr.or.ddit.common.star.dao.AbstractTest;

public class RecommendProjectDAOTest extends AbstractTest {
	
	@Inject
	RecommendProjectDAO dao;
	
	//@Test
	public void testCheckProj() {
		fail("Not yet implemented");
	}

	//@Test
	public void testGetProj() {
		fail("Not yet implemented");
	}

	@Test
	public void testRecommendProjToMain() {
		List<ProjectVO> list = dao.recommendProjToMain();
		assertNotNull(list);
	}

}
