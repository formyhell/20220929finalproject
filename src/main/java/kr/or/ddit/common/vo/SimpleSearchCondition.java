package kr.or.ddit.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SimpleSearchCondition {
	private String searchType;
	private String searchWord;
}
