package kr.or.ddit.common.alert.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.alert.dao.AlertDAO;
import kr.or.ddit.common.alert.vo.AlertVO;
import kr.or.ddit.common.enumpkg.ServiceResult;

@Service
public class AlertServiceImpl implements AlertService{

	@Inject
	AlertDAO dao;
	
	@Override
	public List<AlertVO> retrieveAlertList(Map<String, Object> map) {
		return dao.selectAlertList(map);
	}

	@Override
	public ServiceResult createAlert(AlertVO alert) {
		int rowcnt = dao.insertAlert(alert);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyAlert(AlertVO alert) {
		AlertVO saved = dao.selectAlert(alert.getAlertNo());
		if(saved==null)
			throw new RuntimeException(String.format("%d 알림 없음.",alert.getAlertNo()));
		int rowcnt = dao.updateAlert(alert);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeAlert(int alertNo) {
		AlertVO saved = dao.selectAlert(alertNo);
		if(saved==null)
			throw new RuntimeException(String.format("%d 알림 없음.",alertNo));
		int rowcnt = dao.deleteAlert(alertNo);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
