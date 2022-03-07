package admin.login;

import com.test.finalproject.form.AdminInfoForm;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.service.AdminService;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-config.xml"})
public class AdminLoginTest {

	@Autowired
	private AdminService service;

	@Before
	public void setAdmin() {
		AdminInfoForm info = new AdminInfoForm();
		info.setAid("test999");
		info.setApwd("qwer1234!@");
		info.setAlevel(1);
		info.setTheatername("ALL");
		service.insert(info);
	}

	@Test
	@Transactional
	public void 로그인성공() {
		String inputId = "test999";

		AdminLoginForm form = new AdminLoginForm();
		form.setAid(inputId);
		form.setApwd("qwer1234!@");

		String outputId = Optional.ofNullable(service.login(form))
				.map(v -> v.getAid())
				.orElse("empty");

		assertEquals(inputId, outputId);
	}

	@Test
	@Transactional
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
