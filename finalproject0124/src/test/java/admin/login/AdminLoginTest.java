package admin.login;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.service.AdminService;
import com.test.finalproject.vo.AdminVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-config.xml"})
public class AdminLoginTest {

	@Autowired
	private AdminService service;
	
	@Test
	public void login() {
		AdminLoginForm form = new AdminLoginForm();
		form.setAid("admin001");
		form.setApwd("qwer1234!@");
		
		AdminVo vo = service.login(form).orElseGet(null);
		
		Assert.assertNotNull(vo);
	}
}
