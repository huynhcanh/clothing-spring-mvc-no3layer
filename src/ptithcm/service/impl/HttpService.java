package ptithcm.service.impl;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.service.IHttpService;



@Service
public class HttpService implements IHttpService {
	
	@Autowired
	ServletContext context;
	
	private File save(MultipartFile fileupload, String folder) {
		
		try {
			if(!fileupload.isEmpty()) {
				String fname = fileupload.getOriginalFilename();
				/* File file = new File(context.getRealPath(folder), fname); *///getRealPath of folder - "/images/"
				File file = new File(folder + File.separator + fname);// get directly Path from "folder - "D:\\workspace\\workspace_eclipse_v5w\\clothing-website\\WebContent\\images"
				fileupload.transferTo(file);
				return file;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public File saveProductPhoto(MultipartFile photo) {
		//return this.save(photo, "D:\\workspace\\workspace_eclipse_v5w\\clothing-website\\WebContent\\images");
		return this.save(photo, "C:\\Users\\DELL\\Downloads\\clothing-website-final\\WebContent\\images");
		
	}
}
