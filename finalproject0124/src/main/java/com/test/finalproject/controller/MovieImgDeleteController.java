package com.test.finalproject.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.MovieImgService_hj;

@Controller
public class MovieImgDeleteController {
	@Autowired private MovieImgService_hj service;
	@Autowired private ServletContext sc;
	
//	@GetMapping("/movie/delete")
//	public String moviedelete(int mimgcode, Model model) {
//		try {
//			String fileName=service.movieimglist(moviecode);
//			String path=sc.getRealPath("/resources/images/stillcutupload");
//			File f=new File(path + "\\" + imgname);
//			if(f.exists()) {
//				f.delete();
//			}
//			service.moviedelete(mimgcode);
//			model.addAttribute("code","success");
//			return "movie/result.tiles";
//		}catch(Exception e) {
//			e.printStackTrace();
//			model.addAttribute("code","fail");
//			return "movie/result.tiles";
//		}
//	}
}
