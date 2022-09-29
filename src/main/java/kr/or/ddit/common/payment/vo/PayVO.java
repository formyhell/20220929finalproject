package kr.or.ddit.common.payment.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="payId")
public class PayVO {

	@NotBlank(groups = { DeleteGroup.class, UpdateGroup.class })
	private String payId;
	@NotBlank
	private String payCommem;
	private String payDate;
	@NotBlank
	private String payMethod;
	@NotBlank
	private String payPrice;
	private String payProj;
	@NotBlank
	private String payState;

}
