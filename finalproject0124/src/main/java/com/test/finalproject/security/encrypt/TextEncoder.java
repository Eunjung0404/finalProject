package com.test.finalproject.security.encrypt;

import java.security.NoSuchAlgorithmException;

import javax.crypto.SecretKey;

public interface TextEncoder {

	SecretKey getSecretKey();
	
	String doEncrypt(String text, SecretKey secretKey) throws Exception;
	
	String doDecrypt(String text, SecretKey secretKey) throws Exception;
	
}
