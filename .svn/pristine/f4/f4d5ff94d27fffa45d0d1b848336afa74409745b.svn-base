package kr.or.ddit.common.mypage.portfolio.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.mypage.memInfo.dao.MemberInfoDAO;
import kr.or.ddit.common.mypage.portfolio.dao.PortfolioDAO;
import kr.or.ddit.common.mypage.portfolio.vo.PfObjVO;
import kr.or.ddit.common.mypage.portfolio.vo.PfSkillVO;
import kr.or.ddit.common.mypage.portfolio.vo.PortfolioVO;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 고혜인
 * @since 2022. 8. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 19.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
public class PortfolioServiceImpl implements PortfolioService{
	
	@Inject
	PortfolioDAO dao;
	
	@Inject
	MemberInfoDAO memberInfoDAO;
	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	//파일 저장
	private int processAttaches(PortfolioVO pf) throws IOException {
		List<AttatchVO> attatchList = pf.getAttatchList();
		if(attatchList == null || attatchList.isEmpty()) {
			return 0;
		}
		
		int rowcnt = 0;
		for(AttatchVO attatch : attatchList) {
			rowcnt += dao.insertAttatches(attatch);
		}
		dao.insertPfAttatches(pf);
		
		for(AttatchVO attatch : attatchList) {
			attatch.saveTo(saveFolder);
		}
		return rowcnt;
	}
	//파일 삭제
	private void removeAttatches(PortfolioVO pf) {
		
		String[] delAttIds = pf.getDelAttIds();
		
		if(delAttIds == null || delAttIds.length == 0) {
			return ;
		}else {
			List<String> saveNames = Arrays.stream(delAttIds).map((attId)->{
										AttatchVO attatch = dao.selectAttatch(attId);
										return attatch.getAttSavename();
									}).collect(Collectors.toList());
			
			dao.deletePfAttatches(pf);
			
			log.info("첨부파일 삭제");
			
			dao.deleteAttatches(pf);
			log.info("첨부파일 메인 삭제");
			
			for(String saveName : saveNames) {
				File saveFile = new File(saveFolder, saveName);
				FileUtils.deleteQuietly(saveFile);
				
			}

		}
	}
	
//	사용 기술 저장
	private int processSkill(PortfolioVO pf) {
		List<PfSkillVO> skillList = pf.getSkillCodeList();
		
		if(skillList == null || skillList.isEmpty()) {
			return 1;
		}
		
		int inSkill = dao.insertPfSkill(pf);
		
		return inSkill;
	}
//	직무분야 저장
	private int processObj(PortfolioVO pf) {
		List<PfObjVO> objList = pf.getObjCodeList();
		if(objList == null || objList.isEmpty()) {
			return 1;
		}
		int inObj = dao.insertPfObj(pf);
		
		return inObj;
	}
	
//	기술 삭제
	private int deleteSkill(PortfolioVO pf) {
		String[] delSkillCodes = pf.getDelSkillCodes();
		
		if(delSkillCodes == null || delSkillCodes.length == 0) {
			return 1;
		}
		
		int delSkill = dao.deleteSkills(pf);
		
		return delSkill;
	}
//	직무분야 삭제
	private int deleteObj(PortfolioVO pf) {
		String[] delObjCodes = pf.getDelObjCodes();
		
		if(delObjCodes == null || delObjCodes.length == 0) {
			return 1;
		}
		int delObj = dao.deleteObjs(pf);
		
		return delObj;
	}
	
	@Transactional
	@Override
	public ServiceResult createPf(PortfolioVO pf) {
		List<AttatchVO> attatchList = pf.getAttatchList();
		log.info("확인용 attatchList : {}", attatchList);
		
		int rowcnt = dao.insertPf(pf);
		log.info("회원 정보 조회 : {}", pf);
		
		if(rowcnt > 0) {
			rowcnt += deleteSkill(pf);
			rowcnt += deleteObj(pf);
			rowcnt += processSkill(pf);
			rowcnt += processObj(pf);
		}
		
		try {
			if(pf.getAttatchList().size() != 0) {
				processAttaches(pf);
			}
		} catch (IOException e) {
			throw new RuntimeException(e);			
		}
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Transactional
	@Override
	public ServiceResult modifyPf(PortfolioVO pf) {
		PortfolioVO saved = dao.selectPf(pf.getPfId());
		
		if(saved == null) {
			throw new RuntimeException(String.format("%s 포트폴리오 없음", pf.getPfId()));
		}
		int rowcnt = deleteSkill(pf);
		rowcnt += deleteObj(pf);
		rowcnt += processSkill(pf);
		rowcnt += processObj(pf);
		
		rowcnt += dao.updatePf(pf);
		
		try {
			removeAttatches(pf);
			processAttaches(pf);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Transactional
	@Override
	public ServiceResult removePf(PortfolioVO pf) {
		
		PortfolioVO saved = dao.selectPf(pf.getPfId());
		
		int rowcnt = 0;
		if(saved != null) {
			removeAttatches(saved); //첨부파일 삭제
			
			rowcnt = dao.deleteObj(saved.getPfId()); 
			rowcnt *= dao.deleteSkill(saved.getPfId());
			rowcnt *= dao.deletePf(saved);
		} else {
			throw new RuntimeException(String.format("%s 포트폴리오 없음", pf.getPfId()));
		}
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

//	@Override
//	public List<PortfolioVO> findAllPf(PagingVO<PortfolioVO> pagingVO) {
//		pagingVO.setTotalRecord(dao.selectPfCount(pagingVO));
//		List<PortfolioVO> pfList = dao.selectPfList(pagingVO);
//		pagingVO.setDataList(pfList);
//		
//		return pfList;
//	}

	@Override
	public PortfolioVO retrievePf(String pfId) {
		PortfolioVO pf = dao.selectPf(pfId);
		log.info("PortfolioVO pf :: {}", pf);
		if(pf == null) {
			throw new RuntimeException("없는 포트폴리오입니다");
		} 
		
		List<AttatchVO> attatchList = dao.selectPfFileList(pf);
		
		pf.setAttatchList(attatchList); //첨부파일 넣어줌

		return pf;
	}

	@Override
	public AttatchVO downloadPf(String attId) {
		AttatchVO att = dao.selectAttatch(attId);
		
		if(att == null) {
			throw new RuntimeException(String.format("%s 첨부파일 없음", attId));
		}
		return att;
	}
	
	@Override
	public List<PortfolioVO> findAllPf(Map<String, Object> map) {
		PagingVO<PortfolioVO> pagingVO = (PagingVO<PortfolioVO>) map.get("pagingVO");
		pagingVO.setTotalRecord(dao.selectPfCount(map));

		List<PortfolioVO> portfolioList = dao.selectPfList(map);
		
		pagingVO.setDataList(portfolioList);
		map.put("pagingVO", pagingVO);
		
		return portfolioList;
	}


}
