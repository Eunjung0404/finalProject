package admin.login;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.service.AdminService;

import java.util.Optional;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-config.xml"})
public class AdminLoginTest {

	@Autowired
	private AdminService service;
	
	@Test
	public void 로그인성공() {
		String inputId = "admin001";

		AdminLoginForm form = new AdminLoginForm();
		form.setAid(inputId);
		form.setApwd("qwer1234!@");

		String outputId = Optional.ofNullable(service.login(form))
				.map(v -> v.getAid())
				.orElse("empty");

		assertEquals(inputId, outputId);
	}

	@Test
	public void 로그인실패() {
		String inputId = "user001";

		AdminLoginForm form = new AdminLoginForm();
		form.setAid(inputId);
		form.setApwd("qwer1234!@");

		String outputId = Optional.ofNullable(service.login(form))
				.map(v -> v.getAid())
				.orElse("empty");

		assertEquals(outputId, "empty");
	}
}
