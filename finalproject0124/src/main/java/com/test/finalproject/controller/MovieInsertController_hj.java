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
	
	@GetMapping("/movieinsert")
	public String movieForm() {
		return "movieinsert.tiles";
	}
	
	@PostMapping("/movieinsert")
	public String movieinsert(String moviename, int runtime, String director, String genre, String rating,
							String country, String actorinfo, Date opendate, int state, String video,
							MultipartFile file1,
							Model model) {
		String path=sc.getRealPath("/resources/imgtest"); //업로드 할 경로 얻어오기
		String movieimg=file1.getOriginalFilename(); //전송된 파일명
		//중복 파일명은 없는 걸로
		try {
			InputStream is=file1.getInputStream();
			File f=new File(path + "\\");
			FileOutputStream fos=new FileOutputStream(f);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			
			//DB저장
			Movie_MVo vo=new Movie_MVo(0, moviename, runtime, director, genre, rating, country, actorinfo, movieimg, null, state, video);
			service.insert(vo);
			model.addAttribute("msg", "정상적으로 등록되었습니다");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "등록 실패!");
		}
		return "result.tiles";
		
	}
}
