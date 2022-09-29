package kr.or.ddit.common.mypage.project.recommendProject.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="projId")
public class RecommendProjectVO implements Serializable{
	private String projId;
	private int total;
}
