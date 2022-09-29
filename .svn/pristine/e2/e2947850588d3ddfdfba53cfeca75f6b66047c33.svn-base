package kr.or.ddit.common.community.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.common.member.vo.ComMemberVO;
import kr.or.ddit.common.member.vo.GenMemberVO;
import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="repNo")
@ToString(exclude="repContent")
@NoArgsConstructor
@AllArgsConstructor(access=AccessLevel.PRIVATE)
public class CommunityReplyVO implements Serializable{

	private int rnum;
	
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer repNo;
	private Integer repParent; //상위 댓글(대댓글시 사용)
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	private String repContent;
	private String repDate;
//	@NotNull(groups= {InsertGroup.class})
	private Integer repCmntno; //게시글
	private String repWriter;  //작성자
	
	private String genImg;
	private String comImg;
	
	
}
