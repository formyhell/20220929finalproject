package kr.or.ddit.outsourcing.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"projSkill" , "projId"})
public class SkillVO implements Serializable {
	
	
	public SkillVO() {
		
	}
	
	public SkillVO(String skill) {
		this.projSkill = skill;
	}
	
	
	private String projSkill;
	private String skillCode;
	private String projId;
}
