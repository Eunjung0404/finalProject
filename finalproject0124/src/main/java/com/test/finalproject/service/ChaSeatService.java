package com.test.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mybatis.mapper.ChaSeatMapper;

@Service
public class ChaSeatService {
  @Autowired private ChaSeatMapper mapper;
  
  public int insertseatList(HashMap<String, Object> map)
  {
	  return mapper.insertseatList(map);
  }
  public int insertseatinfo(HashMap<String, Object> map)
  {
	  return mapper.insertseatinfo(map);
  }
  
  public List<Integer> selectseatcode(int screencode)
  {
	  return mapper.selectseatcode(screencode);
  }
  
  public List<HashMap<String, Object>> seatLsit(HashMap<String, Object> map)
  {
	  return mapper.seatLsit(map);
  }
 
  public int getseatrow(int screencode)
  {
	  return mapper.getseatrow(screencode);
  }
  
  public int getseatcol(int screencode)
  {
	  return mapper.getseatcol(screencode);
  }
}
