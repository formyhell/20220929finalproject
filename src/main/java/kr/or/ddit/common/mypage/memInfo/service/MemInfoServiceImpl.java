package kr.or.ddit.common.mypage.memInfo.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.common.member.dao.CommonCodeDAO;
import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.member.vo.MemberVO;
import kr.or.ddit.common.mypage.memInfo.dao.MemberInfoDAO;
import kr.or.ddit.common.mypage.memInfo.exception.PKNotFoundException;
import kr.or.ddit.common.mypage.memInfo.vo.GenObjVO;
import kr.or.ddit.common.mypage.memInfo.vo.GenSkillVO;
import kr.or.ddit.common.mypage.memInfo.vo.locationVO;
import kr.or.ddit.outsourcing.vo.OutProjVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemInfoServiceImpl implements MemInfoService {

	@Inject
	PasswordEncoder passEncoder;

	@Inject
	MemberInfoDAO memberInfoDAO;

	@Resource
	AuthenticateService authService;
	
	@Inject
	WebApplicationContext rootContext;
	
	private File imageFolder;
	
	@Inject
	CommonCodeDAO commoncodeDao;

	
	@PostConstruct
	public void init() {
		// 프로필 이미지 저장 처리(MultipartFile)
		String imageFolderUrl = "resources/images";
		String imageFolderPath = rootContext.getServletContext().getRealPath(imageFolderUrl);
		imageFolder = new File(imageFolderPath);
		if(!imageFolder.exists()) imageFolder.mkdirs();
		log.info("{} 주입 후 {} 생성 및 확인", rootContext, imageFolder);
	}
	
	private void processImage(GenMemberVO genMember) {
		MultipartFile imageFile = genMember.getGenImage();
		if(imageFile!=null) {
//			if(1==1) throw new RuntimeException("강제 발생 예외");
			File genImageFile = new File(imageFolder, genMember.getGenImg());
			try {
				imageFile.transferTo(genImageFile);
			} catch (IllegalStateException | IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	

	
	private void processImage2(ComMemberVO comMember) {
		MultipartFile imageFile = comMember.getComImage();
		if(imageFile!=null) {
//			if(1==1) throw new RuntimeException("강제 발생 예외");
			File comImageFile = new File(imageFolder, comMember.getComImg());
			try {
				imageFile.transferTo(comImageFile);
			} catch (IllegalStateException | IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	
	
	@Override
	public GenMemberVO retrieveGenMemInfo(String memId) {
		GenMemberVO genMember = memberInfoDAO.selectGenMem(memId);
		
		
		List<GenObjVO> objList = memberInfoDAO.genObjList(memId);
		List<GenSkillVO> skillList = memberInfoDAO.genSkillList(memId);
		List<locationVO> locList = memberInfoDAO.genLocList(memId);
		genMember.setObjList(objList);
		genMember.setSkillList(skillList);
		genMember.setLocList(locList);
		log.info("####objList?? : {} ####", objList);
		log.info("####skillList?? : {} ####", skillList);
		log.info("####locList?? : {} ####", locList);
		
		return genMember;
	}
	
	//스킬리스트 조회
	
	
	
	
	

	@Override
	public ComMemberVO retrieveComMemInfo(String memId) {
		ComMemberVO comMember = memberInfoDAO.selectComMem(memId);

		if (comMember == null) {
//			throw new PKNotFoundException(String.format("%s 아이디를 가진 회원이 없음.", MemId));
		}
		return comMember;
	}

	@Override
	public ServiceResult modifyGenMember(GenMemberVO genMember) {
		MemberVO inputData = new MemberVO();
		inputData.setMemId(genMember.getMemId());
		inputData.setMemPass(genMember.getMemPass());
		processImage(genMember);
		ServiceResult result = authService.authenticate(inputData);
		switch (result) {
		case NOTEXIST:
			throw new PKNotFoundException(String.format("%s 에 해당하는 회원이 없음.", genMember.getMemId()));
//		case INVALIDPASSWORD:
//			break;
		default:
			int rowcnt = memberInfoDAO.updateGenMember(genMember);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
			break;
		}
		return result;

	}

	@Override
	public ServiceResult modifyComMember(ComMemberVO comMember) {
		MemberVO inputData = new MemberVO();
		inputData.setMemId(comMember.getMemId());
		inputData.setMemPass(comMember.getMemPass());
		processImage2(comMember);
		ServiceResult result = authService.authenticate(inputData);
		switch (result) {
		case NOTEXIST:
			throw new PKNotFoundException(String.format("%s 에 해당하는 회원이 없음.", comMember.getMemId()));
//		case INVALIDPASSWORD:
//			break;
		default:
			int rowcnt = memberInfoDAO.updateComMember(comMember);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
			break;
		}
		return result;
	}

	@Override
	public ServiceResult deleteGenMember(MemberVO member, String password) {
		ServiceResult result = null;


		if (passEncoder.matches(password, member.getMemPass())) {
			// 복호화한값과 입력받은 값이 일치할때

			int rowcnt = memberInfoDAO.deleteGenMember(member.getMemId());
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		} else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;

	}
	
	@Override
	public ServiceResult deleteComMember(MemberVO member, String password) {
		ServiceResult result = null;


		if (passEncoder.matches(password, member.getMemPass())) {
			// 복호화한값과 입력받은 값이 일치할때

			int rowcnt = memberInfoDAO.deleteComMember(member.getMemId());
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		} else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;

	}

	@Override
	public void insertSkill(GenMemberVO genMem) {
		genMem.getGenObj();
		genMem.getObjList();
		
		if(genMem.getGenObj()!=null) {
			memberInfoDAO.insertObj(genMem);
		}
		if(genMem.getGenSkill()!=null) {
			memberInfoDAO.insertSkill(genMem);
		}
	}

	
	@Override
	public void insertLoc(GenMemberVO genMem) {
		memberInfoDAO.insertLoc(genMem);
	}
	
	
	@Override
	public int remove(GenSkillVO genId) {
		int delSkill = memberInfoDAO.delSkill(genId);
		return delSkill;
	}
	public int remove1(GenObjVO genId) {
		int delObj = memberInfoDAO.delObj(genId);
		return delObj;
	}

	@Override
	public int removeLoc(locationVO genId) {
		int delLoc = memberInfoDAO.delLoc(genId);
		return delLoc;
	}

	@Override
	public ComMemberVO retrieveComImg(OutProjVO projRegist) {
		ComMemberVO comMember = memberInfoDAO.selectComImg(projRegist);
		return comMember;
	}

}
