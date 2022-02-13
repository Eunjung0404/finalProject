package com.test.finalproject.controller.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.error.exception.FormBindException;
import com.test.finalproject.form.AdminInfoForm;
import com.test.finalproject.form.AdminInfoSelect;
import com.test.finalproject.form.ResultForm;
import com.test.finalproject.service.AdminService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/admin/info", produces = {MediaType.APPLICATION_JSON_VALUE})
@RequiredArgsConstructor
public class AdminInfoAPIController {

	private final AdminService service;
	
	@GetMapping("/list")
	public List<AdminInfoSelect> getList() {
		return service.getList();
	}
	
	@PostMapping
	public ResultForm insert(
				@Valid @RequestBody AdminInfoForm form,
				BindingResult bindingResult
			) {
		if(bindingResult.hasErrors()) {
			throw new FormBindException("잘 못된 입력");
		}
		service.insert(form);
		return new ResultForm("success", "등록 되었습니다.");
	}
	
	@PutMapping
	public ResultForm update(
				@Valid @RequestBody AdminInfoForm form,
				BindingResult bindingResult
			) {
		if(bindingResult.hasErrors()) {
			throw new FormBindException("잘 못된 입력");
		}
		service.update(form);
		return new ResultForm("success", "수정 되었습니다.");
	}
	
	@DeleteMapping("/{aid}")
	public ResultForm delete(@PathVariable String aid) {
		service.delete(aid);
		return new ResultForm("success", "삭제 되었습니다.");
	}
	
	@GetMapping("/show/{aid}")
	public ResultForm show(@PathVariable String aid) {
		String apwd = service.getPassword(aid);
		return new ResultForm("success", apwd);
	}
	
}
