package kr.or.ddit.common.notice.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import kr.or.ddit.common.vo.AttatchVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="notNo")
@ToString(exclude="notContent")
public class NoticeVO implements Serializable{
	private int rnum;

	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private Integer notNo;
	private String notTitle;
	private String notContent;
	private String notDate;
	private Integer notHit;
	private String notAdmin;
	private String notSdate;
	private String notFdate;
	private String notState;
	private Integer notParentno;
	
	// 파일 업로드
	private transient List<AttatchVO> attatchList;

	private MultipartFile[] notFiles;

	public void setNotFiles(MultipartFile[] notFiles) {
		if (notFiles == null || notFiles.length == 0)
			return;
		this.notFiles = notFiles;

		this.attatchList = new ArrayList<>();
		for (MultipartFile single : notFiles) {
			if (single.isEmpty()) {
				continue;
			}
			attatchList.add(new AttatchVO(single));
		}
	}
	
	private NoticeVO parent;

	private String startAttId; // 첨부파일 시작번호

	// 삭제할 첨부파일
	private String[] delAttIds;
}
