package kr.or.ddit.outsourcing.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.common.vo.AttatchVO;
import kr.or.ddit.common.vo.CommonCodeVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 조채원
 * @since 2022. 8. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 24.   조채원       			최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="applyId")
public class ApplicantVO implements Serializable{
	private String applyId;
	@NotBlank
	private String applyApplicant;
	@NotBlank
	private String applyContent;
	@NotBlank
	private String applyObj;
	@NotBlank
	private String applyProj;
	private String genImg;
	
	private List<CommonCodeVO>  outObjList;
}
