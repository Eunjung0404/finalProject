package com.test.finalproject.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.test.finalproject.service.Movie_MService_hj;
import com.test.finalproject.vo.Movie_MVo;

@Controller
public class MovieInsertController_hj {
	@Autowired private Movie_MService_hj service;
	@Autowired private ServletContext sc;
	
	@GetMapping("/movie/movieinsert")
	public String movieForm() {
		return "movie/movieinsert.tiles";
	}
	
	@PostMapping("/movie/movieinsert")
	public String movieinsert(String moviename, int runtime, String director, String genre, String rating,
							String country, String actorinfo, Date opendate, int state, String video,
							MultipartFile moviefile,
							Model model) {
		String path=sc.getRealPath("/resources/images/movieupload"); //업로드 할 경로 얻어오기
		String movieimg=moviefile.getOriginalFilename();
		//중복 파일명은 없는 걸로
		try {
			InputStream is=moviefile.getInputStream();
			File f=new File(path + "\\" + movieimg);
			FileOutputStream fos=new FileOutputStream(f);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			
			Movie_MVo vo=new Movie_MVo(0, moviename, runtime, director, genre, rating, country, actorinfo, movieimg, null, state, video);
			service.insert(vo);
			model.addAttribute("msg", "success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "fail");
		}
		return "movie/result.tiles";
		
	}
}
