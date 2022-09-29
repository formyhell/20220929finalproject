package kr.or.ddit.common.member.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 김유진
 * @since 2022. 8. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 10.       김유진              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@EqualsAndHashCode(of="adminId")
@ToString(exclude="adminPass")
@NoArgsConstructor //기본 생성자 생성
@AllArgsConstructor(access=AccessLevel.PRIVATE)
@Data
public class AdminVO extends MemberVO implements Serializable{
	@NotBlank 
	private String adminId;
	@NotBlank 
	private String adminPass;
	private Integer enabled;

}
