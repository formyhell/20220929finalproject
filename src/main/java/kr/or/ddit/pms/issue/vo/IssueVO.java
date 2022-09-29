package kr.or.ddit.pms.issue.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.pms.project.vo.PMSProjectVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="issueId")
@ToString(exclude="issueContent")
public class IssueVO implements Serializable{
	
	private int rnum;
	private transient String writerName;
	private transient String chargerName;
	private transient String workTitle;
	private transient String workManagerId;
	private transient String workChargerId;
	private transient String workManagerName;
	private transient String workChargerName;
	private transient String projName;
	
	private transient String issueStateName;
	private transient String issueImportName;
	private transient String issueTypeName;
	
	@NotBlank(groups= {UpdateGroup.class, DeleteGroup.class})
	private String issueId;
	@NotBlank
	private String issueProj;
	@NotBlank
	private String issueTitle;
	private String issueDate;
	@NotBlank
	private String issueState;
	@NotBlank
	private String issueImport;
	@NotBlank
	private String issueWriter;
	private String issueContent;
	@NotBlank
	private String issueWork;
	@NotBlank
	private String issueCharger;
	@NotBlank
	private String issueType;
	
	// 파일 업로드 관련
	private transient List<AttatchVO> attatchList;
		
	private MultipartFile[] issueFiles;
		
	public void setIssueFiles(MultipartFile[] boFiles) {
		if(boFiles==null || boFiles.length == 0) return;
		this.issueFiles = boFiles;
		this.attatchList  = new ArrayList<>();
		for(MultipartFile single  : boFiles) {
			if(single.isEmpty()) continue;
	 		attatchList.add( new AttatchVO(single) );
		}
	}
	
	private String attId;
	
	// 삭제할 첨부파일
	private String[] delAttNos;
}
