package com.test.finalproject.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.finalproject.service.ChaReservationService;
import com.test.finalproject.vo.TiketParameterVo;

@Controller
public class ChaReservationController {

	@Autowired
	ChaReservationService service;

	

}
