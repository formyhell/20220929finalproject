package kr.or.ddit.common.filedownload;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.common.vo.AttatchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AttatchDownloadView extends AbstractView{
	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	@PostConstruct
	public void init() throws IOException{
		log.info("주입된 저장 경로 : {}", saveFolder.getCanonicalPath());
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		AttatchVO attatch = (AttatchVO) model.get("attatch");
		String saveName = attatch.getAttSavename();
		File saveFile = new File(saveFolder, saveName);
		if(!saveFile.exists()) {
			response.sendError(404, "해당 파일은 없음.");
			return;
		}
		// 저장명이 아닌 원본 파일명으로 다운로드
		String filename = attatch.getAttFilename();
		filename = URLEncoder.encode(filename, "UTF-8").replace("+", " ");
		response.setHeader("Content-Disposition", "attathment;filename=\""+filename+"\"");
		response.setContentLengthLong(saveFile.length());
		
		// commons-compress : 폴더를 압축.
//		FileInputStream fis = new FileInputStream(file);
		try(
			OutputStream os = response.getOutputStream();
		){
			FileUtils.copyFile(saveFile, os);
		}
		
	}

}
