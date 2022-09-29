package kr.or.ddit.common.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 
 * @author 작성자
 * @since 2022. 8. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 22.      홍승조       최초작성
 * 2022. 8. 22.      고혜인         lombok추가, typeName 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Data
@EqualsAndHashCode(of= {"codeId", "typeId"})
@ToString
@NoArgsConstructor
public class CommonCodeVO implements Serializable{
	@NotBlank
	private String codeId;
	@NotBlank
	private String codeName;
	@NotBlank
	private String registday;
	private String updateday;
	@NotBlank
	private String typeId;
	
	private int rnum;
	private String typeName; //COMMOM_CODETYPE에서 가져옴
}
