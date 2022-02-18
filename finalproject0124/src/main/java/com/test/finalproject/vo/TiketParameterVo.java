package com.test.finalproject.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class TiketParameterVo {
  private String moviecode;
  private String moviename;
  private String theatercode;
  private String theatername;
  private Date screendate;
  private String screencode;
  private String screenname;
  private String timecode;
  private String screentime;
  private String movieimgname;
  private String movienamehtml;
}
