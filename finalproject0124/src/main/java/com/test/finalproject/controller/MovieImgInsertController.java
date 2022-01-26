package com.test.finalproject.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.test.finalproject.service.MovieImgService_hj;
import com.test.finalproject.vo.MovieImgVo;

@Controller
public class MovieImgInsertController {
	@Autowired private MovieImgService_hj service;
	@Autowired private ServletContext sc;
	
	@GetMapping("/movie/movieimginsert")
	public String movieimgForm() {
		return "movie/movieimginsert.tiles";
	}
	
	@PostMapping("/movie/movieimginsert")
	public String movieimginsert(int moviecode,
								MultipartFile file2,
								Model model) {
		String path=sc.getRealPath("/resources/images/movieupload");
		String imgname=file2.getOriginalFilename();
		try {
			InputStream is=file2.getInputStream();
			File f=new File(path + "\\" + imgname);
			FileOutputStream fos=new FileOutputStream(f);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			
			MovieImgVo vo=new MovieImgVo(0, moviecode, imgname);
			service.movieimginsert(vo);
			model.addAttribute("msg", "success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "fail");
		}
		return "movie/result.tiles";
	}
}
