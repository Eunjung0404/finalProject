package admin.info;

import com.test.finalproject.form.AdminInfoForm;
import com.test.finalproject.form.AdminInfoSelect;
import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.service.AdminService;
import com.test.finalproject.vo.AdminVo;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-config.xml"})
public class InfoServiceTest {

    @Autowired
    private AdminService service;

    private static final String ID = "test999";
    private static final String PWD = "qwer1234!@";
    private static final int LEVEL = 1;
    private static final String THEATER = "ALL";

    private static final AdminLoginForm GET_ADMIN = new AdminLoginForm();

    @BeforeClass
    public static void setGET_ADMIN() {
        GET_ADMIN.setAid(ID);
        GET_ADMIN.setApwd(PWD);
    }

    @Before
    public void 삽입() {
        AdminInfoForm info = new AdminInfoForm();
        info.setAid(ID);
        info.setApwd(PWD);
        info.setAlevel(LEVEL);
        info.setTheatername(THEATER);
        service.insert(info);
    }

    @Test
    @Transactional
    public void 전체조회() {
        List<AdminInfoSelect> list = service.getList();

        assertFalse(list.isEmpty());
    }

    @Test
    @Transactional
    public void 수정() {
        int updateLevel = 2;

        AdminInfoForm updateInfo = new AdminInfoForm();
        updateInfo.setAid(ID);
        updateInfo.setApwd(PWD);
        updateInfo.setAlevel(updateLevel);
        updateInfo.setTheatername(THEATER);

        int exeRow = service.update(updateInfo);
        assertEquals(exeRow, 1);

        AdminVo admin = service.login(GET_ADMIN);
        assertEquals(admin.getAlevel(), updateLevel);
    }

    @Test
    @Transactional
    public void 삭제() {
        int exeRow = service.delete(ID);
        assertEquals(exeRow, 1);

        AdminVo admin = service.login(GET_ADMIN);
        assertNull(admin);
    }

    @Test
    @Transactional
    public void 비밀번호_조회() {
        String selectPwd = service.getPassword(ID);
        assertEquals(selectPwd, PWD);
    }

}
