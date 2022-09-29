package kr.or.ddit.pms.project.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.jws.Oneway;

import org.apache.commons.lang3.StringUtils;
import org.jasypt.util.password.PasswordEncryptor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.project.controller.RandomString;
import kr.or.ddit.pms.project.dao.PMSProjectDAO;
import kr.or.ddit.pms.project.vo.PMSProjectVO;
import kr.or.ddit.pms.project.vo.projInvolveVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class PMSProjectServiceImpl implements PMSProjectService {
	
	@Inject
	PMSProjectDAO PMSProjectDAO;
	
	@Resource(name="passwordEncryptor")
	private PasswordEncryptor passwordEncryptor;
	
	private void encryptPassword(PMSProjectVO PMSProject) {
		String plain = PMSProject.getProjPass();
		String encoded = passwordEncryptor.encryptPassword(plain);
		PMSProject.setProjPass(encoded);
	}
	
	@Transactional
	@Override
	public ServiceResult createPMSProject(PMSProjectVO PMSProject, String id) {
		RandomString randomString = new RandomString();
		int i = 15;
		String key = randomString.getRandomString(i);
		PMSProject.setProjKey(key);
		
		int rowcnt = PMSProjectDAO.insertPMSProject(PMSProject);
		
		log.info("vo에 값이 들어 오나 볼까요? {}", PMSProject);
		PMSProjectDAO.joinPMSProject(PMSProject.getProjId(), id);
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<PMSProjectVO> retrievePMSProjectList(PagingVO<PMSProjectVO> pagingVO) {
		
		pagingVO.setTotalRecord(PMSProjectDAO.selectTotalPMSProject(pagingVO));
		List<PMSProjectVO> PMSProjectList = PMSProjectDAO.selectPMSProjectList(pagingVO);
		pagingVO.setDataList(PMSProjectList);
		
		return PMSProjectList;
	}

	@Override
	public PMSProjectVO retrievePMSProject(String projId) {
		
		PMSProjectVO PMSProject = PMSProjectDAO.selectPMSProject(projId);
		if (projId == null) {
			throw new RuntimeException(String.format("%d 프로젝트 없음", projId));
		}
		PMSProjectDAO.selectPMSProject(projId);
		
		return PMSProject;
	}

//	@Transactional
	@Override
	public ServiceResult modifyPMSProject(PMSProjectVO pmsProject) {
		if (PMSProjectDAO.selectPMSProject(pmsProject.getProjId()) == null) {
			throw new RuntimeException(String.format("%d 프로젝트 없음", pmsProject.getProjId()));
		}
		
		int rowcnt = PMSProjectDAO.updatePMSProject(pmsProject);
		
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult deletePMSProject(PMSProjectVO pmsProject) {
		PMSProjectVO oneProject = PMSProjectDAO.selectPMSProject(pmsProject.getProjId());
		
		int rowcnt = 0;
		 
		if (oneProject != null) {
			if (oneProject.getProjPass().equals(pmsProject.getProjPass())) {
				rowcnt = PMSProjectDAO.deletePMSProject(pmsProject);
			}else{
				throw new RuntimeException("비밀번호 틀림");
			}
		}else {
			throw new RuntimeException(String.format("%d 프로젝트 없음", pmsProject.getProjId()));
		}
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<PMSProjectVO> createdPMSProject(PagingVO<PMSProjectVO> pagingVO, String projArchi) {
		pagingVO.setTotalRecord(PMSProjectDAO.selectCreatedTotal(projArchi));
		List<PMSProjectVO> PMSProjectList = PMSProjectDAO.createdProjectList(projArchi);
		pagingVO.setDataList(PMSProjectList);
		log.info("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+PMSProjectList);
		return PMSProjectList;
	}

	@Override
	public ServiceResult joinPMSProject(PMSProjectVO PMSProject, String id) {
		ServiceResult result = null;
		
		String inputKey = PMSProject.getProjKey();
		String projId = PMSProject.getProjId();
		
		
//		받은 아이디로 기존 프로젝트 검색
		PMSProjectVO oneProject = PMSProjectDAO.selectPMSProject(projId);
		
		
//		이미 참가한 프로젝트인지 확인
		
		int chek = PMSProjectDAO.joinCheck(projId, id);
		if (chek > 0) {
			result = ServiceResult.FAIL;
		}else {
//		프로젝트 키랑 입력받은 키랑 비교
			if (inputKey.equals(oneProject.getProjKey())) {
//			맞으면 프로젝트 참가하기
				PMSProjectDAO.joinPMSProject(projId, id);
				result = ServiceResult.OK;
			} else {
				log.info("뭐해야할지 모르니까 값이나 확인하자 projid : {}, 아이디 : {}", PMSProject.getProjId(), id);
				result = ServiceResult.INVALIDPASSWORD;
			}
			
		}
		return result;
	}
	
	@Transactional
	@Override
	public ServiceResult autoJoinPMSProject(PMSProjectVO PMSProject, String comId, String projPass) {
		ServiceResult result = null;
		String outProjId = PMSProject.getProjOutproj();
//		아웃소싱로젝트ID로 계약상태가 완료인 아웃소싱 프로젝트ID, 지원한 회원아이디, 프로젝트 이름, 프로젝트 등록자 조회  + 프로젝트 비밀번호 입력
		log.info("이제 프로젝트 조회 합니다!!!!!");
		log.info("아웃소싱 프로젝트 아이디 : {}", outProjId);
		PMSProject = PMSProjectDAO.selectOutProjData(outProjId);
//		조회한 데이터로 프로젝트 생성
		if (PMSProject != null) {
			log.info("이제 프로젝트 생성 합니다!!!!!");
			RandomString randomString = new RandomString();
			int i = 15;
			String key = randomString.getRandomString(i);
			PMSProject.setProjKey(key);
			PMSProject.setProjPass(projPass);
			PMSProjectDAO.insertPMSProject(PMSProject);
		} else {
			throw new RuntimeException("아웃소싱 프로젝트 검색 실패");
		}
//		생성한 프로젝트에 프로젝트 참가자 조회
		log.info("이제 프로젝트 참가자 조회 합니다!!!!!");
		log.info("아웃소싱 프로젝트 아이디 확인 : {}", outProjId);
		List<projInvolveVO> involve = PMSProjectDAO.selectOutProjInvolve(outProjId);
		log.info("이제 프로젝트 참가자 조회 끝");
		String projId = null;
		projInvolveVO pro = involve.get(0);
		projId = pro.getProjId();
		log.info("이거 뭔 값인지 확인 해야함 : {}, {}",projId, comId);
		
		
//		생성한 프로젝트에 프로젝트 참가자 추가
		if (involve.size() != 0) {
			log.info("이제 프로젝트 참가자 등록 합니다!!!!!");
			PMSProjectDAO.autoJoinPMSProject(involve);
			log.info("이제 프로젝트 생성자를 등록합니다~~~~");
			PMSProjectDAO.joinPMSProject(projId, comId);
			result = ServiceResult.OK;
		} else {
			throw new RuntimeException("프로젝트 참가자가 없음");
		}
		
		
		return result;
	}
	
	
	
	
	@Override
	public List<PMSProjectVO> joinPMSProjectList(PagingVO<PMSProjectVO> pagingVO, String id) {
		pagingVO.setTotalRecord(PMSProjectDAO.selectJoinTotal(id));
		
		List<PMSProjectVO> PMSProjectList = PMSProjectDAO.joinProjectList(pagingVO);
		pagingVO.setDataList(PMSProjectList);
		
		return PMSProjectList;
	}

}
