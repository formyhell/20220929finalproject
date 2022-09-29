package kr.or.ddit.common.vo;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of={"attId"})
@ToString(exclude= {"atchFile"})
@NoArgsConstructor
public class AttatchVO implements Serializable{
	
	private transient MultipartFile atchFile;
	
	public AttatchVO(MultipartFile atchFile) {
		super();
		this.atchFile = atchFile;
		attFilename = atchFile.getOriginalFilename();
		attSavename = UUID.randomUUID().toString();
		attMime = atchFile.getContentType();
		attFilesize = atchFile.getSize();
	}
	
	public void saveTo(File saveFolder) throws IOException {
		if(atchFile!=null)
			atchFile.transferTo(new File(saveFolder, attSavename));
	}
	
	@NotBlank
	private String attId;
	@NotBlank
	private String attFilename;
	@NotBlank
	private String attSavename;
	private String attMime;
	@NotNull
	private Long attFilesize;

}
