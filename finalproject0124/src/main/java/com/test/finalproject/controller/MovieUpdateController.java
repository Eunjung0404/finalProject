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

import com.test.finalproject.service.Movie_MService_hj;
import com.test.finalproject.vo.FormData;
import com.test.finalproject.vo.Movie_MVo;

@Controller
public class MovieUpdateController {
	@Autowired private Movie_MService_hj service;
	@Autowired private ServletContext sc;
	
	@GetMapping("/movie/update")
	public String updateForm(int moviecode, Model model) {
		model.addAttribute("vo", service.detail(moviecode));
		return "movie/movieupdate.tiles";
	}
	
	@PostMapping("/movie/update")
	public String movieupdate(FormData data, Model model) {
		MultipartFile file1=data.getFile1();
		try {
			if(!(file1.isEmpty())) {
				String path=sc.getRealPath("/resources/images/movieupload");
				String movieimg=file1.getOriginalFilename();
				//중복파일명은 제외
				InputStream is=file1.getInputStream();
				FileOutputStream fo=new FileOutputStream(path+"\\"+movieimg);
				FileCopyUtils.copy(is, fo);
				is.close();
				fo.close();
				
				Movie_MVo vo=service.detail(data.getMoviecode());
				File f=new File(path+"\\"+vo.getMovieimg());
				f.delete();
				Movie_MVo vo2=new Movie_MVo(data.getMoviecode(), 
						data.getMoviename(), 
						data.getRuntime(), 
						data.getDirector(), 
						data.getGenre(), 
						data.getRating(), 
						data.getCountry(), 
						data.getActorinfo(), 
						movieimg, 
						data.getOpendate(), 
						data.getState(), 
						data.getVideo(), 
						0);
				service.movieupdate(vo2);
			}else {
				Movie_MVo vo2=new Movie_MVo(data.getMoviecode(), 
						data.getMoviename(), 
						data.getRuntime(), 
						data.getDirector(), 
						data.getGenre(), 
						data.getRating(), 
						data.getCountry(), 
						data.getActorinfo(), 
						null, 
						data.getOpendate(), 
						data.getState(), 
						data.getVideo(), 
						0);
				service.movieupdate(vo2);
			}
			model.addAttribute("msg", "success");
			return "movie/result.tiles";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "fail");
			return "movie/result.tiles";
		}
	}
			
}
