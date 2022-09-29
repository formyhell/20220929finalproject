package kr.or.ddit.common.alert.vo;

import javax.validation.constraints.NotNull;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "alertNo")
public class AlertVO {
	@NotNull(groups = { UpdateGroup.class, DeleteGroup.class })
	private Integer alertNo;
	@NotNull
	private String alertContent;
	@NotNull
	private Integer alertCheck;
	private String alertTime;
	private String alertReceiver;
	private String alertUrl;
	private String alertDelete;

}
