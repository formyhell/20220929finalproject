package kr.or.ddit.pms.report.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.AttatchVO;
import lombok.Data;

@Data
public class ReportVO implements Serializable {
	
	private int rnum;
	
	@NotBlank(groups= {UpdateGroup.class})
	private String reportId;
	@NotBlank
	private String reportProj;
	@NotBlank
	private String reportTitle;
	
	private String reportContent;
//	@NotBlank
	private String reportDate;
	@NotBlank
	private String reportWriter;
	
	private String writerName;
	
	// 파일 업로드 관련
	private transient List<AttatchVO> attatchList;

	private MultipartFile[] reportFiles;
		
	public void setReportFiles(MultipartFile[] boFiles) {
		if(boFiles==null || boFiles.length == 0) return;
		this.reportFiles = boFiles;
	 	this.attatchList  = new ArrayList<>();
	 	for(MultipartFile single  : boFiles) {
	 		if(single.isEmpty()) continue;
 	 		attatchList.add( new AttatchVO(single) );
	 	}
	}
		
	private String attId;
		
	private String[] delAttNos;
	
	
}
