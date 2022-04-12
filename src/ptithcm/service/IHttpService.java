package ptithcm.service;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public interface IHttpService {
	File saveProductPhoto(MultipartFile photo);

}
