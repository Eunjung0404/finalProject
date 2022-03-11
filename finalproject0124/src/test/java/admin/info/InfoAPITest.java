package admin.info;

import com.test.finalproject.vo.AdminVo;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-config.xml",
        "file:src/main/webapp/WEB-INF/spring/tile-define.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class InfoAPITest {

    @Autowired
    private WebApplicationContext ctx;

    private MockMvc mockMvc;
    private MockHttpSession session;

    @BeforeClass
    public void setAdminSession() {
        AdminVo admin = new AdminVo();
        admin.setAlevel(1);

        session = new MockHttpSession();
        session.setAttribute("admin", admin);
    }

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void getList() {

    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void postAdmin() {

    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void putAdmin() {

    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void deleteAdmin() {

    }

}
