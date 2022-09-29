package kr.or.ddit.common.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.member.dao.CommonCodeDAO;
import kr.or.ddit.common.vo.CommonCodeVO;

@Service
public class CommonCodeServiceImple implements CommonCodeService {
	
	@Inject
	CommonCodeDAO dao;
	
	
	@Override
	public List<CommonCodeVO> selectPmsfeild() {
		
		List<CommonCodeVO> pmsJopFeildList = dao.pmsJopFeild();
		
		return pmsJopFeildList;
	}

}
