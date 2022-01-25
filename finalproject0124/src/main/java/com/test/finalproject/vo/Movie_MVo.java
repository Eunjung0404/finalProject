package com.test.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Movie_MVo {
	private int moviecode;
	private String moviename;
	private int runtime;
	private String director;
	private String genre;
	private String rating;
	private String country;
	private String actorinfo;
	private String movieimg;
	private Date opendate;
	private int state;
	private String video;
}
