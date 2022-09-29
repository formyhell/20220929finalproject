package kr.or.ddit.common.member.vo;

import java.util.List;
import java.util.Map;

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
@EqualsAndHashCode(of= {"eduNo", "eduMem"})
@NoArgsConstructor
@AllArgsConstructor(access=AccessLevel.PRIVATE)
@ToString
public class EducationVO {
	@NotNull (groups= {UpdateGroup.class, DeleteGroup.class})
	private int eduNo;
	private String eduMem;
	@NotBlank (groups= {InsertGroup.class, UpdateGroup.class})
	private String eduType;
	@NotBlank (groups= {InsertGroup.class, UpdateGroup.class})
	private String eduScname;
	@NotBlank (groups= {InsertGroup.class, UpdateGroup.class})
	private String eduMajor;
	private String eduState;
	@NotBlank (groups= {InsertGroup.class, UpdateGroup.class})
	private String eduSdate;
	@NotBlank (groups= {InsertGroup.class, UpdateGroup.class})
	private String eduFdate;
}
