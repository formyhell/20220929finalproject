package kr.or.ddit.pms.work.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.PagingVO;
import kr.or.ddit.pms.issue.vo.IssueReplyVO;
import kr.or.ddit.pms.issue.vo.IssueVO;
import kr.or.ddit.pms.work.dao.WorkDAO;
import kr.or.ddit.pms.work.vo.WorkReplyVO;
import kr.or.ddit.pms.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class WorkServiceImpl implements WorkService{
	
	@Inject
	WorkDAO workDAO;
	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	@PostConstruct
	public void init() throws IOException{
		log.info("주입된 저장 경로 : {}", saveFolder.getCanonicalPath());
	}
	
	private void workCommonCode(WorkVO work) {
		
		log.info("여기는 공통코드 가져오는곳 이곳을 왔나요?");
		work.setWorkTypeList(workDAO.selectWorkTypeList());
		work.setWorkPriorityList(workDAO.selectWorkPriorityList());
		work.setWorkStateList(workDAO.selectWorkStateList());
	}
	
	
	// 파일 저장 메서드
	@Transactional
	private int processAttatches(WorkVO work) throws IOException {
		List<AttatchVO> attatchList = work.getAttatchList();
		if(attatchList==null || attatchList.isEmpty()) return 0;
		
		int rowcnt = 0; // ATTATCH
		log.info("이제 첨부파일 업로드 시작함~~~~~~~");
		
		for (AttatchVO attatch : attatchList) {
			rowcnt += workDAO.insertAttatches(attatch);
		}
		log.info("일감 첨부파일에 저장 시작함~~~~~~");
		workDAO.insertWorkAttatch(work);
		
		// 2진 데이터(파일 자체) 저장 : d:/saveFiles
		for(AttatchVO attatch : attatchList) {
			attatch.saveTo(saveFolder);
		}
		return rowcnt;
	}
	@Transactional
	private void removeAttatches(WorkVO work) {
		String[] delAttNos = work.getDelAttNos();
		log.info("!!!!!!!!!!!asdasd!!!!!!!!!!!!!"+ work.getDelAttNos());
		if(delAttNos==null || delAttNos.length == 0) return;
		
		List<String> saveNames = Arrays.stream(delAttNos).map((attId)->{
											AttatchVO attatch = workDAO.selectAttatch(attId);
											return attatch.getAttSavename();
										}).collect(Collectors.toList());
		workDAO.deleteWorkAttatches(work);
		workDAO.deleteAttatches(work);
		
		for(String saveName : saveNames) {
			File saveFile = new File(saveFolder, saveName);
			FileUtils.deleteQuietly(saveFile);
		}
	}
	
	@Transactional
	@Override
	public ServiceResult createWork(WorkVO work) {
		List<AttatchVO> attatchList = work.getAttatchList();
		log.info("첨부파일 리스트 !!!!!!!!!!!!!!!!!!!!" + attatchList);
		
		int rowcnt = workDAO.insertWork(work);
		workCommonCode(work);
		log.info("일감 정보 저장할 vo{}", work.getAttatchList().size());
		try {
			if (work.getAttatchList().size() != 0) {
				processAttatches(work);
//				workDAO.insertWorkAttatch(work);
				log.info("파일 업로드는 완료 다음으로 넘어가요~~~~");
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	
	@Override
	public List<WorkVO> rertieveWorkList(PagingVO<WorkVO> pagingVO) {
		
		pagingVO.setTotalRecord(workDAO.selectTotalWork(pagingVO));
		List<WorkVO> workList = workDAO.selectWorkList(pagingVO);
		pagingVO.setDataList(workList);
		
		return workList;
	}

	@Override
	public WorkVO retrieveWork(WorkVO work) {
		
		work = workDAO.selectWork(work);
		
		if (work.getWorkId() == null) {
			throw new RuntimeException(String.format("%d 일감 없음", work.getWorkId()));
		}
		workDAO.selectWork(work);
		List<AttatchVO> workFileList = workDAO.selectWorkFileList(work);
		work.setAttatchList(workFileList);
		workCommonCode(work);
		log.info("((((((((((((((((((((((((((((("+work.getAttatchList());
		return work;
	}

	@Override
	public ServiceResult modifyWork(WorkVO work) {
		
		if (workDAO.selectWork(work)== null) {
			throw new RuntimeException(String.format("%d 일감 없음", work.getWorkId()));
		}
		
		int rowcnt = workDAO.updateWork(work);
		try {
				removeAttatches(work);
				processAttatches(work);
				
				log.info("파일 업로드는 완료 다음으로 넘어가요~~~~");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		return rowcnt >0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult deleteWork(WorkVO work) {
		
		WorkVO oneWork = workDAO.selectWork(work);
		
		int rowcnt = 0;
		
		if (oneWork != null) {
			rowcnt = workDAO.deleteWork(oneWork);
		} else {
			throw new RuntimeException(String.format("%d 일감 없음", work.getWorkId()));
		}
		
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}


	@Override
	public AttatchVO workFileDownload(String attId) {
		AttatchVO attatch = workDAO.selectAttatch(attId);
		if (attatch == null) {
			throw new RuntimeException(String.format("%s 첨부파일이 없음", attId));
		}
		
		return attatch;
	}

	@Override
	public List<WorkVO> parentWork(String workProj) {
		
		List<WorkVO> parentWorkList = workDAO.selectWorkTiltleList(workProj);
		
		
		return parentWorkList;
	}
	// 간트 차트
	@Override
	public List<WorkVO> ganttWork(WorkVO work) {
		
		List<WorkVO> ganttWorkList = workDAO.ganttList(work);
		
		return ganttWorkList;
	}
	
	// 본인이 등록 한 일감 목록
	@Override
	public List<WorkVO> involveWorkList(PagingVO<WorkVO> pagingVO) {
		pagingVO.setTotalRecord(workDAO.involveTotal(pagingVO));
		List<WorkVO> involveWorkList = workDAO.involveWorkList(pagingVO);
		pagingVO.setDataList(involveWorkList);
		
		return involveWorkList;
	}
	
	
	// 댓글
	@Override
	public ServiceResult createWorkReply(WorkReplyVO reply) {
		int rowcnt = workDAO.insertWorkReply(reply);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyWorkReply(WorkReplyVO reply) {
		WorkReplyVO workReply = workDAO.selectWorkReply(reply.getRepNo());
		if(workReply==null)
			throw new RuntimeException(String.format("%d 댓글 없음.",reply.getRepNo()));
		int rowcnt = workDAO.updateWorkReply(reply);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeWorkReply(int repNo) {
		WorkReplyVO workReply = workDAO.selectWorkReply(repNo);
		if(workReply==null)
			throw new RuntimeException(String.format("%d 댓글 없음.",repNo));
		int rowcnt = workDAO.deleteWorkReply(repNo);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<WorkReplyVO> retrieveWorkReplyList(Map<String, Object> map) {
		PagingVO<WorkReplyVO> pagingVO = (PagingVO<WorkReplyVO>) map.get("pagingVO");
		pagingVO.setTotalRecord(workDAO.selectTotalWorkReply(map));
		List<WorkReplyVO> replyList = workDAO.selectWorkReplyList(map);
		pagingVO.setDataList(replyList);
		map.put("pagingVO", pagingVO);
		return replyList;
	}

	@Override
	public WorkReplyVO retrieveWorkReply(int repNo) {
		WorkReplyVO reply = workDAO.selectWorkReply(repNo);
		if(reply==null)
			throw new RuntimeException(String.format("%d 댓글 없음.",repNo));
		return reply;
	}
	
	
	
	
	
	
	
	
	
	
	
}



















