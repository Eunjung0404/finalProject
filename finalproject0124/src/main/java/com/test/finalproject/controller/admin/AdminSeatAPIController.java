package com.test.finalproject.controller.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.error.exception.FormBindException;
import com.test.finalproject.form.ResultForm;
import com.test.finalproject.form.SeatForm;
import com.test.finalproject.service.SeatService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/test/theater/{theatername}/{screencode}"
			, produces = {MediaType.APPLICATION_JSON_VALUE})
@RequiredArgsConstructor
public class AdminSeatAPIController {

	private final SeatService service;
	
	@PostMapping
	public ResultForm insert(
				@Valid @RequestBody List<SeatForm> list,
				BindingResult bindingResult,
				@PathVariable int screencode
			) {
		if(bindingResult.hasErrors()) {
			throw new FormBindException("잘 못된 입력");
		}
		list.forEach(System.out::println);
		System.out.println(service.insert(list, screencode));
		return new ResultForm("success", "등록 되었습니다.");
	}
	
	@PutMapping
	public ResultForm update(
				@Valid @RequestBody List<SeatForm> list,
				BindingResult bindingResult,
				@PathVariable int screencode
			) {
		if(bindingResult.hasErrors()) {
			throw new FormBindException("잘 못된 입력");
		}
		service.update(screencode, list);
		return new ResultForm("success", "수정 되었습니다.");
	}
	
	@DeleteMapping("/seat")
	public ResultForm delete(@PathVariable int screencode) {
		service.delete(screencode);
		return new ResultForm("success", "삭제 되었습니다.");
	}
	
}
