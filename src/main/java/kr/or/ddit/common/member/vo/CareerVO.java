package kr.or.ddit.common.member.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.groups.Default;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 조채원
 * @since 2022. 8. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자               		수정내용
 * --------     --------    ----------------------
 * 2022. 8. 18.   조채원       		최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of= {"carNo", "carMem"})
@NoArgsConstructor
@AllArgsConstructor(access=AccessLevel.PRIVATE)
@ToString
public class CareerVO {
	@NotNull (groups= {UpdateGroup.class, DeleteGroup.class})
	private int carNo;
	private String carMem;
	@NotBlank (message="회사명을 입력하세요.", groups= {InsertGroup.class, UpdateGroup.class})
	private String carCom;
	@NotBlank (message="입사일을 입력하세요.", groups= {InsertGroup.class, UpdateGroup.class})
	private String carSdate;
	private String carFdate;
	@NotBlank (message="부서명을 입력하세요.", groups= {InsertGroup.class, UpdateGroup.class})
	private String carDep;
	private String carPosition;
	private String carDetail;
}
