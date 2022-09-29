package kr.or.ddit.common.community.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="trepNo")
//@ToString(exclude="trepReason")
@NoArgsConstructor
@AllArgsConstructor(access=AccessLevel.PRIVATE)
public class CommunityTrepVO {

	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer trepNo;
	@NotNull(groups= {UpdateGroup.class, InsertGroup.class})
	private String trepReason;
	private String trepDate;
	private Integer trepCmnt;
	private String trepReporter;
}
