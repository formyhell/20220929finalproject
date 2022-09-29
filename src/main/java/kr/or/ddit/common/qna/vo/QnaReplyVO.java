package kr.or.ddit.common.qna.vo;

import javax.validation.constraints.NotNull;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 문의사항 답변VO
 * @author 고혜인
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.      작성자명       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of= {"repNo"})
@ToString(exclude="repContent")
public class QnaReplyVO {
	
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer repNo;
	@NotNull
	private String repTitle;
	@NotNull
	private String repContent;
	private String repDate;
	private String repAdmin;
	@NotNull
	private Integer repParent; //문의글

}
