package com.test.finalproject.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class FormData {
	private int moviecode;
	private String moviename;
	private int runtime;
	private String director;
	private String genre;
	private String rating;
	private String country;
	private String actorinfo;
	private Date opendate;
	private int state;
	private String video;
	private int count;
	private MultipartFile file1;
}
