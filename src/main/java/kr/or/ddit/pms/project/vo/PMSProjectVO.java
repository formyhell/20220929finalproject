package kr.or.ddit.pms.project.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
/**
 * @author 홍승조
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.      홍승조       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="projId")
@ToString(exclude = {"projPass","projKey"})
public class PMSProjectVO implements Serializable{
	
	private int rnum;
	private int projInvolve;
	
	@NotBlank(groups= {UpdateGroup.class, DeleteGroup.class})
	private String projId;
	@NotBlank 
	private String projName;
	@NotBlank (groups= {InsertGroup.class})
	private String projArchi;
	@NotBlank (groups= {InsertGroup.class})
	private String projSdate;
	@NotBlank (groups= {UpdateGroup.class})
	private String projFdate;
	@NotBlank (groups= {InsertGroup.class})
	private String projPass;
//	@NotBlank 
	private String projKey;
	private String projOutproj;
	@NotBlank(groups= {UpdateGroup.class})
	private String projState;
	private String ruleTitle;
	private String ruleContent;
	private String ruleDate;
}
