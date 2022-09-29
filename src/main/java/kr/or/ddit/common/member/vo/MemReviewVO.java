package kr.or.ddit.common.member.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.outsourcing.vo.ContractVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 조채원
 * @since 2022. 8. 29.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 29.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="genrevId")
public class MemReviewVO {
	@NotBlank(groups= {UpdateGroup.class, DeleteGroup.class})  
	private String genrevId;
	@NotBlank(groups= InsertGroup.class) 
	private String genrevProj;
	private String genrevGenmem;
	@NotNull(groups= {InsertGroup.class, UpdateGroup.class}) 
	private float genrevRating;
	private String genrevDate;
	private String genrevMemobj;
	private String genrevImg;
}