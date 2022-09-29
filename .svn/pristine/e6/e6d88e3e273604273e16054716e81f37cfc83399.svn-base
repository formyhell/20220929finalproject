package kr.or.ddit.common.notice.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.notice.dao.NoticeDAO;
import kr.or.ddit.common.notice.vo.NoticeVO;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDAO dao;

	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;

	@Transactional
	private int processAttaches(NoticeVO notice) throws IOException {
		List<AttatchVO> attatchList = notice.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return 0;
		}

		int rowcnt = 0;
		for (AttatchVO attatch : attatchList) {
			rowcnt += dao.insertAttatches(attatch);
		}
		dao.insertNotAttatches(notice);

		for (AttatchVO attatch : attatchList) {
			attatch.saveTo(saveFolder);
		}
		return rowcnt;
	}

	@Transactional
	private void removeAttatches(NoticeVO notice) {
		String[] delAttIds = notice.getDelAttIds();

		if (delAttIds == null || delAttIds.length == 0) {
			return;
		} else {
			List<String> saveNames = Arrays.stream(delAttIds).map((attId) -> {
				AttatchVO attatch = dao.selectAttatch(attId);
				return attatch.getAttSavename();
			}).collect(Collectors.toList());

			dao.deleteNotAttatches(notice);
			dao.deleteAttatches(notice);

			for (String saveName : saveNames) {
				File saveFile = new File(saveFolder, saveName);
				FileUtils.deleteQuietly(saveFile);
			}
		}
	}

	@Override
	public ServiceResult createNotice(NoticeVO notice) {
		int rowcnt = dao.insertNotice(notice);

		try {
			if (notice.getAttatchList().size() != 0) {
				processAttaches(notice);
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Transactional
	@Override
	public ServiceResult modifyNotice(NoticeVO notice) {
		NoticeVO saved = dao.selectNotice(notice.getNotNo());

		if (saved == null) {
			throw new RuntimeException("없는 공지");
		}
		int rowcnt = dao.updateNotice(notice);

		try {
			removeAttatches(notice);
			processAttaches(notice);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeNotice(NoticeVO notice) {

		NoticeVO saved = dao.selectNotice(notice.getNotNo());

		if (saved == null) {
			throw new RuntimeException("없는 공지");
		}

		removeAttatches(notice);
		int rowcnt = dao.deleteNotice(notice);

		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<NoticeVO> findAllNotice(PagingVO<NoticeVO> pagingVO) {
		pagingVO.setTotalRecord(dao.selectNoticeCount(pagingVO));
		List<NoticeVO> noticeList = dao.selectNoticeList(pagingVO);
		pagingVO.setDataList(noticeList);

		return noticeList;
	}

	@Override
	public List<NoticeVO> adminFindAllNotice(PagingVO<NoticeVO> pagingVO) {
		pagingVO.setTotalRecord(dao.adminSelectNoticeCount(pagingVO));
		List<NoticeVO> noticeList = dao.adminSelectNoticeList(pagingVO);
		pagingVO.setDataList(noticeList);

		return noticeList;
	}

	@Transactional
	@Override
	public NoticeVO retrieveNotice(int notNo) {
		NoticeVO notice = dao.selectNotice(notNo);

		if (notice == null) {
			throw new RuntimeException("없는 공지");
		}

		List<AttatchVO> attatchList = dao.selecNotFileList(notice);
		notice.setAttatchList(attatchList);

		// 부모글 정보 얻어오기
		
		NoticeVO parent = null;
		if(notice.getNotParentno() != null) {
			parent = dao.selectNotice(notice.getNotParentno());
			if(parent != null) {
				notice.setParent(parent);
			}
		} 
		dao.hitNotice(notice);

		return notice;
	}

	@Override
	public AttatchVO downloadNotice(String attId) {
		AttatchVO att = dao.selectAttatch(attId);

		if (att == null) {
			throw new RuntimeException("첨부파일 없음");
		}
		return att;
	}

	@Override
	public List<NoticeVO> parentNotice() {
		List<NoticeVO> parentList = dao.parentList();
		
		return parentList;
	}

}
