package kr.or.ddit.common.mypage.schedule.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 김유진
 * @since 2022. 8. 13.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 13.       김유진              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="scheNo")
public class ScheduleVO {
	@NotNull(groups = {UpdateGroup.class, DeleteGroup.class})
	private Integer scheNo;
	@NotBlank 
	private String scheType;
	private String scheProj;
	private String scheSdate;
	private String scheFdate;
	@NotBlank 
	private String scheTitle;
	private String scheContent;
	@NotBlank 
	private String scheColor;
	@NotBlank
	private String scheMemid;

}
