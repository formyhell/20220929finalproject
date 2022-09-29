package kr.or.ddit.common.mypage.portfolio.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.AttatchVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 
 * @author 고혜인
 * @since 2022. 8. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 18.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="pfId")
@ToString(exclude= {"pfContent"})
public class PortfolioVO {
	private int rnum;

	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private String pfId;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	private String pfTitle;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	private String pfSdate;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	private String pfFdate;
	private String pfClient;
	@NotNull(groups= {InsertGroup.class, UpdateGroup.class})
	private Integer pfOpen;
	private String pfMem;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	private String pfContent;
	private String pfResulturl;
	
	////////////////////////////////////////
	
	// 포트폴리오 직무 분야
	private List<PfObjVO> objCodeList;
//	private List<String> objCodeList;
	
	@NotEmpty(groups= {InsertGroup.class})
	private String[] objCodes;
	
	public void setObjCodes(String[] objCodes) {
		if(objCodes == null || objCodes.length == 0) return;
		this.objCodes = objCodes;
		
		this.objCodeList = new ArrayList<>();
		for(String obj : objCodes) {
			if(obj.isEmpty()) continue;
			objCodeList.add(new PfObjVO(obj));
		}
	}
	
	private String[] delObjCodes;
	
	// 포트폴리오 기술 리스트
	private List<PfSkillVO> skillCodeList;
	
	@NotEmpty(groups= {InsertGroup.class})
	private String[] skillCodes;
	
	public void setSkillCodes(String[] skillCodes) {
		if(skillCodes == null || skillCodes.length == 0) return;
		this.skillCodes = skillCodes;
		
		this.skillCodeList = new ArrayList<>();
		for(String skill : skillCodes) {
			if(skill.isEmpty()) continue;
			skillCodeList.add(new PfSkillVO(skill));
		}
	}
	
	private String[] delSkillCodes;
	
	
	
	
	/////////////////////////////////////////////
	
	//파일 업로드
	private transient List<AttatchVO> attatchList;
	
	private MultipartFile[] pfFiles;
	
	public void setPfFiles(MultipartFile[] pfFiles) {
		if(pfFiles == null || pfFiles.length == 0) return;
		this.pfFiles = pfFiles;
		
		this.attatchList = new ArrayList<>();
		for(MultipartFile single : pfFiles) {
			if(single.isEmpty()) continue;
			attatchList.add(new AttatchVO(single));
		}
	}
	
	private String startAttId; //첨부파일 시작번호
	
	//삭제할 첨부파일
	private String[] delAttIds;
	
	
}
