package com.test.finalproject.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.finalproject.service.MovieImgService_hj;
import com.test.finalproject.vo.MovieImgVo;

@Controller
public class MovieImgInsertController {
	@Autowired private MovieImgService_hj service;
	@Autowired private ServletContext sc;
	
	@GetMapping("/movie/addmovieimg")
	public String movieimgForm() {
		return "movie/addmovieimg.tiles";
	}
	
	@PostMapping("/movie/addmovieimg")
	public String movieimginsert(int moviecode,
								MultipartFile photofile, //리스트로 받기
								Model model) {
		//List<MultipartFile> ?
		String path=sc.getRealPath("/resources/images/movieupload");
		System.out.println(path);
		String imgname=photofile.getOriginalFilename();
		try {
			InputStream is=photofile.getInputStream();
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
