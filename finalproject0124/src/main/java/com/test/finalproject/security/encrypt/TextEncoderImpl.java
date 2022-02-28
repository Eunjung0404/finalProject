package com.test.finalproject.security.encrypt;

import java.net.URLDecoder;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

import org.springframework.stereotype.Component;
import org.springframework.util.Base64Utils;

@Component
public class TextEncoderImpl implements TextEncoder {

	private final KeyGenerator generator;
	
	public TextEncoderImpl() throws NoSuchAlgorithmException {
		generator = KeyGenerator.getInstance("AES");
		generator.init(128);
	}
	
	@Override
	public SecretKey getSecretKey() {
		return generator.generateKey();
	}

	@Override
	public String doEncrypt(String text, SecretKey secretKey) throws Exception {
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, secretKey);
		return String.valueOf(Base64Utils.encodeToString(cipher.doFinal(text.getBytes())));
	}

	@Override
	public String doDecrypt(String text, SecretKey secretKey) throws Exception {
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, secretKey);
		byte[] b = Base64Utils.decode(text.getBytes());
		return new String(cipher.doFinal(b), "UTF-8");
	}

}
