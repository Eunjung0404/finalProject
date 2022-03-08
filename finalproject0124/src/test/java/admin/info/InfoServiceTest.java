package admin.info;

import com.test.finalproject.form.AdminInfoForm;
import com.test.finalproject.service.AdminService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-config.xml"})
public class InfoServiceTest {

    @Autowired
    private AdminService service;

    @Before
    public void 삽입() {
        AdminInfoForm info = new AdminInfoForm();
        info.setAid("test999");
        info.setApwd("qwer1234!@");
        info.setAlevel(1);
        info.setTheatername("ALL");
        service.insert(info);
    }

    @Test
    @Transactional
    public void 조회() {

    }

    @Test
    @Transactional
    public void 수정() {

    }

    @Test
    @Transactional
    public void 삭제() {

    }
}
