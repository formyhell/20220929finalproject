package kr.or.ddit.common.qna.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 문의사항VO
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
@EqualsAndHashCode(of="qnaNo")
@ToString(exclude= {"qnaContent","qnaReplyList"})
public class QnaVO implements Serializable{
	private int rnum;
	
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer qnaNo;
	@NotNull(groups= {UpdateGroup.class, InsertGroup.class})
	private String qnaTitle;
	@NotNull(groups= {UpdateGroup.class, InsertGroup.class})
	private String qnaContent;
	private String qnaDate;
	private Integer qnaAnswer;
	@NotNull
	private String qnaWriter;
	
	private transient List<QnaReplyVO> qnaReplyList;
}
