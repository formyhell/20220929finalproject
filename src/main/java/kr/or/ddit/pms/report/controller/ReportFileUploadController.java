package kr.or.ddit.pms.report.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("pms/{projId}/report")
public class ReportFileUploadController {
	
	@Inject
	private WebApplicationContext context;
		
		@Autowired
		private ServletContext applicatrion;
		
		@Value("#{appInfo.imageURL}")
		private String imageFolderURL;
		
		private File saveFolder;
		
		@PostConstruct
		public void init() {
			String realPath = applicatrion.getRealPath(imageFolderURL);
			saveFolder = new File(realPath);
			if (!saveFolder.exists()) {
				saveFolder.mkdirs();
				
				
			}
			
		}
		
		@PostMapping(value="image", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public Map<String, Object> imageUpload(@RequestParam MultipartFile upload) throws IOException {
			Map<String, Object> resultMap = new HashMap<>();
			if (!upload.isEmpty()) {
				String saveName = UUID.randomUUID().toString();
				File saveFile = new File(saveFolder,saveName);
				upload.transferTo(saveFile);
				String imageFileURL = applicatrion.getContextPath() + imageFolderURL + "/" + saveName;
				String fileName = upload.getOriginalFilename();
				int uploaded = 1;
				resultMap.put("fileName", fileName);
				resultMap.put("uploaded", uploaded);
				resultMap.put("url", imageFileURL);
			}else {
				Map<String, Object> error = new HashMap<>();
				error.put("number", 400);
				error.put("message", "업로드 된 파일이 없음");
				resultMap.put("error", error);
			}
			return resultMap;
		}
		
	
}
