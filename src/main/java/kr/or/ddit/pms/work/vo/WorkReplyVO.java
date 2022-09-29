package kr.or.ddit.pms.work.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.pms.issue.vo.IssueReplyVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="repNo")
@ToString(exclude="repContent")
public class WorkReplyVO implements Serializable{
	private String repWriterName;
	
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer repNo;
	@NotBlank
	private String repContent;
	private String repDate;
	@NotBlank(groups= InsertGroup.class)
	private String repWriter;
	@NotBlank(groups= InsertGroup.class)
	private String repWork;
}
