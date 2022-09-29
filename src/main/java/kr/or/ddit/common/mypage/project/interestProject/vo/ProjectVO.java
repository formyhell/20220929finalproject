package kr.or.ddit.common.mypage.project.interestProject.vo;
/**
 * @author 윤지영
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. ?.      306-06       최초작성
 * 2022. 8. 23.      306-06      페이징 처리
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="projId" )
public class ProjectVO implements Serializable{
	@NotBlank
	private String projId;
	@NotBlank
	private String projRegist;
	@NotBlank
	private String projEmptype;
	@NotBlank
	private String projType;
	private String projRecruitfdate;
	@NotBlank
	private String projPlanstate;
	@NotNull
	private Integer projMemnum;
	private String projSdate;
	private String projFdate;
	@NotNull
	private Integer projEstimate;
	private String projContent;
	private String projQualifi;
	//요약
	private String projSubContent;
	private String projSubQualifi;
	@NotNull
	private Integer projApprove;
	private String projReject;
	@NotNull
	private Integer projRating;
	private String projRealsdate;
	private String projRealfdate;
	private String projLoc;
	@NotBlank
	private String projState;
	private String projRecruitsdate;
	@NotBlank
	private String projTitle;
	private Integer projRealnum;
	
	//지원 프로젝트ID
	private String applyId;
	
	//메인 이미지
	private String comImg;
}
