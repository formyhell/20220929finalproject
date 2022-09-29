package kr.or.ddit.common.mypage.portfolio.vo;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor(access=AccessLevel.PRIVATE)
@ToString
@EqualsAndHashCode(of= {"pfId", "skillCode"})
public class PfSkillVO {
	
	public PfSkillVO(String skill) {
		this.skillCode = skill;
	}
	
	private String pfId;
	private String skillCode;
	private String skillId;

}
