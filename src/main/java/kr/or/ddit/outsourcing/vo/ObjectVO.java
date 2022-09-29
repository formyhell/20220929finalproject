
package kr.or.ddit.outsourcing.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.common.validate.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 신창규
 * @since 2022. 8. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 22.      306-06       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 *      </pre>
 */
@Data
@EqualsAndHashCode(of = { "projObj", "projId" })
public class ObjectVO implements Serializable {
	public ObjectVO() {
	}
	
	public ObjectVO(String obj) {
	
		this.projObj = obj;
	}
	
	private String projObj;
	private String objCode;
	private String projId;
}
