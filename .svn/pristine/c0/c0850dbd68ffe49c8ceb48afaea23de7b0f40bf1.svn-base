package kr.or.ddit.pms.issue.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="solveNo")
@ToString(exclude="solveContent")
public class IssueSolveVO implements Serializable{
	
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer solveNo;
	private String solveFdate;
	private String solveContent;
	@NotBlank
	private String solveIssue;

}
