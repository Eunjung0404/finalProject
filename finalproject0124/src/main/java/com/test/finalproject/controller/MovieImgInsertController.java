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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.finalproject.service.MovieImgService_hj;
import com.test.finalproject.vo.MovieImgVo;

@Controller
public class MovieImgInsertController {
	@Autowired private MovieImgService_hj service;
	@Autowired private ServletContext sc;
	
	@GetMapping("/movie/addmovieimg")
	public String movieimgForm(int moviecode, Model model) { //모델객체에 영화정보를 담아서 movie/addmovieimg.tiles페이지로 보내기
		model.addAttribute("vo", service.movieimglist(moviecode));
		return "movie/addmovieimg.tiles";
	}
	

	@PostMapping("/movie/addmovieimg")
	public String movieimginsert(int moviecode, //moviecode 넘기기
								MultipartHttpServletRequest request,
								//MultipartFile photofile, //리스트로 받기
								//List<MultipartFile> photofile,
								Model model2) {
		List<MultipartFile> filelist=request.getFiles("photofile");
		String path=sc.getRealPath("/resources/images/stillcutupload");
		System.out.println(path);
		
		for(MultipartFile mf:filelist) {
			String imgname=mf.getOriginalFilename();
			
			//String sateFile=path + System.currentTimeMillis() + imgname; //중복이름 방지
		
		try {
			mf.transferTo(new File(path + "\\" + imgname));
			MovieImgVo vo=new MovieImgVo(0, moviecode, imgname); //시퀀스 사용
			service.movieimginsert(vo);
			model2.addAttribute("msg", "success");
		}catch(IllegalStateException e) {
			e.getMessage();
			model2.addAttribute("msg", "fail");
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
		return "movie/result.tiles";
		
	}
	
	//스틸컷 리스트
	@GetMapping("/movie/imglist")
	public String movieimglist(int moviecode, Model model) {
		model.addAttribute("imglist", service.movieimglist(moviecode));
		return "movie/moviedetailpage.tiles";
	}
}
