package com.test.finalproject.error.advice;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.test.finalproject.error.exception.AdminCheckException;
import com.test.finalproject.error.exception.FormBindException;
import com.test.finalproject.error.exception.NoSearchSqlException;
import com.test.finalproject.form.ResultForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestControllerAdvice(annotations = RestController.class)
public class GlobalAPIExceptionAdvice {

	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ResultForm allException(Exception ex) {
		log.error(ex.getMessage());
		ex.printStackTrace();
		return new ResultForm("fail", "서버 오류 발생");
	}
	
	@ExceptionHandler(FormBindException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public ResultForm formbind(FormBindException ex) {
		log.error(ex.getMessage());
		return new ResultForm("fail", ex.getMessage());
	}
	
	@ExceptionHandler(AdminCheckException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ResultForm adminCheck(AdminCheckException ex) {
		log.error(ex.getMessage());
		return new ResultForm("fail", ex.getMessage());
	}
	
	@ExceptionHandler(NoSearchSqlException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public ResultForm noSearchSql(NoSearchSqlException ex) {
		log.error(ex.getMessage());
		return new ResultForm("fail", ex.getMessage());
	}
	
}
