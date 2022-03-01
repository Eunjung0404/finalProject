<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
</head>
<body>
test/test/test/test/test<br>
test/test/test/test/test<br>
test/test/test/test/test<br>
test/test/test/test/test<br>
test/test/test/test/test<br>
<input type="hidden" value="${secretKey.getEncoded() }" id="key">
<input type="hidden" value="${text }" id="text">
<script type="text/javascript">
	window.onload = () => {
		console.log("load");
		//let key = btoa(document.getElementById('key').value);
		let key = document.getElementById('key').value;
		let text = document.getElementById('text').value;
		console.log("key->", key);
		console.log("text->",text);
		//aes128EncodeData = text;
		aes128Encode(key, '', 'hello');
		aes128Decode(key, '', aes128EncodeData);
		
	};
	let aes128EncodeData = '';
	let aes128DecodeData = ''
	function aes128Encode(secretKey, Iv, data){
		console.log("");
		console.log("[aes128Encode] : [start]");
		console.log("[secretKey] : " + secretKey); 
		console.log("[Iv] : " + Iv); 
		console.log("[data] : " + data);  		
		console.log("");

		// [aes 인코딩 수행 실시 : cbc 모드]
		const cipher = CryptoJS.AES.encrypt(data, CryptoJS.enc.Utf8.parse(secretKey), {
			iv: CryptoJS.enc.Utf8.parse(Iv), // [Enter IV (Optional) 지정 방식]
			padding: CryptoJS.pad.Pkcs7,
			mode: CryptoJS.mode.ECB // [cbc 모드 선택]
		});

		// [인코딩 된 데이터 확인 실시]
		aes128EncodeData = cipher.toString();
		console.log("");
		console.log("[aes128Encode] : [encode]");
		console.log("[data] : " + aes128EncodeData);  		
		console.log("");
	};
	function aes128Decode(secretKey, Iv, data){
		console.log("");
		console.log("[aes128Decode] : [start]");
		console.log("[secretKey] : " + secretKey); 
		console.log("[Iv] : " + Iv); 
		console.log("[data] : " + data);  		
		console.log("");

		// [aes 디코딩 수행 실시 : cbc 모드]
		const cipher = CryptoJS.AES.decrypt(data, CryptoJS.enc.Utf8.parse(secretKey), {
			iv: CryptoJS.enc.Utf8.parse(Iv), // [Enter IV (Optional) 지정 방식]
			padding: CryptoJS.pad.Pkcs7,
			mode: CryptoJS.mode.ECB // [cbc 모드 선택]
		});

		// [인코딩 된 데이터 확인 실시]
		aes128DecodeData = cipher.toString(CryptoJS.enc.Utf8);    		
		console.log("");
		console.log("[aes128Decode] : [decode]");
		console.log("[data] : " + aes128DecodeData);  		
		console.log("");
	};
</script>
test
</body>
</html>