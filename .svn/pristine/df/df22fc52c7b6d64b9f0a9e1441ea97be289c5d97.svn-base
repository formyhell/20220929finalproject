package kr.or.ddit.admin.code.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.admin.code.dao.AdminCodeDAO;
import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.vo.CommonCodeVO;
import kr.or.ddit.common.vo.PagingVO;

@Transactional
@Service
public class AdminCodeServiceImpl implements AdminCodeService{
	@Inject
	AdminCodeDAO dao;

	@Override
	public List<CommonCodeVO> retrieveCodeList(Map<String, Object> map) {
		PagingVO<CommonCodeVO> pagingVO = (PagingVO<CommonCodeVO>) map.get("pagingVO");
		pagingVO.setTotalRecord(dao.selectTotalCode(map));
		List<CommonCodeVO> codeList = dao.selectCodeList(map);
		pagingVO.setDataList(codeList);
		map.put("pagingVO", pagingVO);
		return codeList;
	}

	@Override
	public ServiceResult createCode(CommonCodeVO code) {
		ServiceResult result = null;
		CommonCodeVO saved = dao.selectCode(code.getCodeId());
		if(saved==null) {
			int rowcnt = dao.insertCode(code);
			if(rowcnt > 0) {
				result = ServiceResult.OK;
			} else {
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.DUPLICATED;
		}
		return result;
	}

	@Override
	public ServiceResult modifyCode(CommonCodeVO code) {
		CommonCodeVO saved = dao.selectCode(code.getCodeId());
		if(saved==null)
			throw new RuntimeException(String.format("%d 공통코드 없음.",code.getCodeId()));
		
		int rowcnt = dao.updateCode(code);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeCode(String codeId) {
		CommonCodeVO saved = dao.selectCode(codeId);
		if(saved==null)
			throw new RuntimeException(String.format("%d 공통코드 없음.",codeId));
		int rowcnt = dao.deleteCode(codeId);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
