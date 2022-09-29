package kr.or.ddit.common.member.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.groups.Default;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.mypage.memInfo.vo.GenObjVO;
import kr.or.ddit.common.mypage.memInfo.vo.GenSkillVO;
import kr.or.ddit.common.mypage.memInfo.vo.locationVO;
import kr.or.ddit.common.validate.DeleteGroup;
import kr.or.ddit.common.validate.InsertGroup;
import kr.or.ddit.common.validate.UpdateGroup;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 김유진
 * @since 2022. 8. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                 수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 8.       김유진              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@EqualsAndHashCode(of="genId")
@ToString(exclude="genPass")
@NoArgsConstructor //기본 생성자 생성
@AllArgsConstructor(access=AccessLevel.PRIVATE)
@Data
@Slf4j
public class GenMemberVO extends MemberVO implements Serializable{
	
	@NotBlank(groups= {Default.class, DeleteGroup.class})
	@Pattern(regexp = "^[A-Za-z0-9]{2,20}$", message = "아이디는 영문과 숫자를 사용하세요.")
	private String genId;
	@NotBlank (groups= {Default.class, DeleteGroup.class})
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[`~!@#$%^&*()-_=+])[A-Za-z\\d`~!@#$%^&*()-_=+]{8,16}$", message = "비밀번호는 8~16자로 영문, 숫자, 특수문자(`~!@#$%^&*()-_=+)를 사용하세요.")
	private String genPass;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	@Pattern(regexp = "^[ㄱ-ㅎ가-힣a-zA-z0-9-_]{2,10}$", message = "닉네임은 특수문자를 제외한 2~10자리여야 합니다.")
	private String genNick;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class}) 
	@Pattern(regexp = "^[ㄱ-ㅎ가-힣a-zA-z0-9-_]{2,30}$", message = "이름은 특수문자를 제외한 2자리 이상이여야 합니다.")
	private String genName;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class}) 
	@Pattern(regexp="\\d{4}-\\d{2}-\\d{2}", message = "날짜 형식이 올바르지 않습니다.")
	private String genBirth;
	@Pattern(regexp = "^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$", message = "이메일 형식이 올바르지 않습니다.")
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})  
	private String genMail;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})  
	@Pattern(regexp="\\d{3}-\\d{3,4}-\\d{4}", message = "휴대폰 형식이 올바르지 않습니다. (010-1234-5678)")
	private String genHp;
	
	private String genIntro; 
	private Integer genDelete;
	private double genRating;
	private Integer enabled;
	private String genGrd;
	private String genJoindate;
	private String genDeletedate;
	private List<String> memProj;
	
	//회원 프로필 이미지
	private String genImg;
	private MultipartFile genImage;
	public void setGenImage(MultipartFile genImage) {
		if(genImage!=null && !genImage.isEmpty() && genImage.getContentType().startsWith("image/"))
		this.genImage = genImage;
		this.genImg = UUID.randomUUID().toString();
	}
	
	
	// 학력 리스트
	private List<EducationVO> eduList;
	// 경력 리스트
	private List<CareerVO> carList;
	// 자격증 리스트
	private List<LicenseVO> licList;
	// 수상이력 리스트
	private List<AwardVO> awardList;
	// 업무분야 리스트
	private List<GenObjVO> objList;
	// 회원 기술 리스트
	private List<GenSkillVO> skillList;
	// 선호 지역 리스트
	private List<locationVO> locList;
	
	
	private String[] genObj;
	
	public void setGenObj(String[] genObj) {
		if(genObj==null || genObj.length ==0) return;
		this.genObj = genObj;
		this.objList = new ArrayList<>();
		for(String obj:genObj) {
			if(obj.isEmpty()) continue;
			objList.add(new GenObjVO(obj));
		}
	}
	
	
	private String[] genSkill;

	public void setGenSkill(String[] genSkill) {
		if(genSkill==null || genSkill.length ==0) return;
		this.genSkill = genSkill;
		this.skillList = new ArrayList<>();
		for(String skill:genSkill) {
			if(skill.isEmpty()) continue;
			skillList.add(new GenSkillVO(skill));
		}
	}
	
	private String[] genLoc;
	
	public void setGenLoc(String[] genLoc) {
		if(genLoc==null || genLoc.length==0)return;
		this.genLoc = genLoc;
		this.locList = new ArrayList<>();
		for(String loc:genLoc) {
			if(loc.isEmpty()) continue;
			locList.add(new locationVO(loc));
		}
	}
	
	
	
}
