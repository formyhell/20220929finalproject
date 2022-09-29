package kr.or.ddit.common.star.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="genId")
public class StarToGenVO implements Serializable{
	private String genImg;
	private String genId;
	private String genName;
	private String applyObj;
	private String contractSdate;
	private String contractFdate;
	private String genDelete;
}
